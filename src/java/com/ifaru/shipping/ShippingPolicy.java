package com.ifaru.shipping;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.ifaru.cart.CartItem;
import com.ifaru.cart.IShoppingCart;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.policy.IFaruBasePolicy;
import com.ifaru.policy.PolicyCandidate;


public class ShippingPolicy extends IFaruBasePolicy {

  private static Map shippingOptionsMap = getShippingOptionsMap();
  private static Map packagingPriceMap = getPackagingPriceMap();
  
  public void apply(PolicyCandidate candidate) {
    
    if (!(candidate instanceof IShoppingCart)) {
      return;
    }
    
    IShoppingCart cart = (IShoppingCart) candidate;
    updateShippingTotal(cart);

  }

  private static Map getPackagingPriceMap() {
    Map prices = new HashMap(4);
    prices.put("Tester", "0.10");     
    prices.put("Tester-1ml", "0.10");     
    prices.put("Tester-0.25ml", "0.10");      
    prices.put("3", "0.10");
    prices.put("5", "0.10");    
    prices.put("6", "0.20");
    prices.put("8", "0.20");    
    prices.put("11", "0.25");     
    prices.put("12", "0.25");
    prices.put("15", "0.25");    
    prices.put("20", "0.30");        
    prices.put("24", "0.30");
    prices.put("25", "0.30");    
    prices.put("30", "0.40");    
    prices.put("40", "0.50");       
    prices.put(FrameworkConstants.SIZE_STANDARD, "0.30");    
    return prices;
  }

  /**
   * Calculates the shipping price based on the '50% postage discount for additional items' policy
   * @param cart
   */
  private void updateShippingTotal(IShoppingCart cart) {
    String mn="updateShippingTotal";
    entry(mn);
    Iterator items = cart.getItems().values().iterator();
    String id = cart.getSelectedShippingOptionId();
    msg(mn, new String[] {"selected shipping option is: ", id});
    
    
    // @TODO implement calculation based on Shipping Option
    ShippingOption selectedShippingOption = (ShippingOption)cart.getShippingOptions().get(id);
    
    Map shippingPriceMap = (Map)shippingOptionsMap.get(id);
    /**
     * Initalise the shipping total to the shipping price for maximum size of the cart
     * We will ignore this amount in the loop below when we are calculating the total for 
     * shipping cost for other items.
     */
    String maxSize = cart.getMaxSize();
    double shippingTotal = 0.0;
    double maxSizeItemShippingPrice = 0.0;
    String maxSizeItemId = null;
    if (maxSize != null) {
      msg(mn, new String[] {"Max size is: ", maxSize});
      maxSizeItemShippingPrice = Double.parseDouble(shippingPriceMap.get(maxSize).toString())
      + Double.parseDouble(packagingPriceMap.get(maxSize).toString());
      shippingTotal = maxSizeItemShippingPrice;

    }
    boolean oneMaximumPriceItemEncountered = false;
    while( items.hasNext()) {
      CartItem item = (CartItem) items.next();
      if (!oneMaximumPriceItemEncountered && item.getSize().equalsIgnoreCase(maxSize)){
        oneMaximumPriceItemEncountered = true;
        item.setShippingPrice(maxSizeItemShippingPrice);
        if (item.getQuantity() > 1) {
          /* apply 50% discount on shipping and packaging price for rest of this items quantity */
          double discountedShippingPrice = (((Double.parseDouble(shippingPriceMap.get(item.getSize()).toString())/2)
              * (item.getQuantity()-1))
              + ((Double.parseDouble(packagingPriceMap.get(item.getSize()).toString())/2)) 
                * (item.getQuantity()-1));
          shippingTotal += discountedShippingPrice;    
          // Add the full shipping cost once and then discounted to 50% thereafter.
          item.setShippingPrice(maxSizeItemShippingPrice + discountedShippingPrice);
        }
        
      } else {
        /* apply 50% discount on shipping and packaging price */
        double discountedShippingPrice = (((Double.parseDouble(shippingPriceMap.get(item.getSize()).toString())/2)
            * item.getQuantity())
            + ((Double.parseDouble(packagingPriceMap.get(item.getSize()).toString())/2)) 
              * item.getQuantity());
        shippingTotal += discountedShippingPrice;
        item.setShippingPrice(discountedShippingPrice);        
      } 
      
    }
    msg(mn, new String[] {"calculated shipping price to be: ", String.valueOf(shippingTotal)});
    
    cart.setShippingTotal(shippingTotal);
  }
  
  /**
   * Returns a Map of base shipping price for all items.
   * It is expected that based on the selected shipping option,
   * additional charges will be applied
   */
  public static Map getUkShippingPriceMap() {
    Map prices = new HashMap(12);

    prices.put("Tester", "0.50");     
    prices.put("Tester-1ml", "0.50");     
    prices.put("Tester-0.25ml", "0.50");      
    prices.put("3", "0.50");
    prices.put("5", "0.80");    
    prices.put("6", "0.80");
    prices.put("8", "0.90");    
    prices.put("11", "1.00");     
    prices.put("12", "1.10");
    prices.put("15", "1.10");    
    prices.put("20", "1.20");        
    prices.put("24", "1.20");
    prices.put("25", "1.20");    
    prices.put("30", "1.60");    
    prices.put("40", "1.80");       
    prices.put(FrameworkConstants.SIZE_STANDARD, "1.80");      
  
    return prices;
  }

  /**
   * Returns a Map of base shipping price for all items.
   * It is expected that based on the selected shipping option,
   * additional charges will be applied
   */
  public static Map getInternationalShippingPriceMap() {
    Map prices = new HashMap(21);
    prices.put("Tester", "1.60");       
    prices.put("Tester-1ml", "1.60");     
    prices.put("Tester-0.25ml", "1.60");      
    prices.put("3", "1.60");
    prices.put("5", "1.70");    
    prices.put("6", "1.90");
    prices.put("8", "1.90");    
    prices.put("11", "1.90");     
    prices.put("12", "1.90");
    prices.put("15", "2.00");    
    prices.put("20", "2.50"); 
    prices.put("24", "2.50");    
    prices.put("25", "2.50");
    prices.put("30", "3.60");    
    prices.put("40", "3.80");       
    prices.put(FrameworkConstants.SIZE_STANDARD, "3.00");     
  
    return prices;
  }  
  
  private static Map getShippingOptionsMap() {
    Map options = new HashMap(2);    
    options.put(FrameworkConstants.SHIPPING_OPTION_ID_UK, getUkShippingPriceMap());
    options.put(FrameworkConstants.SHIPPING_OPTION_ID_INTERNATIONAL, getInternationalShippingPriceMap());
    return options;
  }  
}
