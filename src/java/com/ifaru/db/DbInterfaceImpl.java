package com.ifaru.db;

import com.ifaru.framework.ConfigException;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.util.VectorEnum;
import com.ifaru.xml.XMLParser;

public class DbInterfaceImpl implements DbInterface {

  private String databaseUrl;
  private String databaseDriver;
  private String databaseUsername;
  private String databasePassword;  
  private String dbConfigPath;
  private int poolSize;

  private VectorEnum connections = null;
  
  public DBConnection getConnection() {
    return (DBConnection) connections.nextReset();
  }
  

  public void init(String dbConfigPath) throws IFaruException {
    this.dbConfigPath = dbConfigPath;
    loadDatabaseConfiguration();
    //loadPool();
  }

  void loadDatabaseConfiguration() throws IFaruException {
    XMLParser parser = new XMLParser();
    String dbConfigFile = "database.xml";
    String dbConfigPath = getConfPath() + java.io.File.separator;
    if(!parser.parseFile( dbConfigPath + dbConfigFile)) {
      throw new ConfigException("Database config file: " + dbConfigFile + " could not be found at: "+ dbConfigPath +", Please setup database "+"Click here to setup database "+"/conf/setup/");
    }
    databaseDriver = parser.getValue("database/driver");
    databaseUrl = parser.getValue("database/url");
    databaseUsername = parser.getValue("database/username");
    databasePassword = parser.getValue("database/password");
    poolSize = Integer.parseInt(parser.getValue("database/poolSize"));

  }  
  
  public String getConfPath()
  {
    return dbConfigPath + java.io.File.separator +  "conf";
  }  
  
  private void loadPool() throws Exception {
    try {
      connections = new VectorEnum();
      for ( int i=0; i<getPoolSize(); i++) {
        DBConnection conn = new DBConnection(this);
        connections.addElement(conn);
      }
    }
    catch(Exception e) {
      throw e;
    }
  }


  public String getDatabaseDriver() {
    return databaseDriver;
  }

  public String getDatabasePassword() {
    return databasePassword;
  }

  public String getDatabaseUsername() {
    return databaseUsername;
  }

  public String getDatabaseUrl() {
    return databaseUrl;
  }

  private int getPoolSize() {
    return poolSize;
  }


  public void init(FrameworkFacade facade) throws IFaruException {
    try {
      init(facade.getServletConfig().getServletContext().getRealPath("/"));
    } catch (Exception e) {
      throw new IFaruException("Exception ehwn Initialising", e);
    }
    
  }
  
  
}
