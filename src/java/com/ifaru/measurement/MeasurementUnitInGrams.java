package com.ifaru.measurement;

public class MeasurementUnitInGrams extends MeasurementUnit {

  private int size;
  
  @Override
  public int getQuantityAvailable() {
    return getQuantity()/size;
  }

  public void setSize(int size) {
    this.size = size;
  }
}
