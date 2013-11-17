package com.ifaru.html.util;


import java.util.ArrayList;
import java.util.List;

import com.ifaru.framework.FrameworkConstants;

public class AlphabeticLinks {

 private String href;
 private String requestParamName = FrameworkConstants.ALPHABETIC_ORDER_PARAM_NAME;

  /**
   * @return the alphabetLinks
   */
  public List getAlphabetsLink() {

    char[] alphabets = getAlphabets();
    List list = new ArrayList();
    for (int i=0; i<alphabets.length; i++) {
      HtmlAnchorTag aLink = new HtmlAnchorTag();
      aLink.setHref(getHref());
      aLink.setRequestParamName(getRequestParamName());
      aLink.setRequestParamValue(String.valueOf(alphabets[i]));
      aLink.setContent(String.valueOf(alphabets[i]));
      list.add(aLink);
    }
    HtmlAnchorTag aLink = new HtmlAnchorTag();
    aLink.setHref(getHref());
    aLink.setRequestParamName(getRequestParamName());
    aLink.setRequestParamValue("All");
    aLink.setContent("All");
    list.add(aLink);
    return list;
  }

  /**
   * @return the href
   */
  public String getHref() {
    return href;
  }

  /**
   * @param href the href to set
   */
  public void setHref(String href) {
    this.href = href;
  }

  /**
   * @return the requestParamName
   */
  public String getRequestParamName() {
    return requestParamName;
  }

  /**
   * @param requestParamName the requestParamName to set
   */
  public void setRequestParamName(String requestParamName) {
    this.requestParamName = requestParamName;
  }
  
  public static char[] getAlphabets() {
    char[] alphabets = new char[26];
    int charVal = 65;
    for (int i=0; i<26; i++) {
      alphabets[i] = (char)charVal++;
    }
    return alphabets;
  }
  
  public static void main(String args[]) {
    AlphabeticLinks links = new AlphabeticLinks();
    links.setHref("test");
    List list = links.getAlphabetsLink();
    for (int i=0; i<list.size(); i++) {
      System.out.println(list.get(i));
    }
    
  }
  
}
