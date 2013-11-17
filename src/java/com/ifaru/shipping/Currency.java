package com.ifaru.shipping;

import com.ifaru.framework.IFaruIdentifiableObject;

public class Currency extends IFaruIdentifiableObject {

  private Country country;

  public Country getCountry() {
    return country;
  }

  public void setCountry(Country country) {
    this.country = country;
  }

}
