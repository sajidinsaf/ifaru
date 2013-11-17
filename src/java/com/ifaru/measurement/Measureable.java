package com.ifaru.measurement;

import com.ifaru.framework.Identifiable;

public interface Measureable extends Identifiable {

  public Number getUnits();
  public MeasurementUnit getMeasurementUnits();
}
