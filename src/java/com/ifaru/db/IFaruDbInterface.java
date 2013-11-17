package com.ifaru.db;

import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;

public class IFaruDbInterface implements DbInterface {

  private FrameworkFacade facade;

  public DBConnection getConnection() throws IFaruException {
    try {
        return new DBConnection(this);
    } catch (Exception e) {
        throw new IFaruException("Exception while trying to obtain connection to the database. Check config.", e);
    }
  }

  public String getDatabaseDriver() {
    return facade.getServletConfig().getInitParameter("dbDriver");
  }

  public String getDatabasePassword() {
    return facade.getServletConfig().getInitParameter("dbPassword");
  }

  public String getDatabaseUrl() {
    return facade.getServletConfig().getInitParameter("dbUrl");
  }

  public String getDatabaseUsername() {
    return facade.getServletConfig().getInitParameter("dbUsername");
  }

  public void init(String dbConfigPath) throws IFaruException {
    // TODO Auto-generated method stub

  }

  public void init(FrameworkFacade facade) throws IFaruException {
    this.facade = facade;
  }

}
