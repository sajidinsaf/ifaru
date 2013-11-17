package com.ifaru.catalog;

public class Information {
  private String url = "";

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }
  
  public String toString() {
    return "URL: "+url;
  }
}
