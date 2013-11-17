package com.ifaru.order;

import java.util.List;

import com.ifaru.user.Customer;

public class Order {
  
  private long orderNumber;
  private List orderItems = null; 
  private Customer customer = null;
  
  public long getOrderNumber() {
    return orderNumber;
  }

  public List getOrderItems() {
    return orderItems;
  }
  public void setOrderItems(List orderItems) {
    this.orderItems = orderItems;
  }
  public Customer getCustomer() {
    return customer;
  }
  public void setCustomer(Customer customer) {
    this.customer = customer;
  }
  
  public void setOrderNumber(long uniqueOrderNumber) {
    this.orderNumber = uniqueOrderNumber;
    
  }
}
