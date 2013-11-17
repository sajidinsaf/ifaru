package com.ifaru.framework;

import javax.servlet.ServletConfig;

import com.ifaru.util.Logger;
import com.ifaru.db.DbInterface;
import com.ifaru.db.DbInterfaceFactory;

public class FrameworkFacadeImpl implements FrameworkFacade {
  
  private ServletConfig config;
  private Logger logger;
  private DbInterface dbInterface;
  private String lock ="";
  public FrameworkFacadeImpl(ServletConfig config) {
    String mn="FrameworkFacadeImpl";
    this.config = config;
    logger = Logger.getInstance();
    logger.entry(getClass(), mn);
    logger.exit(getClass(), mn);    
  }
  
  public ServletConfig getServletConfig() {
    return config;
  }
  
  public Logger getLogger() {
    // TODO Auto-generated method stub
    return logger;
  }

  public DbInterface getDbInterface() throws Exception {
    if (dbInterface == null)
    {
      synchronized (lock) {
        if (dbInterface == null){      
          DbInterfaceFactory factory = DbInterfaceFactory.getInstance();
          factory.init(this);
          dbInterface = factory.getDbInterface();
        }
      }
    }
    return dbInterface;
  }

  
}
