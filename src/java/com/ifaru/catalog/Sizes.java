package com.ifaru.catalog;

import java.util.ArrayList;
import java.util.List;

public class Sizes {
  private List sizes;
  private String id; 

  /**
   * @return the fragrances
   */
  public List getSizes() {
    return sizes;
  }
  /**
   * @param fragrances the fragrances to set
   */
  public void setSizes(List prices) {
    this.sizes = prices;
  }
  
  /**
   * Add
   * @param attar
   */
  public void addSize(Size size) {
    if (sizes==null) {
      sizes = new ArrayList(10);
    }
    sizes.add(size);
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }  
  
  
}
