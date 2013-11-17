package com.ifaru.measurement;

import com.ifaru.framework.IFaruIdentifiableObject;

public abstract class MeasurementUnit extends IFaruIdentifiableObject {
  
  private int quantity;
  private int quantityAvailable;
  public abstract int getQuantityAvailable();

  public void setQuantityAvailable(int qty) {
    this.quantityAvailable = qty;
  }
  protected int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  
}
