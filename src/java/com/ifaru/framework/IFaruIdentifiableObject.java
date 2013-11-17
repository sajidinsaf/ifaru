package com.ifaru.framework;

import com.ifaru.util.Logger;

public class IFaruIdentifiableObject implements Identifiable {
  public final static int COMMON_HASHCODE = 0;
  private String id, name;
  private Logger logger = Logger.getInstance();
  public void setId(String id) {
    this.id = id;
  }
  
  public String getId() {
    // TODO Auto-generated method stub
    return id;
  }

  public void setName(String name) {
    this.name = name;
  }
  
  public String getName() {
    // TODO Auto-generated method stub
    return name;
  }

  public String toString() {
    StringBuffer sb = new StringBuffer();
    sb.append("Id: ");
    sb.append(getId());
    sb.append(" Name: ");
    sb.append(getName());
    return sb.toString();
  }
  
  protected void entry(String method) {
    logger.entry(getClass(), method);
  }
  
  protected void exit(String method) {
    logger.exit(getClass(), method);
  }
  
  protected void msg(String method, String msg) {
    logger.msg(getClass(), method, msg);
  }
  
  protected void msg(String method, String msg, Exception e) {
    logger.msg(getClass(), method, msg, e);
  }


  protected void msg(String methodName, Object[] msg) {

    msg(methodName, getString(msg));
  }
  
  protected void msg(String methodName, String[] msg, Exception e) {
    
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
    
  public boolean same(Object s1, Object s2) {
    if (s1 == null && s2 == null) return true;
    if (s1 != null || s2 != null) return false;
    return s1.equals(s2);
  }  
}
