package com.ifaru.util;

public class NumberUtils {

  
  public static String getDelimitisedValue(double value, int indexPlaces) {
    String iv = String.valueOf(value);
    String dot = ".";
    String iv1 = iv.substring(0,iv.indexOf(dot)+1);
    String iv2 = iv.substring(iv.indexOf(dot)+1, iv.length());   
    if (iv2.length() < indexPlaces) {
      while(iv2.length()<indexPlaces)
      iv2 = iv2+ "0";
    } else if (iv2.length() > indexPlaces) {
      iv2 = iv2.substring(0,indexPlaces);
    }
    return iv1 + iv2;
  }  
  
}
