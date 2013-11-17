package com.ifaru.cart;

import java.util.Map;

import com.ifaru.policy.PolicyCandidate;

public interface ShoppingCartPolicyCandidate extends PolicyCandidate {

  public double getShippingTotal();
  
  public void setGrandTotal(double grandTotal);
  
  public Map getItems();  
}
