package com.ifaru.policy;

import java.util.HashMap;

public class Policies extends HashMap {

  /**
   * 
   */
  private static final long serialVersionUID = 6793718662541053077L;

  public Object put(Object key, Object value) {
    if (!(key instanceof Class) || !(value instanceof Policy)) {
      StringBuffer msg = new StringBuffer("Exception while adding Policy to map: ");
      msg.append(" Expected key to be an instance of ");
      msg.append(String.class.getName());
      msg.append(" got key as instance of: ");
      msg.append(key.getClass().getName());
      msg.append(".   Expected policy to be an instance of ");
      msg.append(Policy.class.getName());
      msg.append(" got it as instance of: ");
      msg.append(value.getClass().getName());      
      throw new RuntimeException(msg.toString());
    }
    return super.put(key, value);
  }
  
}
