package com.ifaru.security;

import javax.servlet.ServletContext;

import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.Initialisable;

public class PasswordService implements Initialisable {
  
  private static PasswordService ps;
  private PasswordService() {
    
  }
  
  public String getPassword(String encryptedPwd, String seed) {

    return decryptPassword(encryptedPwd, seed);

  }

  private String decryptPassword(String password, String seed) {
    return password;
  }

  public void init(FrameworkFacade facade) throws Exception {
    // TODO Auto-generated method stub
    
  }

  public static PasswordService getInstance() {
    if (ps == null) {
      ps = new PasswordService();
    }
    return ps;
  }
  
  

}
