package com.ifaru.catalog;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruIdentifiableObject;

public class Brand extends IFaruIdentifiableObject implements Searchable {
  private String keywords;

  public String getKeywords() {
    return keywords;
  }

  public void setKeywords(String keywords) {
    this.keywords = keywords;
  }
  
  public String toString() {
    StringBuffer sb = new StringBuffer(super.toString());
    sb.append(" Keywords: ");
    sb.append(getKeywords());
    return sb.toString();
  }
}
