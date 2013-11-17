package com.ifaru.measurement;

import com.ifaru.framework.IFaruIdentifiableObject;

public class Weight extends IFaruIdentifiableObject {

  private int weight;
  private MeasurementUnit measurementUnit;
  
  public int getWeight() {
    return weight;
  }

  public MeasurementUnit getMeasurementUnit() {
    return measurementUnit;
  }

  public void setMeasurementUnit(MeasurementUnit measurementUnit) {
    this.measurementUnit = measurementUnit;
  }
  
  public String toString() {
    StringBuffer sb = new StringBuffer(super.toString());
    sb.append(" Weight: ");
    sb.append(getWeight());
    return sb.toString();
  }
}
