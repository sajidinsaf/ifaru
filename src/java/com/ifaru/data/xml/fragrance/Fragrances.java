package com.ifaru.data.xml.fragrance;

import java.util.ArrayList;
import java.util.List;

public class Fragrances {
  private List fragrances;

  /**
   * @return the fragrances
   */
  public List getFragrances() {
    return fragrances;
  }
  /**
   * @param fragrances the fragrances to set
   */
  public void setFragrances(List fragrances) {
    this.fragrances = fragrances;
  }
  
  /**
   * Add
   * @param attar
   */
  public void addFragrance(Fragrance fragrance) {
    if (fragrances==null) {
      fragrances = new ArrayList(10);
    }
    fragrances.add(fragrance);
  }  
  
  
}
