package com.ifaru.db;

import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.framework.Initialisable;


public interface DbInterface extends Initialisable {

  public void init(String dbConfigPath) throws IFaruException;

  public void init(FrameworkFacade facade) throws IFaruException;
  
  public DBConnection getConnection() throws IFaruException;

  public String getDatabaseUsername();

  public String getDatabaseDriver();

  public String getDatabasePassword();

  public String getDatabaseUrl();
  
}
