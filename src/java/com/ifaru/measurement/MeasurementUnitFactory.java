package com.ifaru.measurement;

import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.framework.IFaruIdentifiableObject;

public class MeasurementUnitFactory extends IFaruIdentifiableObject {

  private static MeasurementUnitFactory factory;

  MeasurementUnitInGrams muGrams;
  MeasurementUnitInUnits muUnits;
  
  private MeasurementUnitFactory() {
  }
  
  public static MeasurementUnitFactory getInstance(FrameworkFacade facade) {
    if (factory == null) {
      factory = new MeasurementUnitFactory();
    }
    return factory;
  }
  
  public MeasurementUnitInMls getMeasurementUnitInMls(String name) throws IFaruException {
    return (MeasurementUnitInMls)MeasurementUnitInMls.getInstance(name);
  }
  
  public MeasurementUnitInGrams getMeasurementUnitInGrams(int size) {
    MeasurementUnitInGrams muGrams = new MeasurementUnitInGrams();
    muGrams.setSize(size);
    muGrams.setName(size+"grams");
    muGrams.setId(size+"grams");
    return muGrams;
  }
  
  public MeasurementUnitInUnits getMeasurementUnitInUnits() {
    return new MeasurementUnitInUnits();
  }
}
