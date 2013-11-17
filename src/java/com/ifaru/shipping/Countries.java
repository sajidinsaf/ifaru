package com.ifaru.shipping;

import java.util.HashMap;

public class Countries extends HashMap {


  /**
   * 
   */
  private static final long serialVersionUID = 3117359587731475948L;

  public Object put(Object key, Object value) {
    if (!(key instanceof String) || !(value instanceof Country)) {
      StringBuffer msg = new StringBuffer("Exception while adding country to map: ");
      msg.append(" Expected key to be an instance of ");
      msg.append(String.class.getName());
      msg.append(" got key as instance of: ");
      msg.append(key.getClass().getName());
      msg.append(".   Expected value to be an instance of ");
      msg.append(Country.class.getName());
      msg.append(" got it as instance of: ");
      msg.append(value.getClass().getName());      
      throw new RuntimeException(msg.toString());
    }
    return super.put(key, value);
  }
  
  public void addCountry(Country country) {
    put(country.getId(), country);
  }
}
