package com.ifaru.actions;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.CatalogItemFactory;
import com.ifaru.catalog.CatalogItems;
import com.ifaru.catalog.Information;
import com.ifaru.catalog.Size;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.gallery.Image;

public class GetCatalogItemsAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
      String mn = "iExecute";
    
    CatalogItems origSet = (CatalogItems) request.getSession(true).getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY);
    msg(mn, new Object[]{"original set for this session is: ", origSet});
    if (origSet == null) {
      origSet = catalogItems;
    }
    String alphabet = request.getParameter(FrameworkConstants.ALPHABETIC_ORDER_PARAM_NAME);    
    if (alphabet != null && !alphabet.toLowerCase().endsWith("all")) {
      origSet = catalogItems;
      return getAlphabeticFragrances(origSet, alphabet, request, mapping);
    } else if (alphabet != null && alphabet.toLowerCase().endsWith("all")) {
      request.getSession(true).setAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY, catalogItems);
    }
    //log(catalogItems);
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }


  private ActionForward getAlphabeticFragrances(CatalogItems catalogItems, String alphabet, HttpServletRequest request, ActionMapping mapping) {
    String mn = "getAlphabeticFragrances";
    msg(mn, new String[] {"Getting items for alphabet: ", alphabet});
    Iterator iter = catalogItems.getItems().iterator();
    CatalogItems newSet = new CatalogItems();
    while (iter.hasNext()) {
      CatalogItem catalogItem = (CatalogItem)iter.next();
      if (catalogItem.getName().toUpperCase().startsWith(alphabet.toUpperCase())) {
        newSet.addItem(catalogItem);
      }
    }
    request.getSession(true).setAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY, newSet);
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }

  
  private void log(CatalogItems catalogItems) {
        List frags = catalogItems.getItems();
        log("Number of Items: "+ frags.size());
        log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        log("");                

        for (int j=0; j<frags.size(); j++) {
          CatalogItem item = (CatalogItem) frags.get(j);
          log(item.toString());            
          List prices = item.getSizes();
          log("Prices collection size: "+prices.size());
          for (int p=0; p<prices.size(); p++) {
            Size size = (Size)prices.get(p);
            log(size.toString());
            log("Price Stock: "+size.getStock());   
            log("Price size: "+size.getSize());
            log("SalePrice: "+size.getSalePrice());          
            log("===================================");
            log("");
          }
          
          
          Information info = item.getInformation();
          if (info != null) {
              log("Information URL: "+info.getUrl());
          } else {
            log("No information available");
          }
          
          Image image = item.getImage();
          if (image != null) {
            log("Image Source: "+image.getSrc());
            log("Image Thumb: "+image.getThumbnail());
          }
     
        }
  }  

  private void log(String str) {
    msg("log", str);
  }
}
