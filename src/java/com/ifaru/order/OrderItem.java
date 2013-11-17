package com.ifaru.order;

import com.ifaru.user.Customer;

public class OrderItem extends com.ifaru.cart.CartItem {

  private long orderNumber;
  private Customer customer;
  public long getOrderNumber() {
    return orderNumber;
  }
  public void setOrderNumber(long orderNumber) {
    this.orderNumber = orderNumber;
  }
  public Customer getCustomer() {
    return customer;
  }
  public void setCustomer(Customer customer) {
    this.customer = customer;
  }
}
