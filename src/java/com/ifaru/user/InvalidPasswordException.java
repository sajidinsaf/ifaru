package com.ifaru.user;

public class InvalidPasswordException extends UserException {

  /**
   * 
   */
  private static final long serialVersionUID = 7153373209793733198L;

  /**
   * 
   */
  public InvalidPasswordException() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @param arg0
   * @param arg1
   */
  public InvalidPasswordException(String arg0, Throwable arg1) {
    super(arg0, arg1);
    // TODO Auto-generated constructor stub
  }

  /**
   * @param arg0
   */
  public InvalidPasswordException(String arg0) {
    super(arg0);
    // TODO Auto-generated constructor stub
  }

  /**
   * @param arg0
   */
  public InvalidPasswordException(Throwable arg0) {
    super(arg0);
    // TODO Auto-generated constructor stub
  }

}
