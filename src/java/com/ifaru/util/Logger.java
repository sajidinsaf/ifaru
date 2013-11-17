package com.ifaru.util;

import com.ifaru.framework.FrameworkConstants;

public class Logger {
  private static Logger logger = null;
  private final static String lineSep = FrameworkConstants.LINE_SEPARATOR;
  private static boolean isEnabled = true;
  
  private Logger(){}
  
  protected Logger(String name) {
    
  }
  
  public static Logger getInstance() {
    if (logger != null) {
      return logger;
    }
    return logger = new Logger();
  }
  
  public void entry(Class callingClass, String method) {
    write("entry: "+ callingClass+" "+method);
  }
  
  public void exit(Class callingClass, String method) {
    write("exit: "+ callingClass+" "+method);    
  }
  
  public void msg(Class callingClass, String method, String msg) {
    write(callingClass+" "+method+" "+msg);    
  }  

  public void msg(Class callingClass, String method, String msg, Exception e) {
    write(callingClass+" "+method+" "+msg, e);    
  }  
  
  private void write(String s) {
    org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger("ifaru");
    logger.info(s);
  }
  
  private void write(String s, Throwable t) {
    System.out.println(s);
    org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger("ifaru");
    logger.error(s, t);
  }  
  
  public static String toString(Exception e) {
    return toString(e, null);
  }
      
  public static String toString(Exception e, StringBuffer message) {
    if (message == null) {
      message = new StringBuffer();
    }
    if (e != null) {
      message.append(e.getClass().getName()+ lineSep + e.getMessage() + lineSep);
      Object obj[] = e.getStackTrace();
      for (int i = 0; i < obj.length; i++) {
        message.append(obj[i].toString() + lineSep);
      }
      while (e.getCause() != null) {
        toString(e, message);
      }
    }
    return message.toString();
  }

  public void msg(Class callingClass, String methodName, Object[] messages) {
    // TODO Auto-generated method stub
    if (isEnabled()) {
      StringBuffer sb = new StringBuffer();
      for (int i=0; i<messages.length; i++) {
        sb.append(messages[i]);
      }
      msg(callingClass, methodName, sb.toString());
    }
  }

  public static boolean isEnabled() {
    return isEnabled;
  }

  public static void setEnabled(boolean isEnabled) {
    Logger.isEnabled = isEnabled;
  }
  

}
