package com.ifaru.user;

public class UserNotFoundException extends UserException {

  public UserNotFoundException(String username) {
    super(username);
  }

  /**
   * 
   */
  private static final long serialVersionUID = 8718676911403867751L;

  /**
   * 
   */
  public UserNotFoundException() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @param arg0
   * @param arg1
   */
  public UserNotFoundException(String arg0, Throwable arg1) {
    super(arg0, arg1);
    // TODO Auto-generated constructor stub
  }

  /**
   * @param arg0
   */
  public UserNotFoundException(Throwable arg0) {
    super(arg0);
    // TODO Auto-generated constructor stub
  }

}
