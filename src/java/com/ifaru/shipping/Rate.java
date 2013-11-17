package com.ifaru.shipping;

import com.ifaru.framework.IFaruIdentifiableObject;

public class Rate extends IFaruIdentifiableObject {

  private ShippingSize shippingSize;
  private Price price;
  
  public ShippingSize getSize() {
    return shippingSize;
  }

  public void setSize(ShippingSize shippingSize) {
    this.shippingSize = shippingSize;
  }

  public Price getPrice() {
    return price;
  }

  public void setPrice(Price price) {
    this.price = price;
  }  
}
