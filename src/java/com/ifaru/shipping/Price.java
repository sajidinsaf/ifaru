package com.ifaru.shipping;

import com.ifaru.framework.IFaruIdentifiableObject;

public class Price extends IFaruIdentifiableObject {

  private double amount;
  private Currency currency;
  
  public double getAmount() {
    return amount;
  }
  
  public void setAmount(double price) {
    this.amount = price;
  }
  
  public Currency getCurrency() {
    return currency;
  }
  
  public void setCurrency(Currency currency) {
    this.currency = currency;
  }
  
  public String toString() {
    StringBuffer sb = new StringBuffer(super.toString());
    sb.append(" Amount");
    sb.append(getAmount());
    return sb.toString();
  }  
}
