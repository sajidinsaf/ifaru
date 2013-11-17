package com.ifaru.framework;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;

public class IFaruActionServlet extends ActionServlet implements IFaruFrameworkObject {
  /**
   * 
   */
  private static final long serialVersionUID = 5732475902076583661L;
  private FrameworkFacade frameworkFacade; 
  
  public IFaruActionServlet() {
    
  }
  
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    try {
      setFrameworkFacade(FrameworkFacadeFactory.getInstance(config).getFrameworkFacade());
    } catch (Exception e) {
      throw new ServletException("Exception while initialising FrameworkFacade", e);
    }
  }
  
  public void setFrameworkFacade(FrameworkFacade facade) {
    this.frameworkFacade = facade;
  }

  public FrameworkFacade getFrameworkFacade() {
    return frameworkFacade;
  }
}
