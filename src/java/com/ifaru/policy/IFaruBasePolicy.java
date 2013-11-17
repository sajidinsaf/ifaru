package com.ifaru.policy;

import com.ifaru.util.Logger;
public abstract class IFaruBasePolicy implements Policy {

  private Logger logger = Logger.getInstance();

  protected void entry(String method) {
    logger.entry(getClass(), method);
  }
  
  protected void exit(String method) {
    logger.exit(getClass(), method);
  }
  
  protected void msg(String methodName, String msg) {
    logger.msg(getClass(), methodName, msg);
  }
  
  protected void msg(String methodName, String msg, Exception e) {
    logger.msg(getClass(), methodName, msg, e);
  }

  protected void msg(String methodName, Object[] msg) {

    msg(methodName, getString(msg));
  }
  
  protected void msg(String methodName, Object[] msg, Exception e) {
    
    msg(methodName, getString(msg), e);
  }

  /**
   * 
   * @param msg the message array
   * @return Joins all the elements of the array and returns them as a String
   */  
  public static String getString(Object[] msg) {
    StringBuffer sb = new StringBuffer();
    if (msg != null) {
      for (int i=0; i<msg.length; i++) {
        sb.append(msg[i]);
      }
    }    
    return sb.toString();
  }
}
