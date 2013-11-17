package com.ifaru.shipping;

public interface CurrencyConvertor extends com.ifaru.framework.Identifiable {

  public Price convert(Price fromCurrency, Price toCurrency);
  
}
