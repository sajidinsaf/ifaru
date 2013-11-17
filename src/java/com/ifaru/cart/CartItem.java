package com.ifaru.cart;

import com.ifaru.catalog.CatalogItem;
import com.ifaru.policy.Policies;
import com.ifaru.policy.Policy;
import com.ifaru.shipping.ShippingOptions;
import com.ifaru.util.NumberUtils;

public class CartItem extends CatalogItem implements CartItemPolicyCandidate {
  
  private int quantity;
  private ShippingOptions shippingOptions = new ShippingOptions();
  private String size;
  private String price;
  private String removeItemFieldId;
  private String categoryIds;
  private double totalPrice;
  private double shippingPrice; // set by the ShippingPolicy
  
  public int getQuantity() {
    return quantity;
  }
  
  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  
  public ShippingOptions getShippingOptions() {
    return shippingOptions;
  }
  
  public void setShippingOptions(ShippingOptions shippingOptions) {
    this.shippingOptions = shippingOptions;
  }

  public String getSize() {
    return size;
  }

  public void setSize(String size) {
    this.size = size;
  }

  public String getPrice() {
    return price;
  }

  public void setPrice(String price) {
    this.price = price;
  }

  public void applyPolicy(Policy policy) {
    // TODO Auto-generated method stub
    
  }

  public void applyPolicies(Policies policies) {
    // TODO Auto-generated method stub
    
  }
  
  public String toString() {
    StringBuffer ci = new StringBuffer(super.toString());
    ci.append(" Size: ");
    ci.append(getSize());
    ci.append(" Price: ");
    ci.append(getPrice());
    ci.append(" Quantity: ");
    ci.append(getQuantity());
    return ci.toString();
  }

  public String getRemoveItemFieldId() {
    return removeItemFieldId;
  }

  public void setRemoveItemFieldId(String removeItemFieldId) {
    this.removeItemFieldId = removeItemFieldId;
  }

  public String getCategoryIds() {
    return categoryIds;
  }

  public void setCategoryIds(String categories) {
    this.categoryIds = categories;
  }

  public double getTotalPrice() {
    return Double.parseDouble(price) * getQuantity();
  }
  
  public String getTotalPriceAsCurrency() {
    return NumberUtils.getDelimitisedValue(getTotalPrice(), 2);
  }

  public void setTotalPrice(double totalPrice) {
    this.totalPrice = totalPrice;
  }
  
  public String getPriceAsCurrency() {
    double price = getPrice() != null ? Double.parseDouble(getPrice()) : 0;
    return NumberUtils.getDelimitisedValue(price, 2);
  }

  public String getShippingPriceAsCurrency() {
    return NumberUtils.getDelimitisedValue(shippingPrice, 2);
  }

  public void setShippingPrice(double shippingPrice) {
    this.shippingPrice = shippingPrice;
  }
}
