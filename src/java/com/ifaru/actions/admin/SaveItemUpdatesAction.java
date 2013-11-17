package com.ifaru.actions.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.xml.sax.SAXException;
import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.Information;
import com.ifaru.catalog.Size;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruException;
import com.ifaru.gallery.Image;
import com.ifaru.security.sha.SystemUnavailableException;
import com.ifaru.util.Logger;

/**
 * This class does not extend IFaruBaseAction because we don't want it to be validated as a 
 * User action class. Maybe in future we need an IFaruAdminAction which will perform default admin
 * session validation actions.
 * 
 * 
 * @author Sajid Insaf
 *
 */
public class SaveItemUpdatesAction extends SaveUpdatesAction {

  protected Logger logger = Logger.getInstance();
  
  public ActionForward saveUpdates(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) throws IOException, SAXException, SystemUnavailableException, IFaruException {
    String mn = "iExecute";

    HttpSession session = request.getSession(true);
    session.removeAttribute(FrameworkConstants.SUCCESS_KEY);
    session.removeAttribute("alreadyExists");
    String loginToken = (String)session.getAttribute(FrameworkConstants.ADMIN_LOGIN_SUCCESS);
    if (loginToken == null) {
      return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
    } 

    DynaActionForm adminForm = (DynaActionForm) form;   
    String id = adminForm.getString("id").trim();                     
    String name = adminForm.getString("name");
    String description = adminForm.getString("description");
    String image_src = adminForm.getString("image_src");
    String image_thumbnail = adminForm.getString("image_thumbnail");
    String information_url = adminForm.getString("information_url");
    String size_size = adminForm.getString("size_size");
    String size_stock = adminForm.getString("size_stock");
    String size_salePrice = adminForm.getString("size_salePrice");
    String size_measurementUnit = adminForm.getString("size_measurementUnit");   
    String categoryIds = adminForm.getString("categoryIds");
    String brandId = adminForm.getString("brandId");                    
    String status = adminForm.getString("status");
    String gender = adminForm.getString("gender");
    String measurementUnit = adminForm.getString("measurementUnit");
    String quantityAvailable = adminForm.getString("quantityAvailable");
    String add = adminForm.getString("add");
    CatalogItem newItem = new CatalogItem();
    List<Size> newSizes = new ArrayList<Size>();
    Size size = new Size();
    size.setMeasurementUnit(size_measurementUnit);
    size.setSalePrice(size_salePrice);
    size.setStock(size_stock);
    size.setSize(size_size);
    newSizes.add(size);
    newItem.setSizes(newSizes);

    newItem.setBrandId(brandId);
    newItem.setCategoryIds(categoryIds);
    newItem.setDescription(description);
    newItem.setGender(gender);
    newItem.setId(id);
    
    Image image = new Image();
    image.setSrc(image_src);
    image.setThumbnail(image_thumbnail);
    newItem.setImage(image);
    Information info = new Information();
    info.setUrl(information_url);
    newItem.setInformation(info);
    newItem.setInformationUrl(information_url);
    newItem.setMeasurementUnit(measurementUnit);
    newItem.setName(name);
    newItem.setQuantityAvailable(quantityAvailable);
    newItem.setStatus(status);
    List<CatalogItem> items = catalogItems.getItems();
    //System.out.println(newItem);
    int counter = 0;
    boolean found = false;
    //System.out.println(items.size());
    for (CatalogItem item : items) {
      //System.out.println("Items id: ["+item.getId() + "] New Item Id: ["+newItem.getId()+"]");
      if (item.getId().equals(newItem.getId())) {
        found = true;
        break;
      }
      ++counter;
    }
    if (found && add != null && add.equals("true"))
    {
      session.setAttribute("alreadyExists", "Id: "+newItem.getId()+" already exists. If you wish to edit it, go to the Edit Item page");
    }
    else if (found) {
      items.remove(counter);
      items.add(counter, newItem);
    } else if (add != null && add.equals("true")) {
      items.add(newItem);
    } else {
      throw new IFaruException("No match found for item: "+newItem);
    }
    session.setAttribute("lastItem", newItem);
    session.setAttribute(FrameworkConstants.SUCCESS_KEY, "true");
    return mapping.findForward(FrameworkConstants.SUCCESS_KEY);
  }

  
  protected void entry(String method) {
    logger.entry(getClass(), method);
  }
  
  protected void exit(String method) {
    logger.exit(getClass(), method);
  }
  
  protected void msg(String method, String msg) {
    logger.msg(getClass(), method, msg);
  }
  
  protected void msg(String method, String msg, Exception e) {
    logger.msg(getClass(), method, msg, e);
  }


  protected void msg(String methodName, Object[] msg) {
    msg(methodName, getString(msg));
  }
  
  protected void msg(String methodName, String[] msg, Exception e) { 
    msg(methodName, getString(msg), e);
  }
  
  /**
   * 
   * @param msg the message array
   * @return Joins all the elements of the array and returns them as a String
   */
  public static String getString(Object[] msg) {
    StringBuffer sb = new StringBuffer();
    if (msg != null) {
      for (int i=0; i<msg.length; i++) {
        sb.append(msg[i]);
      }
    }    
    return sb.toString();
  }  

}
