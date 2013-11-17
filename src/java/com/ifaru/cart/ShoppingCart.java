package com.ifaru.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruException;
import com.ifaru.policy.Policies;
import com.ifaru.policy.Policy;
import com.ifaru.shipping.ShippingOption;
import com.ifaru.shipping.ShippingOptions;
import com.ifaru.util.Logger;
import com.ifaru.util.NumberUtils;

public class ShoppingCart implements IShoppingCart {
  
  private Map items = new HashMap();
  private ShippingOptions shippingOptions;
  private String selectedShippingOptionId;
  private double itemTotal, shippingTotal, grandTotal;
  private int insuranceRequired;
  private double shippingInsuranceCost = 0.0;
  
  private Logger logger = Logger.getInstance();
  public void addItem(CartItem item) {
    String mn="addItem";
    msg(mn,"adding item" + item);
    String id = getMapId(item);
    if (items.get(id) != null) {
      CartItem existingItem = (CartItem) items.get(id);
      existingItem.setQuantity(existingItem.getQuantity()+item.getQuantity());
      putItem(existingItem);
      msg(mn,"item already existed in the cart so incremented the quantity to: "+item.getQuantity());
    } else {
      putItem(item);
    }
  }
  
  public Map getItems() {
    return items;
  }

  public void setItems(Map items) {
    this.items = items;
  }
  
  
  private void putItem(CartItem item) {
    setShippingOptions(item);
    items.put(getMapId(item), item);
  }
  
  /**
   * Sets the shipping options available to the buyer.
   * Checks current list of available options and the options available
   * for this item. If this item does not have an options that is currently
   * available, the option will be removed from the current list.
   * @param item
   */
  private void setShippingOptions(CartItem item) {
    if (shippingOptions == null) {
      shippingOptions = new ShippingOptions();
    }
    ShippingOptions itemShippingOptions = item.getShippingOptions();
    List invalidOptions = new ArrayList(); 
    if (shippingOptions.isEmpty()) {
      shippingOptions = itemShippingOptions;
    } else {
      Iterator existingOptions = shippingOptions.values().iterator();
      while (existingOptions.hasNext()) {
        ShippingOption option = (ShippingOption) existingOptions.next();
        if (!itemShippingOptions.containsKey(option.getId())) {
          invalidOptions.add(option.getId());
        }
      }
      Iterator iter = invalidOptions.iterator();
      while (iter.hasNext()) {
        shippingOptions.remove(iter.next().toString());
      }
    }

  }

  public static String getMapId(CartItem item) {
    String id = item.getId() + item.getSize();
    return id;
  }

  public String getSelectedShippingOptionId() {
    return selectedShippingOptionId;
  }

  public void setSelectedShippingOptionId(String selectedShippingOptionId) {
    this.selectedShippingOptionId = selectedShippingOptionId;
  }

  public ShippingOptions getShippingOptions() {
    return shippingOptions;
  }

  public void setShippingOptions(ShippingOptions shippingOptions) {
    ShippingOption ukOption = new ShippingOption();
    ukOption.setId(FrameworkConstants.SHIPPING_OPTION_ID_UK);
    ukOption.setName(FrameworkConstants.SHIPPING_OPTION_NAME_UK);
    ShippingOption intOption = new ShippingOption();
    ukOption.setId(FrameworkConstants.SHIPPING_OPTION_ID_INTERNATIONAL);
    ukOption.setName(FrameworkConstants.SHIPPING_OPTION_NAME_INTERNATIONAL);
    ShippingOptions options = new ShippingOptions();
    options.addOption(ukOption);
    options.addOption(intOption);
    this.shippingOptions = shippingOptions;
  }

  public double getGrandTotal() {
    if (grandTotal != 0.0) {
      /* The grand total has been set externally so it should be used */
      return grandTotal;
    }
    return getItemTotal()+getShippingTotal()+getShippingInsuranceCost();
  }

  public void setGrandTotal(double grandTotal) {
    this.grandTotal = grandTotal;
  }
  /**
   * @TODO implement the right calculation algorithm
   * @return
   */
  public double getItemTotal() {
    return itemTotal;
  }

  public void setItemTotal(double itemTotal) {
    this.itemTotal = itemTotal;
  }

  /**
   * @TODO implement the right calculation algorithm
   * @return
   */  
  public double getShippingTotal() {
    return shippingTotal;
  }
  
  public void setShippingTotal(double shippingTotal) {
    this.shippingTotal = shippingTotal;
  }

