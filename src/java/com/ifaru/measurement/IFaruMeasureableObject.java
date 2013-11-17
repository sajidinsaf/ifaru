package com.ifaru.measurement;

import com.ifaru.framework.IFaruIdentifiableObject;

public class IFaruMeasureableObject extends IFaruIdentifiableObject implements
    Measureable {

  private Number units;
  private MeasurementUnit measurementUnit;
  
  public MeasurementUnit getMeasurementUnits() {
    // TODO Auto-generated method stub
    return measurementUnit;
  }

  public Number getUnits() {
    // TODO Auto-generated method stub
    return units;
  }

  public MeasurementUnit getMeasurementUnit() {
    return measurementUnit;
  }

  public void setMeasurementUnit(MeasurementUnit measurementUnit) {
    this.measurementUnit = measurementUnit;
  }

  public void setUnits(Number units) {
    this.units = units;
  }

}
