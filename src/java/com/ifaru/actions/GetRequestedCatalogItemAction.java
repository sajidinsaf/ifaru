package com.ifaru.actions;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.CatalogItemFactory;
import com.ifaru.catalog.CatalogItems;
import com.ifaru.catalog.Information;
import com.ifaru.catalog.Size;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.gallery.Image;

public class GetRequestedCatalogItemAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    String mn = "iExecute";
    String itemPriceFieldId = request.getParameter(FrameworkConstants.ITEM_PRICEFIELD_ID_PARAM_NAME);
    if(!validateRequest(request, form)) {
      return mapping.findForward(FrameworkConstants.INVALID_SESSION_KEY);
    }
    CatalogItems origSet = (CatalogItems) request.getSession(true).getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY);
    msg(mn, new Object[]{"original set for this session is: ", origSet});
    if (origSet == null) {
      origSet = catalogItems;
    }
    return getItem(origSet, itemPriceFieldId, request, mapping);
  }


  private ActionForward getItem(CatalogItems catalogItems, String itemPriceFieldId, HttpServletRequest request, ActionMapping mapping) {
    String mn = "getItem";
    msg(mn, new String[] {"Getting item with id: ", itemPriceFieldId});
    Iterator iter = catalogItems.getItems().iterator();
    CatalogItem item = null;
    while (iter.hasNext()) {
      CatalogItem catalogItem = (CatalogItem)iter.next();
      if (catalogItem.getPriceFieldId().equals(itemPriceFieldId)) {
        item = catalogItem;
        msg(mn, new Object[] {"Got item: ", item});
        break;
      }
    }
    request.getSession(true).setAttribute(FrameworkConstants.CATALOG_ITEM_KEY, item);
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }

  private boolean validateRequest(HttpServletRequest request, ActionForm form) {
    String mn = "validateRequest";
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY) == null) {
      msg(mn, "Invalid session - No catalog object");
      return false;
    }
    if (request.getParameter(FrameworkConstants.ITEM_PRICEFIELD_ID_PARAM_NAME) == null) {
      msg(mn, "Invalid request - No "+ FrameworkConstants.ITEM_PRICEFIELD_ID_PARAM_NAME + " parameter in request");      
      return false;
    }
    return true;
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
