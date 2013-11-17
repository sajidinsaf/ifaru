package com.ifaru.actions.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.xml.sax.SAXException;

import com.ifaru.catalog.CatalogItemsPoller;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruActionServlet;
import com.ifaru.framework.IFaruException;
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
public class UpdateCatalogAction extends IFaruBaseAction {

  protected Logger logger = Logger.getInstance();
  
  public final static char padChar = FrameworkConstants.PAD_CHAR_0;
  
  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) throws IOException, SAXException, SystemUnavailableException, IFaruException {
    String mn = "execute";
    session.removeAttribute(FrameworkConstants.CATALOG_UPDATE_FAILURE);
    session.removeAttribute(FrameworkConstants.CATALOG_UPDATE_SUCCESS); 
    HttpSession session = request.getSession(true);
    String username = (String)session.getAttribute("username");
    if (username == null) {
      return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
    }
   
    File updatesFile = getCatalogUpdatesFile();
    if (!updatesFile.exists()) {
      session.setAttribute(FrameworkConstants.CATALOG_UPDATE_FAILURE, "Nothing to update. No file found with name: "+updatesFile.getAbsolutePath());
      return mapping.findForward(FrameworkConstants.FAILURE_KEY);      
    }
    try {
      // rename the current production catalog to a backup name
      getProductionCatalogFile().renameTo(getNextCatalogVersionFile(username));
      // rename the updates file to the production file
      getCatalogUpdatesFile().renameTo(getProductionCatalogFile());
      // update the application
      CatalogItemsPoller poller = CatalogItemsPoller.getInstance();
      poller.init(((IFaruActionServlet)getServlet()).getFrameworkFacade());
      poller.updateCatalog();
    } catch (Exception e) {
      session.setAttribute(FrameworkConstants.CATALOG_UPDATE_FAILURE, "Filed to update catalog"+Logger.toString(e));
      return mapping.findForward(FrameworkConstants.FAILURE_KEY);         
    }
    
    session.setAttribute(FrameworkConstants.CATALOG_UPDATE_SUCCESS, "Success");
    return mapping.findForward(FrameworkConstants.SUCCESS_KEY);
  }

  private File getNextCatalogVersionFile(String username) {
    String fileName = getProductionCatalogFile().getAbsolutePath();
    GregorianCalendar today = new GregorianCalendar();
    StringBuilder date = new StringBuilder();
    date.append(UpdateCatalogAction.padLeft((today.get(GregorianCalendar.DAY_OF_MONTH)), padChar,2));
    date.append(UpdateCatalogAction.padLeft((today.get(GregorianCalendar.MONTH)+1), padChar,2));
    date.append(today.get(GregorianCalendar.YEAR));
    date.append(UpdateCatalogAction.getHourOfTheDay(today.get(GregorianCalendar.HOUR), today.get(GregorianCalendar.AM_PM)));
    date.append(UpdateCatalogAction.padLeft((today.get(GregorianCalendar.MINUTE)), padChar,2));
    date.append(UpdateCatalogAction.padLeft((today.get(GregorianCalendar.SECOND)), padChar,2));
    fileName += "."+username+"."+date;
    return new File(fileName);
  }

  public static String padLeft(int i, char padChar, int length) {
    String s = ""+i;
    while(s.length() < length) {
      s = padChar + s;
    }
    return s; 
  }
    
  public static String getHourOfTheDay(int hour, int ampmIndicator) {
    if (ampmIndicator == GregorianCalendar.PM) {
      return ""+(hour+12);
    }
    return padLeft(hour, padChar, 2);
  }
}
