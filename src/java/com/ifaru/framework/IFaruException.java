package com.ifaru.framework;

public class IFaruException extends Exception {

  public IFaruException(String msg, Throwable t) {
    super(msg, t);
  }
  
  public IFaruException(String msg) {
    super(msg);
  }
  /**
   * 
   */
  private static final long serialVersionUID = 110515196956375551L;

}
