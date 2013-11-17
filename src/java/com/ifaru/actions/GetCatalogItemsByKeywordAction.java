package com.ifaru.actions;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import com.ifaru.catalog.Brand;
import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.CatalogItems;
import com.ifaru.catalog.Category;
import com.ifaru.catalog.Information;
import com.ifaru.catalog.Size;
import com.ifaru.catalog.Searchable;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.gallery.Image;

/**
 * Run through the catalog and tries to match all items in query
 *
 * Keywords are searched in the following locations:
 * 1. Keywords in category and brand.
 * 2. Item name 
 * 3. Item descripton
 * 
 * Search is done as follow:
 * Determine whether the search is on a keyword or phrase.
 *   If it is word look for all keyword matches for the word in the location mentioned above.
 *   If it a phrase, first look for matches to the phrase, then look for matches to each word in the phrase.
 *
 *
 * @author Sajid Insaf
 */
public class GetCatalogItemsByKeywordAction extends IFaruBaseAction {
  private final static String SEARCH_STRING_TOKENIZER = FrameworkConstants.KEYWORD_SEPARATOR;
  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    
    return getItemsByKeyword(request, form, mapping);

  }

  private ActionForward getItemsByKeyword(HttpServletRequest request, ActionForm form, ActionMapping mapping) {
    String mn = "getItemsByKeyword";
    CatalogItems newSet = new CatalogItems();

    String searchString = getSearchString(request, form);  
    /* if the user has entered a blank search or if this a spurious request, return the whole catalog
     * */
    if (searchString == null || searchString.trim().equals("")) {
      newSet = catalogItems;
    } else {
      Map items = search(searchString);
      newSet.setItems(new ArrayList(items.values()));
    }
    request.getSession().setAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY, newSet);
    request.getSession().setAttribute(FrameworkConstants.KEYWORD_SEARCH_FLAG, searchString);    
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }


  /**
   * get the search string from the request paramter and remove common words
   * @param request
   * @param form
   * @return
   */
  private String getSearchString(HttpServletRequest request, ActionForm form) {
    String mn = "getSearchString";
    Object so = ((DynaActionForm)form).get("text");
    StringBuffer ids = new StringBuffer();
    if ( so != null && !so.equals("")) {
      /* prepare the search String */
      String str = prepareSearchString(so.toString());
      
      /* find all space delimited words */
      StringTokenizer st = new StringTokenizer(str, SEARCH_STRING_TOKENIZER);
      while (st.hasMoreTokens()) {
        String token = st.nextToken().trim();
        if (!isCommonWord(token)) {
          if (!ids.toString().trim().equals("")) {
            ids.append(" ");
          }
          ids.append(token);
        } else {
          msg(mn, new Object[] {"Ignoring common word: ", token});
        }
      }
    }
    String str = ids.toString();
    msg (mn, new Object[] {"Created search string: ", str});
    return str;
  }
  
  private String prepareSearchString(String so) {
    String mn = "prepareSearchString";
    /* replace spurious characters with spaces*/
    StringBuffer sb = new StringBuffer();
    char[] chars = so.toCharArray();
    for (int i=0; i<chars.length; i++) {
      int intVal = (int)chars[i];
      /* The int value of this ascii character must only represent a number or and alphabet */
      /* see end of file for ascii values from 0 - 254*/
      if (intVal < 48 || (intVal > 57 && intVal < 65) || (intVal >90 && intVal<97) || intVal > 122) {
        msg(mn, new Object[] {chars[i], " with ascii value ", intVal, " is a special character"});        
        msg(mn, new Object[]{"ignoring special character: ", chars[i]});
        sb.append(SEARCH_STRING_TOKENIZER);
      } else {
        sb.append(chars[i]);
      }
    }
    return sb.toString();
  }

  private boolean isCommonWord(String str) {
    for (int i=0;i<FrameworkConstants.commonWords.length; i++) {
      if (FrameworkConstants.commonWords[i].equalsIgnoreCase(str)) {
        return true;
      }
    }
    return false;
  }

  private Map search(String searchStr) {
    String mn = "search(String)";
    Map items = new HashMap();
    items.putAll(searchByPhrase(searchStr));
    items.putAll(searchByWords(searchStr));
    return items;
  }

  private Map searchByPhrase(String searchStr) {
    Map items = new HashMap();
    items.putAll(doSearch(searchStr));
    return items;
  }

  private Map searchByWords(String searchStr) {
    Map items = new HashMap();
    
    StringTokenizer st = new StringTokenizer(searchStr, " ");
    while (st.hasMoreTokens()) {
      items.putAll(doSearch(st.nextToken())); 
    }
    return items;
  }

  private Map doSearch(String keyStr) {
    Map items = new HashMap(10);  
    items.putAll(searchCategories(keyStr));
    items.putAll(searchBrands(keyStr)); 
    items.putAll(searchItems(keyStr));      
    return items;
  }
  
  /**
   * Search the keyword list of each category. If there is match add all items for that category to the list
   * @param keyStr
   * @return
   */
  private Map searchCategories(String keyStr) {
    Map list = new HashMap();
    Iterator topCats = categoryTree.getTopLevelCategories().values().iterator();
    while (topCats.hasNext()) {
      Category cat = (Category) topCats.next();
      list.putAll(searchCategory(cat, keyStr));
      Iterator subCats = cat.getSubCategories().values().iterator();
      while (subCats.hasNext()) {
        Category subCat = (Category) subCats.next();
        list.putAll(searchCategory(subCat, keyStr));
      }
    }
    return list;
  }
  
  /**
   * If this category has a keyword match for the search string
   * find all items related to this category and add them to the 
   * map to return
   * @param cat
   * @param keyStr
   * @return
   */
  private Map searchCategory(Category cat, String keyStr) {
    Map itemsFound = new HashMap();       
    if (containsKeyword(cat, keyStr)) {
      Iterator items = catalogItems.getItems().iterator();
      while (items.hasNext()) {
        CatalogItem item = (CatalogItem)items.next();
        if (item.getCategoryIds().indexOf(cat.getId()) != -1) {
          itemsFound.put(item.getId(), item);
        }
      }
    }
    return itemsFound;
  }
  
  private Map searchBrands(String keyStr) {
    String mn="searchBrands";
    Map itemsFound = new HashMap();
    Iterator iter = brandTree.values().iterator();
    while (iter.hasNext()) {
      Brand brand = (Brand) iter.next();
      if (containsKeyword(brand, keyStr)) {
        Iterator items = catalogItems.getItems().iterator();
        while (items.hasNext()) {
          CatalogItem item = (CatalogItem)items.next();
          String itemBrandId = item.getBrandId();
          String brandId = brand.getId();
          msg(mn, new Object[]{"Looking up brand Id: ", brandId, " in item: ",item.getName(),". Item has brand id: ",itemBrandId});
          if (itemBrandId.equals(brandId)) {
            itemsFound.put(item.getId(), item);
          }
        }        
      }

    }
    return itemsFound;
    //log(newSet);    
  }
  
  private Map searchItems(String keyStr) {
    Map itemsFound = new HashMap();    
    Iterator items = catalogItems.getItems().iterator();
    while (items.hasNext()) {
      CatalogItem item = (CatalogItem)items.next();
      if (containsKeyword(item, keyStr)) {
        itemsFound.put(item.getId(), item);
      }
    }           
    return itemsFound;
  }
  
  private boolean containsKeyword(Searchable so, String keyword) {
    
    StringTokenizer st = new StringTokenizer(so.getKeywords(), SEARCH_STRING_TOKENIZER);
    while (st.hasMoreTokens()) {
      if (st.nextToken().trim().toLowerCase().indexOf(keyword.trim().toLowerCase()) != -1) {
        return true;
      }
    }
    return false;
  }
  
  public static void log(CatalogItems catalogItems) {
        List frags = catalogItems.getItems();
        System.out.println("Number of Items: "+ frags.size());
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        System.out.println("");                

        for (int j=0; j<frags.size(); j++) {
          CatalogItem item = (CatalogItem) frags.get(j);
          System.out.println(item);            
          List prices = item.getSizes();
          System.out.println("Prices collection size: "+prices.size());
          for (int p=0; p<prices.size(); p++) {
            Size size = (Size)prices.get(p);
            System.out.println(size);
            System.out.println("Price Stock: "+size.getStock());   
            System.out.println("Price size: "+size.getSize());
            System.out.println("SalePrice: "+size.getSalePrice());          
            System.out.println("===================================");
            System.out.println("");
          }
          
          
          Information info = item.getInformation();
          if (info != null) {
              System.out.println("Information URL: "+info.getUrl());
          } else {
            System.out.println("No information available");
          }
          
          Image image = item.getImage();
          if (image != null) {
            System.out.println("Image Source: "+image.getSrc());
            System.out.println("Image Thumb: "+image.getThumbnail());
          }
     
        }

  }  
}

