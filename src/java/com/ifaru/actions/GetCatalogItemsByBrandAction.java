package com.ifaru.actions;


import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.catalog.Brand;
import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.CatalogItems;
import com.ifaru.catalog.Information;
import com.ifaru.catalog.Size;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.gallery.Image;

public class GetCatalogItemsByBrandAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    return getItemsByCategory(request, mapping);

  }

  private ActionForward getItemsByCategory(HttpServletRequest request, ActionMapping mapping) {
    String mn = "getItemsByCategory";
    Iterator iter = catalogItems.getItems().iterator();
    CatalogItems newSet = new CatalogItems();
    String requestedBrand = request.getParameter(FrameworkConstants.BRAND_REQUEST_PARAMETER_NAME);
    if (requestedBrand == null || brandTree.get(requestedBrand) == null) {
      /* this is a spurious url
       * just return the whole catalog
       */
      request.getSession(true).setAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY, catalogItems);
      return mapping.findForward(FrameworkConstants.DEFAULT_KEY);      
    }
    requestedBrand = requestedBrand.trim().toUpperCase();
    while (iter.hasNext()) {
      CatalogItem catalogItem = (CatalogItem)iter.next();
      String brandId = catalogItem.getBrandId();
      msg (mn, new Object[] {catalogItem.getName(), " has brand: ", brandId});
      if (brandId != null && !brandId.trim().equals("") && brandId.equals(requestedBrand)) {
        newSet.addItem(catalogItem);
      }

    }
    String requestedBrandName = ((Brand)brandTree.get(requestedBrand)).getName();
    if (newSet.getItems() == null || newSet.getItems().isEmpty()) {
      msg (mn, new Object[] {"No items found of brand id:", requestedBrand, " name: ", requestedBrandName});
    }
    //log(newSet);
    request.getSession().setAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY, newSet);
    request.getSession().setAttribute(FrameworkConstants.BRAND_SEARCH_FLAG, requestedBrandName);    
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
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
