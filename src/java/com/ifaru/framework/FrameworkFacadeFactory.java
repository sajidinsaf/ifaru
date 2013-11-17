package com.ifaru.framework;

import javax.servlet.ServletConfig;

public class FrameworkFacadeFactory {
  
  private static FrameworkFacadeFactory factory = null;
  private static FrameworkFacade facade;
  
  private FrameworkFacadeFactory() {
    
  }
  
  public static FrameworkFacadeFactory getInstance(ServletConfig config) throws Exception {
    if (factory == null) {
      factory = new FrameworkFacadeFactory();
      facade = new FrameworkFacadeImpl(config);
    }
    return factory;
  }

  
  public FrameworkFacade getFrameworkFacade() {
    return facade;
  }
}
