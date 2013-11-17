package com.ifaru.catalog;

import java.util.Comparator;

public class CatalogItemComparator implements Comparator {

  public int compare(Object i1, Object i2) {
    String id1 = ((CatalogItem)i1).getId();
    String id2 = ((CatalogItem)i2).getId();
    return getIntValue(id1) - getIntValue(id2);
  }

  private int getIntValue(String s) {
    char[] cs = s.toCharArray();
    int val = 0;
    for (char c:cs) {
      val += (int)c;
    }
    return val;
  }
}
