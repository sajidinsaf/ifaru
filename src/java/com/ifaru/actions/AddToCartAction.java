package com.ifaru.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import com.ifaru.cart.CartItem;
import com.ifaru.cart.CartItemFactory;
import com.ifaru.cart.ShoppingCart;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruException;

public class AddToCartAction extends IFaruBaseAction {
  
  public ActionForward iExecute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
    return addToCart(form, request, mapping);
  }

  private ActionForward addToCart(ActionForm form, HttpServletRequest request, ActionMapping mapping) throws IFaruException {  
    HttpSession session = request.getSession(false);
    /* check that this is a valid session */

    if(!validateRequest(request, form)) {
      return mapping.findForward(FrameworkConstants.INVALID_SESSION_KEY);
    }

    ShoppingCart cart = (ShoppingCart)session.getAttribute(FrameworkConstants.CART_KEY);
    if (cart == null) {
      cart = new ShoppingCart();
    }    
    CartItem item = CartItemFactory.getInstance().getItem(form, request);
    cart.addItem(item);    
    if (cart.getSelectedShippingOptionId() == null) {
      return mapping.findForward(FrameworkConstants.SHIPPING_OPTIONS_KEY);
    }    
    /* check whether we have been forwarded from the shipping options page. 
     * This would mean that we have already added the item to the cart 
     * So just forward to the DEFAULT route*/
    if (session.getAttribute(FrameworkConstants.FORWARDED_FROM_SHIPPINGOPTIONS) != null) {
      session.removeAttribute(FrameworkConstants.FORWARDED_FROM_SHIPPINGOPTIONS);
    }
    cart.applyPolicies(getPolicies());
    //log(cart);
    session.setAttribute(FrameworkConstants.CART_KEY, cart);

    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }
  
  private boolean validateRequest(HttpServletRequest request, ActionForm form) {
    String mn = "validateRequest";
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY) == null) {
      return false;
    }
    String qty = ((DynaActionForm)form).getString("quantity");
    if (qty == null || qty.trim().equals("")) {
      return false;
    }
    try {
      Integer.parseInt(qty);
    } catch (Exception e) {
      msg(mn, "Non numeric value received for quantity", e);
      return false;
    }
    return true;
  }

  private void log(ShoppingCart cart) {

    System.out.println("Items in cart: "+ cart.getItems().size());

    java.util.Iterator items = cart.getItems().values().iterator();
    while (items.hasNext()) {
      System.out.println(items.next());
      
    }
    System.out.println("Item total: "+cart.getItemTotal());
    System.out.println("Shipping total: "+cart.getShippingTotal());    
  }

}
