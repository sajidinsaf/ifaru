package com.ifaru.security.sha;

public class SystemUnavailableException extends Exception {


  public SystemUnavailableException() {
    super();  
  }
  
  public SystemUnavailableException(String msg) {
    super(msg);
  }
  
  public SystemUnavailableException(Exception e) {
    super(e);
  }
  
  public SystemUnavailableException(String msg, Exception e) {
    super(msg, e);
  }

}