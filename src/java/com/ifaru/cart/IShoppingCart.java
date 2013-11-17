package com.ifaru.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.ifaru.framework.IFaruException;
import com.ifaru.policy.Policies;
import com.ifaru.policy.Policy;
import com.ifaru.shipping.ShippingOption;
import com.ifaru.shipping.ShippingOptions;

public interface IShoppingCart extends ShoppingCartPolicyCandidate {

  public Map getItems();
  
  public CartItem[] getCartItems();
  
  public String getSelectedShippingOptionId();

  public ShippingOptions getShippingOptions();
  
  public void setInsuranceRequired(String insurance);
  
  public boolean isInsuranceRequired();  

  /**
   * Ideally this should be calculated through a Policy object 
   * for the shopping cart
   * @return the grand total for the shopping cart based on the current items in it
   */
  public double getGrandTotal();

  public void setGrandTotal(double grandTotal);
  /**
   * Ideally this should be calculated through a Policy object 
   * for the shopping cart
   * @return the grand total for the shopping cart based on the current items in it
   */
  public double getItemTotal();
  
  public void setItemTotal(double itemTotal);

  /**
   * Ideally this should be calculated through a Policy object 
   * for the shopping cart
   * @return the grand total for the shopping cart based on the current items in it
   */
  public double getShippingTotal();

  public void setShippingTotal(double shippingTotal);
  
  /**
   * Return the maximum size of the item in the cart
   * @return
   */
  public String getMaxSize();

  public String getItemTotalAsCurrency();

  public String getShippingTotalAsCurrency();

  public String getGrandTotalAsCurrency();

  public double getShippingInsuranceCost();
  
  public String getShippingInsuranceAsCurrency();
  
  public String getFullShippingTotalAsCurrency();
  
  
}
