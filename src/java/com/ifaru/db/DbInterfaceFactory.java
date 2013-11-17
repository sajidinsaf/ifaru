package com.ifaru.db;

import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.framework.Initialisable;

public class DbInterfaceFactory implements Initialisable {
  
  private DbInterface dbInterface;
  private static DbInterfaceFactory factory;
  
  private DbInterfaceFactory() {
    
  }
  
  public static DbInterfaceFactory getInstance() throws Exception {
    return factory;
  }
  
  public DbInterface getDbInterface() {
    return dbInterface;
  }

  public void init(FrameworkFacade facade) throws IFaruException {
    if (factory == null) {
      factory = new DbInterfaceFactory(); 
      factory.init(facade);
    }    
    dbInterface = new IFaruDbInterface();
    dbInterface.init(facade);
  }
}
