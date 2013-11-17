package com.ifaru.catalog;

import java.io.File;
import java.io.IOException;

import org.xml.sax.SAXException;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.util.Logger;

public class CatalogItemsPoller {
  
  private FrameworkFacade facade;
  private CatalogItems catalogItems;
  private long pollPeriod=600000;
  private static Logger logger = Logger.getInstance();
  private static CatalogItemsPoller poller;  
  private boolean isUpdating;
  private CatalogItemsPoller() {
  }

  public static CatalogItemsPoller getInstance() {
    if (poller == null) {
      poller = new CatalogItemsPoller();
    }
    return poller;
  }
  

  public void init(FrameworkFacade facade) {
    String mn="init";
      this.facade=facade;
  }
  
//  public void run() {
//    String mn = "run";
//    msg(mn, new String[]{getName(), " running"});
//    while (true) {
//      msg(mn, "checking for catalog updates");
//      isUpdating = true;
//      getCatalogItems();
//      isUpdating = false;
//      msg(mn, "completed checking for catalog updates");      
//      try {
//        sleep(pollPeriod);
//      } catch (InterruptedException e) {
//        //do nothing. keep polling
//      }   
//    }
//  }
  
  private void getCatalogItems(boolean ignoreDisabled) throws IOException, SAXException, IFaruException {
    String mn = "getCatalogItems";
    CatalogItemFactory factory = CatalogItemFactory.getInstance();
    factory.init(facade);
    String fileName = facade.getServletConfig().getInitParameter(FrameworkConstants.FRAGRANCE_CATALOG_FILE_KEY);
    File dataFile = new File(facade.getServletConfig().getServletContext().getRealPath(fileName));
    msg(mn, new String[]{"Getting catalog from file: ", dataFile.getAbsolutePath()});
    catalogItems = CatalogItemFactory.getInstance().getItems(dataFile);
  }
  
  public CatalogItems getCatalog() {
    return catalogItems;
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

  public CatalogItems updateCatalog() throws IOException, SAXException, IFaruException {
    return updateCatalog(false);
  }
  
  public CatalogItems updateCatalog(boolean ignoreDisabled) throws IOException, SAXException, IFaruException {
    try {
     isUpdating = true;
     getCatalogItems(ignoreDisabled);
    } finally {
      isUpdating = false;
    }
     return getCatalog();
  }  
    
  /**
   *  indicates that the poller is updating the catalog 
   */
  public boolean isUpdating() {
    return isUpdating;
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
    

}
