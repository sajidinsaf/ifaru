package com.ifaru.measurement;

public class IFaruNumber implements Number {
  public Integer intValue;
  public Float floatValue;
  
  public Integer getIntValue() {
    return intValue;
  }
  
  public void setIntValue(Integer intValue) {
    this.intValue = intValue;
    setFloatValue(new Float(intValue.intValue()+""));
  }
  
  public void setIntValue(int intValue) {
    this.intValue = intValue;
    setFloatValue(new Float(intValue+""));
  }
  
  public Float getFloatValue() {
    return floatValue;
  }
  
  public void setFloatValue(Float floatValue) {
    this.floatValue = floatValue;
    setIntValue(Math.round(floatValue.floatValue()));
  }
  
  public void setFloatValue(float floatValue) {
    this.floatValue = floatValue;
    setIntValue(Math.round(floatValue));
  }  
}
