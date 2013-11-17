package com.ifaru.catalog;

import com.ifaru.measurement.MeasurementUnit;
import com.ifaru.util.NumberUtils;

public class Size {

  private String size, stock, salePrice, salePriceId, measurementUnit;
  private int quantityAvailable;
  private MeasurementUnit mu;
  
  public String getSize() {
    return size;
  }

  public void setSize(String size) {
    this.size = size;
  }

  public String getSizeLabel()
  {
    return getSize() + getMeasurementUnit();
  }
  public String getSalePrice() {
    return salePrice;
  }

  public void setSalePrice(String salePrice) {
    this.salePrice = salePrice;
  }

  public String getStock() {
    return stock;
  }

  public void setStock(String stock) {
    this.stock = stock;
  }

  public String getSalePriceAsCurrency() {
    double price = getSalePrice() != null ? Double.parseDouble(getSalePrice()) : 0;
    return NumberUtils.getDelimitisedValue(price, 2);
  }
  
  public String toString() {
    StringBuffer sb = new StringBuffer();
    sb.append("Size: "+getSize());
    sb.append("  SalePrice: "+getSalePrice());
    sb.append(" Stock: "+getStock());
    sb.append(" Price Id: "+getSalePriceId());    
    return sb.toString();
  }

  public String getSalePriceId() {
    return salePriceId;
  }

  public void setSalePriceId(String priceId) {
    this.salePriceId = priceId;
  }

  public MeasurementUnit getMu() {
    return mu;
  }

  public void setMu(MeasurementUnit mu) {
    this.mu = mu;
    setMeasurementUnit(mu.getName());
  }
  
  public int getQuantityAvailable() {
    return mu.getQuantityAvailable();
  }

  public String getMeasurementUnit() {
    return measurementUnit;
  }

  public void setMeasurementUnit(String measurementUnit) {
    this.measurementUnit = measurementUnit;
  }
}
