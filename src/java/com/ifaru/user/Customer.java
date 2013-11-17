package com.ifaru.user;

import com.ifaru.framework.IFaruIdentifiableObject;

public class Customer extends IFaruIdentifiableObject{

  private Address address;
  
  
  public String toString() {
   // return "Email address: " +getEmailAddress();
    return super.toString();
  }

  public Address getAddress() {
    return address;
  }

  public void setAddress(Address address) {
    this.address = address;
  }

}
