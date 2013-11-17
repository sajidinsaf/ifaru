package com.ifaru.shipping;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class ShippingOption {
  
  private String id, name, duration;
  private double price;
  private Map rates = new HashMap();
  
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getDuration() {
    return duration;
  }
  public void setDuration(String duration) {
    this.duration = duration;
  }
  public double getPrice() {
    return price;
  }
  public void setPrice(double price) {
    this.price = price;
  }

  public void addRate(Rate rate) {
    rates.put(rate.getId(), rate);
  }
  
  public Map getRates() {
    return rates;
  }
  
  public Iterator getRateList() {
    return rates.values().iterator();
  }
 
  public String toString() {
    StringBuffer sb = new StringBuffer();
    sb.append("Id: ");
    sb.append(getId());
    sb.append("Name: ");
    sb.append(name);
    sb.append("Price");
    sb.append(getPrice());
    return sb.toString();
  }
}
