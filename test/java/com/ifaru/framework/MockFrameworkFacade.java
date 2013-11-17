package com.ifaru.framework;

import javax.servlet.ServletConfig;

import com.ifaru.db.DbInterface;
import com.ifaru.util.Logger;

public class MockFrameworkFacade implements FrameworkFacade {

  public DbInterface getDbInterface() throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

  public Logger getLogger() {
    return new ConsoleLogger();
  }

  public ServletConfig getServletConfig() {
    // TODO Auto-generated method stub
    return null;
  }

}
