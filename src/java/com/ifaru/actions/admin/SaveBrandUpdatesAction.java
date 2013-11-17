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

import com.ifaru.catalog.Brand;
import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.Category;
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
public class SaveBrandUpdatesAction extends SaveUpdatesAction {

  protected Logger logger = Logger.getInstance();
  
  public ActionForward saveUpdates(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) throws IOException, SAXException, SystemUnavailableException, IFaruException {
    String mn = "iExecute";

    String loginToken = (String)session.getAttribute(FrameworkConstants.ADMIN_LOGIN_SUCCESS);
    if (loginToken == null) {
      return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
    } 

    DynaActionForm adminForm = (DynaActionForm) form;   
    String id = adminForm.getString("id").trim();                     
    String name = adminForm.getString("name");
    String keywords = adminForm.getString("keywords");
    String add = adminForm.getString("add");
    Brand newBrand = new Brand();


    newBrand.setId(id);
    newBrand.setName(name);
    newBrand.setKeywords(keywords);

    List<Brand> brands = catalogItems.getBrands();
    //System.out.println(newItem);
    int counter = 0;
    boolean found = false;
    //System.out.println(items.size());
    for (Brand brand : brands) {
      //System.out.println("Items id: ["+item.getId() + "] New Item Id: ["+newItem.getId()+"]");
      if (brand.getId().equals(newBrand.getId())) {
        found = true;
        break;
      }
      ++counter;
    }
    if (found && add != null && add.equals("true"))
    {
      session.setAttribute("alreadyExists", "Id: "+newBrand.getId()+" already exists. If you wish to edit it, go to the Edit Brand page");
    }
    else if (found) {
      brands.remove(counter);
      brands.add(counter, newBrand);
    } else if (add != null && add.equals("true")) {
      brands.add(newBrand);
    } else {
      throw new IFaruException("No match found for brand: "+newBrand);
    }
    session.setAttribute("lastBrand", newBrand);
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
