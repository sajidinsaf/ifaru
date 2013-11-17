package com.ifaru.cart;

import java.util.Iterator;

import com.ifaru.framework.IFaruException;
import com.ifaru.policy.IFaruBasePolicy;
import com.ifaru.policy.Policy;
import com.ifaru.policy.PolicyCandidate;


/**
 * 1. Calculates the item total
 * 2. Applies discounts
 * 3. Calculates the grand total and sets it on the item
 * @author Sajid Insaf
 *
 */
public class ShoppingCartItemPolicy extends IFaruBasePolicy {

  public void apply(PolicyCandidate candidate) throws IFaruException {
    if (!(candidate instanceof IShoppingCart)) {
      return;
    }
    
    IShoppingCart cart = (IShoppingCart) candidate;
    updateItemTotal(cart);

  }

  private void updateItemTotal(IShoppingCart cart) {
    String mn = "updateItemTotal(IShoppingCart)";
    Iterator items = cart.getItems().values().iterator();
    double runningTotal = 0.0;
    while (items.hasNext()) {
      CartItem item = (CartItem)items.next();
      runningTotal += (Double.parseDouble(item.getPrice()) * item.getQuantity());
    }
    msg(mn, new String[] {"calculated shipping price to be: ", String.valueOf(runningTotal)});    
    cart.setItemTotal(runningTotal);
  }

}
