package com.ifaru.framework;

import javax.servlet.ServletConfig;

import com.ifaru.db.DbInterface;
import com.ifaru.db.DbInterfaceFactory;
import com.ifaru.util.Logger;

public interface FrameworkFacade {

  public Logger getLogger();
  
  public DbInterface getDbInterface() throws Exception;
  
  public ServletConfig getServletConfig();
}
