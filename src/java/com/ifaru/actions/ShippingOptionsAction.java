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

public class ShippingOptionsAction extends IFaruBaseAction {
  
  public ActionForward iExecute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
    return addToCart(form, request, mapping);
  }

  private ActionForward addToCart(ActionForm form, HttpServletRequest request, ActionMapping mapping) throws IFaruException {  
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY) == null) {
      return mapping.findForward(FrameworkConstants.INVALID_SESSION_KEY);
    }
    ShoppingCart cart = (ShoppingCart)session.getAttribute(FrameworkConstants.CART_KEY);
    if (cart == null) {
      cart = new ShoppingCart();
    }
    String region = (String)((DynaActionForm)form).get("region");
    String insurance = (String)((DynaActionForm)form).get("insurance");
    cart.setSelectedShippingOptionId(region);
    cart.setInsuranceRequired(insurance);
    session.setAttribute(FrameworkConstants.FORWARDED_FROM_SHIPPINGOPTIONS, "");
    //log(cart);
    session.setAttribute(FrameworkConstants.CART_KEY, cart);
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
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
