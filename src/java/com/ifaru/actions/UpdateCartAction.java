package com.ifaru.actions;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.cart.CartItem;
import com.ifaru.cart.CartItemFactory;
import com.ifaru.cart.ShoppingCart;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruException;

public class UpdateCartAction extends IFaruBaseAction {
  
  public ActionForward iExecute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
    // if the user has clicked the view cart button then just send them to the cart page.
    if (request.getParameter(FrameworkConstants.VIEW_CART_KEY) != null) {
      return mapping.findForward(FrameworkConstants.DEFAULT_KEY);  
    }
    if (!isValidSession(form, request, response)) {
      return mapping.findForward(FrameworkConstants.INVALID_SESSION_KEY);
    }
    return addToCart(form, request, mapping);
  }

  private boolean isValidSession(ActionForm form, HttpServletRequest request,
      HttpServletResponse response) {
    HttpSession session = request.getSession(false);
    ShoppingCart cart = (ShoppingCart)session.getAttribute(FrameworkConstants.CART_KEY);
    if (session == null 
        || session.getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY) == null
        || cart == null
        || cart.getShippingOptions() == null) {
      // something must be wrong
      return false;
    }    
    return true;
  }

  private ActionForward addToCart(ActionForm form, HttpServletRequest request, ActionMapping mapping) throws IFaruException {
    String mn = "addToCart";
    HttpSession session = request.getSession(false);
    ShoppingCart cart = (ShoppingCart)session.getAttribute(FrameworkConstants.CART_KEY);

    
    Enumeration params = request.getParameterNames();
    List removeItemsList = new ArrayList();
    if (cart.getItems().size() > 0) {
      while (params.hasMoreElements()) {
        String paramName = params.nextElement().toString();
        msg(mn, new Object[] {"checking for param name: ", paramName});

        if (paramName.indexOf(FrameworkConstants.PRICE_FIELD_ID_END) != -1) {
          msg(mn, new Object[] {"looking for item match for param name: ", paramName});          
          Iterator items = cart.getItems().values().iterator();          
          while(items.hasNext()) {
            CartItem item = (CartItem)items.next();
            /* find the right item based on the priceFieldId and size*/
            if (paramName.indexOf(item.getPriceFieldId()) != -1 && item.getSize().toString().equalsIgnoreCase(getSize(paramName))) {
              msg (mn, new Object[] {"Matched item ", item, " to paramName ", paramName});
              int quantity = getQuantity(request.getParameter(paramName), item); 
              if (request.getParameter(item.getRemoveItemFieldId()) != null || quantity < 1) {
                removeItemsList.add(ShoppingCart.getMapId(item));
              } else {
                item.setQuantity(quantity);
              }
            }
          }  
        }
      }
    }
    if (!removeItemsList.isEmpty()) {
      Iterator ids = removeItemsList.iterator();
      while (ids.hasNext()) {
        cart.getItems().remove(ids.next());
      }
    }
    cart.applyPolicies(getPolicies());
    //log(cart);
    session.setAttribute(FrameworkConstants.CART_KEY, cart);
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }
  
  private int getQuantity(String paramValue, CartItem item) {
    String mn = "getQuantity";
    String validChars = "012345689-";
    char[] paramValArray = paramValue.toCharArray();
    for (int i=0; i<paramValArray.length; i++) {
      if (validChars.indexOf(paramValArray[i]) == -1) {
        msg (mn, new Object[] {"returning original item quanity ", new Integer(item.getQuantity()), " as the invalid character ", new Character(paramValArray[i]), " was found in the updated price ", paramValue, " for item ", item.getId(), item.getSize() });
        return item.getQuantity();
      }
    }
    return Integer.parseInt(paramValue);
  }

  private String getSize(String paramName) {
    String mn = "getSize(String)";
    String sep = FrameworkConstants.CART_ITEM_ID_FIELD_SEPERATOR;
    int sizeIndex = paramName.toLowerCase().indexOf(sep)+sep.length();
    String size = paramName.substring(sizeIndex, paramName.length());
    msg(mn, new String[] {"Got size: ", size, " from paramName ", paramName});
    return size;
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
