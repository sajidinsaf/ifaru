package com.ifaru.db;

public class DBConnection extends com.ifaru.db.DataConnection
{
  boolean isOk;
  

  DBConnection(DbInterface dbInterface) throws Exception {
    open(dbInterface.getDatabaseDriver(),
         dbInterface.getDatabaseUrl(),
         dbInterface.getDatabaseUsername(),
         dbInterface.getDatabasePassword());
  }	
	
  public DBConnection(java.sql.Connection conn) {
    setConnection(conn);
    isOk = conn != null;
  }
  
  public boolean isOk() {
    return isOk;
  }
}
