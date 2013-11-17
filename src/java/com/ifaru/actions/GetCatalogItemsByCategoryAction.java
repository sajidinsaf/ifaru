package com.ifaru.actions;


import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.CatalogItems;
import com.ifaru.catalog.Category;
import com.ifaru.catalog.Information;
import com.ifaru.catalog.Size;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.gallery.Image;

public class GetCatalogItemsByCategoryAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    return getItemsByCategory(request, mapping);

  }

  private ActionForward getItemsByCategory(HttpServletRequest request, ActionMapping mapping) {
    String mn = "getItemsByCategory";
    Iterator iter = catalogItems.getItems().iterator();
    CatalogItems newSet = new CatalogItems();
    String requestedCategory = request.getParameter(FrameworkConstants.CATEGORY_REQUEST_PARAMETER_NAME).trim().toUpperCase();
    while (iter.hasNext()) {
      CatalogItem catalogItem = (CatalogItem)iter.next();
      String categoryIds = catalogItem.getCategoryIds();
      msg (mn, catalogItem.getName() + " has categories: "+ categoryIds);
      if (categoryIds != null && !categoryIds.trim().equals("")) {
        StringTokenizer st = new StringTokenizer(catalogItem.getCategoryIds(),
            "-");
        while (st.hasMoreTokens()) {
          String id = st.nextToken().trim().toUpperCase();
          if (id.equals(requestedCategory)) {
            newSet.addItem(catalogItem);
          }
        }
      }
    }
    String requestedCategoryName = findCategoryName(requestedCategory);
    //log(newSet);
    request.getSession(true).setAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY, newSet);
    request.getSession().setAttribute(FrameworkConstants.CATEGORY_SEARCH_FLAG, requestedCategoryName);       
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }


  
  private String findCategoryName(String requestedCategory) {
    String mn = "findCategoryName";
    String name = "";
    Iterator iter = categoryTree.getTopLevelCategories().values().iterator();
    while (iter.hasNext()) {
      Category topCat = (Category)iter.next();
      if (topCat.getId().equalsIgnoreCase(requestedCategory)) {
        name = topCat.getName();
        break;
      }
      Iterator subIter = topCat.getSubCategories().values().iterator();
      while (subIter.hasNext()) {
        Category subCat = (Category) subIter.next();
        if (subCat.getId().equalsIgnoreCase(requestedCategory)) {
          name = subCat.getName();
        }
      }
    }
    msg (mn, new Object[] {"Matched category name: ", name, " to requested category id: ", requestedCategory});
    return name;
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
