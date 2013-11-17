package com.ifaru.shipping;

import com.ifaru.framework.IFaruIdentifiableObject;
import com.ifaru.measurement.PhysicalSize;
import com.ifaru.measurement.Weight;

public class ShippingSize extends IFaruIdentifiableObject {

  private Weight weight;
  private PhysicalSize physicalSize;
  
  public Weight getWeight() {
    return weight;
  }
  
  public void setWeight(Weight weight) {
    this.weight = weight;
  }
  
  public PhysicalSize getDimension() {
    return physicalSize;
  }
  
  public void setDimension(PhysicalSize physicalSize) {
    this.physicalSize = physicalSize;
  }



}
