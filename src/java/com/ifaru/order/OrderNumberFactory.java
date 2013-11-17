package com.ifaru.order;

import java.util.GregorianCalendar;

public class OrderNumberFactory {

  private static OrderNumberFactory factory;
  private static int sequence;
  
  private OrderNumberFactory() {}
  
  public static OrderNumberFactory getInstance() {
    if (factory == null) {
      factory = new OrderNumberFactory();
      String ctm = String.valueOf(System.currentTimeMillis());
      sequence = Integer.parseInt(ctm.substring(ctm.length()-4, ctm.length()));
    }
    return factory;
  }
  
  public long getUniqueOrderNumber() {
    GregorianCalendar gDate = new GregorianCalendar();
    String date = String.valueOf(gDate.get(GregorianCalendar.DAY_OF_MONTH));
    date += String.valueOf(gDate.get(GregorianCalendar.MONTH)+1);
    date += String.valueOf(gDate.get(GregorianCalendar.YEAR));
    date += pad(++sequence);
    return Long.parseLong(date);
  }

  private String pad(int i) {
    String val = String.valueOf(i);
    while (val.length()<4) {
      val = 0+val;
    }
    return val;
  }
}
