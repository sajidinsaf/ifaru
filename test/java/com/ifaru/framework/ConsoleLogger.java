package com.ifaru.framework;

import com.ifaru.util.Logger;

public class ConsoleLogger extends com.ifaru.util.Logger {
  
  private static boolean isEnabled = true;
  private final static String lineSep = FrameworkConstants.LINE_SEPARATOR;
  
  
  public ConsoleLogger() {
    super("console");
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
    System.out.println(s);
  }
  
  private void write(String s, Throwable t) {
    System.out.println(s + toString(t));
  }  
  
  private String toString(Throwable e) {
    String excep = "";
    if (e != null) {
      excep = e.getClass().getName()+ lineSep;
      Object obj[] = e.getStackTrace();
      for (int i = 0; i < obj.length; i++) {
        excep += obj[i].toString() + lineSep;
      }
    }
    return excep;
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
    ConsoleLogger.isEnabled = isEnabled;
  }  
}