  public void applyPolicies(Policies policies) throws IFaruException {
    String mn="applyPolicies";
    msg(mn,"applying policies: "+policies);
    if (policies == null) {
      msg(mn,"Policies object is null. No policies will be applied");
      return;
    }
    Iterator pols = policies.values().iterator();
    while (pols.hasNext()) {
      applyPolicy((Policy)pols.next());
    }
  }

  public void applyPolicy(Policy policy) throws IFaruException {
    String mn = "applyPolicy";
    msg(mn, new Object[] {"applying policy: ", policy.getClass()});
    policy.apply(this);
    
  }

  public CartItem[] getCartItems() {
    Iterator items = getItems().values().iterator();
    CartItem[] cartItems = new CartItem[getItems().size()];
    int index = 0;
    while (items.hasNext()) {
      cartItems[index] = (CartItem) items.next();
      ++index;
    }
    return cartItems;
  }

  /**
   * Returns the largest size of the items in the cart
   */
  public String getMaxSize() {
    String mn="getMaxSize";
    entry(mn);
    String maxSize = null;
    Iterator items = getItems().values().iterator();
    while (items.hasNext()) {
      String nextSize = ((CartItem)items.next()).getSize();
      if (maxSize == null || isGreater(nextSize, maxSize)) {
        maxSize = nextSize;
      } 
    }
    msg (mn, new String[] {"Max size in the cart is: ", maxSize});
    exit(mn);
    return maxSize;
  }

  private boolean isGreater(String size1, String size2) {
   
    if (size1.toLowerCase().startsWith("tester")) {
      return false;
    } else if(size1.toLowerCase().equals(FrameworkConstants.SIZE_STANDARD.toLowerCase())) { 
      return true;
    } else if (size2.toLowerCase().equals(FrameworkConstants.SIZE_STANDARD.toLowerCase())) {
      return false;
    }	else {
      int size1Num = getNumPart(size1);
      int size2Num = getNumPart(size2); 
      return size1Num > size2Num;
    }
  }
  
  private int getNumPart(String size) {
    String mn = "getNumPart";
    entry(mn);
    msg (mn, new Object[] {"the size of which we are getting the number part is:", size});
    if (size.equalsIgnoreCase("Tester")) {
      return 0;
    }
    if (size.length() == 1) {
      return Integer.parseInt(size.substring(0,1));
    } else if (size.length() == 2){
      return Integer.parseInt(size.substring(0,2));
    } else {
      return Integer.parseInt(size.substring(0,3));      
    }
  }
 
 
  
  protected void entry(String method) {
    logger.entry(getClass(), method);
  }
  
  protected void exit(String method) {
    logger.exit(getClass(), method);
  }
  
  protected void msg(String methodName, String msg) {
    logger.msg(getClass(), methodName, msg);
  }
  
  protected void msg(String methodName, String msg, Exception e) {
    logger.msg(getClass(), methodName, msg, e);
  }

  protected void msg(String methodName, Object[] msg) {

    msg(methodName, getString(msg));
  }
  
  protected void msg(String methodName, Object[] msg, Exception e) {
    
    msg(methodName, getString(msg), e);
  }

  /**
   * 
   * @param msg the message array
   * @return Joins all the elements of the array and returns them as a String
   */  
  public static String getString(Object[] msg) {
    StringBuffer sb = new StringBuffer();
    if (msg != null) {
      for (int i=0; i<msg.length; i++) {
        sb.append(msg[i]);
      }
    }    
    return sb.toString();
  }

  public String getItemTotalAsCurrency() {
    return NumberUtils.getDelimitisedValue(getItemTotal(), 2);
  }

  public String getShippingTotalAsCurrency() {
    return NumberUtils.getDelimitisedValue(getShippingTotal(), 2);
  }

  public String getGrandTotalAsCurrency() {
    return NumberUtils.getDelimitisedValue(getGrandTotal(), 2);
  }

  public boolean isInsuranceRequired() {
    return insuranceRequired == 1;
  }

  public void setInsuranceRequired(String insurance) {
    insuranceRequired = Integer.parseInt(insurance);
    if (insuranceRequired == FrameworkConstants.INSURANCE_REQUIRED_INDICATOR) {
      shippingInsuranceCost = FrameworkConstants.FIXED_POSTAL_INSURANCE_CHARGE;
    }
    
  }  

  public String getShippingInsuranceAsCurrency() {
    return NumberUtils.getDelimitisedValue(shippingInsuranceCost, 2);
  }
  
  public double getShippingInsuranceCost() {
    return shippingInsuranceCost;
  }

  public String getFullShippingTotalAsCurrency() {
    return NumberUtils.getDelimitisedValue(getShippingTotal()+shippingInsuranceCost, 2);
  }
}