/*

0= 
1=
2=
3=
4=
5=
6=
7=
8=
9=  
10=

11=
12=
13=

14=
15=
16=
17=
18=
19=
20=
21=
22=
23=
24=
25=
26=
27=
28=
29=
30=
31=
32= 
33=!
34="
35=#
36=$
37=%
38=&
39='
40=(
41=)
42=*
43=+
44=,
45=-
46=.
47=/
48=0
49=1
50=2
51=3
52=4
53=5
54=6
55=7
56=8
57=9
58=:
59=;
60=<
61==
62=>
63=?
64=@
65=A
66=B
67=C
68=D
69=E
70=F
71=G
72=H
73=I
74=J
75=K
76=L
77=M
78=N
79=O
80=P
81=Q
82=R
83=S
84=T
85=U
86=V
87=W
88=X
89=Y
90=Z
91=[
92=\
93=]
94=^
95=_
96=`
97=a
98=b
99=c
100=d
101=e
102=f
103=g
104=h
105=i
106=j
107=k
108=l
109=m
110=n
111=o
112=p
113=q
114=r
115=s
116=t
117=u
118=v
119=w
120=x
121=y
122=z
123={
124=|
125=}
126=~
127=
128=?
129=?
130=?
131=?
132=?
133=?
134=?
135=?
136=?
137=?
138=?
139=?
140=?
141=?
142=?
143=?
144=?
145=?
146=?
147=?
148=?
149=?
150=?
151=?
152=?
153=?
154=?
155=?
156=?
157=?
158=?
159=?
160= 
161=¡
162=¢
163=£
164=¤
165=¥
166=¦
167=§
168=¨
169=©
170=ª
171=«
172=¬
173=­
174=®
175=¯
176=°
177=±
178=²
179=³
180=´
181=µ
182=¶
183=·
184=¸
185=¹
186=º
187=»
188=¼
189=½
190=¾
191=¿
192=À
193=Á
194=Â
195=Ã
196=Ä
197=Å
198=Æ
199=Ç
200=È
201=É
202=Ê
203=Ë
204=Ì
205=Í
206=Î
207=Ï
208=Ð
209=Ñ
210=Ò
211=Ó
212=Ô
213=Õ
214=Ö
215=×
216=Ø
217=Ù
218=Ú
219=Û
220=Ü
221=Ý
222=Þ
223=ß
224=à
225=á
226=â
227=ã
228=ä
229=å
230=æ
231=ç
232=è
233=é
234=ê
235=ë
236=ì
237=í
238=î
239=ï
240=ð
241=ñ
242=ò
243=ó
244=ô
245=õ
246=ö
247=÷
248=ø
249=ù
250=ú
251=û
252=ü
253=ý
254=þ

*/