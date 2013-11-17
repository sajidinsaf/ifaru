/**
 * All action classes that require to provide shop functionality must extend this action.
 * Apart from utility methods, the UpdateCatalogAction subclass also updates the CatalogItems object
 * through the administration interface. If an action does not extend this class, it will not be able to take 
 * advantage of the update functionality and may provide the user with out-dated catalogue information.
 * 
 */

package com.ifaru.actions;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.xml.sax.SAXException;

import com.ifaru.catalog.Brand;
import com.ifaru.catalog.CatalogItems;
import com.ifaru.catalog.CatalogItemsPoller;
import com.ifaru.catalog.CategoryTree;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruActionServlet;
import com.ifaru.framework.IFaruException;
import com.ifaru.framework.IFaruFrameworkObject;
import com.ifaru.policy.Policies;
import com.ifaru.policy.PolicyFactory;
import com.ifaru.util.Logger;

public abstract class IFaruBaseAction extends Action implements IFaruFrameworkObject {

  private FrameworkFacade frameworkFacade;
  protected Logger logger = Logger.getInstance();
  private Policies policies = null;
  protected static CatalogItems catalogItems;
  protected static CategoryTree categoryTree;
  protected static Map brandTree;
  private static CatalogItemsPoller poller;
  /**
   * This method is being finalised to ensure that all sub classes
   * get their required resources
   * This method calls the abstract iExecute method to allow action specific functionality to be implemented.  
   */
  public final ActionForward execute(ActionMapping mapping, ActionForm form,
    HttpServletRequest request, HttpServletResponse response) throws Exception {
    String mn = "execute";
    this.frameworkFacade = ((IFaruActionServlet)getServlet()).getFrameworkFacade();
    msg(mn, "Initialising policies");
    initPolicies();
    msg(mn, "Initialised policies");    
    msg(mn, "Setting up the catalog");
    setup(mapping, form, request, response);
    msg(mn, "Catalog setup complete");  
    msg(mn, "cleaning unecessary request and session parameters");    
    cleanRequest(request);
    msg(mn, "Request and session clean complete");
    ActionForward forward = iExecute(mapping, form, request, response);
    return forward;
  }  


  private void setUpCommonSessionParams(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    String mn = "setUpCommonSessionParams";
    String categoryBaseUrl = frameworkFacade.getServletConfig().getInitParameter(FrameworkConstants.CATEGORY_BASE_URL_KEY);
    String brandBaseUrl = frameworkFacade.getServletConfig().getInitParameter(FrameworkConstants.BRAND_BASE_URL_KEY);
    request.getSession().setAttribute(FrameworkConstants.CATEGORY_BASE_URL_KEY, categoryBaseUrl);
    request.getSession().setAttribute(FrameworkConstants.BRAND_BASE_URL_KEY, brandBaseUrl);
    msg(mn, new String[] {"Setup the common params to session: ","Category Base Url: ", categoryBaseUrl, " Brand Base Url: ", brandBaseUrl});
  }


  /* 
   * Remove the flag that might have been set earlier to indicate to the jsp what search the user as performing
   * This is related to searchResults.jsp 
   * 
   */
  private void cleanRequest(HttpServletRequest request) {
    request.getSession().removeAttribute(FrameworkConstants.BRAND_SEARCH_FLAG);
    request.getSession().removeAttribute(FrameworkConstants.CATEGORY_SEARCH_FLAG);
    request.getSession().removeAttribute(FrameworkConstants.KEYWORD_SEARCH_FLAG);    
  }

  private void setup(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) throws IFaruException {
    String mn = "setup";
    // get a catalog object only for the first time a user access this session.
    if (request.getSession(true).getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY) == null 
        || catalogItems == null 
        || categoryTree == null 
        || brandTree == null) {
      initPoller();

      try {
        getCatalog();
        initCatalogObjects(request);
      } catch (Exception e) {
       // check if this is first time we are loading the catalog. If yes then this is not an update problem so throw
        // an exception as we have no previously valid catalog object to work with.
        if (catalogItems == null) {
          throw new RuntimeException(e);        
        }
        // revert to the previous catalog item.
        // log the problem
        msg(mn, "Could not update the catalog due to the following exception: ", e);
      }  
    }
    if (request.getSession(true).getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY) == null) {
      request.getSession(true).setAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY, catalogItems);      
      request.getSession().setAttribute(FrameworkConstants.CATEGORIES_BEAN_KEY, categoryTree);
      request.getSession().setAttribute(FrameworkConstants.BRANDS_BEAN_KEY, brandTree);
    }
    setUpCommonSessionParams(mapping, form, request, response);
  }

  private void initPoller() throws IFaruException {
    String mn = "initPoller";
    if (poller == null) {
        poller = CatalogItemsPoller.getInstance();
        msg(mn, new Object[]{"Setting frameworkfacade to poller: ", frameworkFacade});
        poller.init(frameworkFacade);
//        poller.start();
    }
  }  
  
  private void initCatalogObjects(HttpServletRequest request) {
    initCategoryTree(catalogItems);
    initBrandTree(catalogItems);
  }

  private void initBrandTree(CatalogItems catalogItems2) {
    String mn="initBrandTree";
    if (brandTree == null) {
      brandTree = new TreeMap();
    }
    Iterator brands = catalogItems.getBrands().iterator();
    while (brands.hasNext()) {
      Brand brand = (Brand)brands.next();
      msg (mn, new Object[]{"Adding brand with id:", brand.getId(), " and name: ",  brand.getName()});
      brandTree.put(brand.getId(), brand);
    }
  }

  private void initCategoryTree(CatalogItems catalogItems2) {
    if (categoryTree == null) {
      categoryTree = new CategoryTree();
      categoryTree.createFromCatalog(catalogItems);
    }          
  }


  public FrameworkFacade getFrameworkFacade() {
    return frameworkFacade;
  }
  
  public void setFrameworkFacade(FrameworkFacade facade) {
    this.frameworkFacade = facade;
    logger = facade.getLogger();
  }
  
  public abstract ActionForward iExecute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception;

  protected Policies getPolicies() {
    return policies;
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
  
  
  private void initPolicies() {
    if (policies == null) {
      PolicyFactory policyFactory = PolicyFactory.getInstance();
      if (!policyFactory.isInitialised()) {
        policyFactory.init(this.frameworkFacade);
      }
      policies = policyFactory.getPolicies();
    }    
  }
  
  public void catalogChanged(CatalogItems items) {
    this.catalogItems = items;
  }
  
  private void getCatalog() throws IOException, SAXException, IFaruException {
    while(poller.isUpdating()) {
      try {
        wait(50);
      } catch (InterruptedException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    }
    /* if this is the first request since the application started */
    if (poller.getCatalog() == null) {
      catalogItems = poller.updateCatalog();
    } else {
      catalogItems = poller.getCatalog();
    }
    
  }
}
