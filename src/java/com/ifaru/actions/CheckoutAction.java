package com.ifaru.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.cart.ShoppingCart;
import com.ifaru.framework.FrameworkConstants;

public class CheckoutAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) throws Exception {

    HttpSession session = request.getSession(false);

    if (!isValidRequest(session)) {
      return mapping.findForward(FrameworkConstants.INVALID_SESSION_KEY);
    }
    
    String checkoutOption = request.getParameter(FrameworkConstants.CHECKOUT_OPTION_KEY);
    /* verify that a spurious checkout option has not been sent */
    if (!isValidOption(checkoutOption)) {
      return mapping.findForward(FrameworkConstants.INVALID_SESSION_KEY);      
    }
    
    return forwardPayment(mapping, form, request, response);
  }

  private ActionForward forwardPayment(ActionMapping mapping, ActionForm form,
    HttpServletRequest request, HttpServletResponse response) throws Exception {
    String checkoutOption = request.getParameter(FrameworkConstants.CHECKOUT_OPTION_KEY);
      if (checkoutOption.equalsIgnoreCase(FrameworkConstants.CHECKOUT_OPTION_CHEQUE)) {
        return mapping.findForward(FrameworkConstants.CHEQUE_PAYMENT_FORWARD_KEY);
      } else if(checkoutOption.equalsIgnoreCase(FrameworkConstants.CHECKOUT_OPTION_NOCHEX)) {
        return mapping.findForward(FrameworkConstants.NOCHEX_PAYMENT_FORWARD_KEY);
      } else if (checkoutOption.equalsIgnoreCase(FrameworkConstants.CHECKOUT_OPTION_PAYPAL)){
        return mapping.findForward(FrameworkConstants.PAYPAL_PAYMENT_FORWARD_KEY);
      } 
    return mapping.findForward(FrameworkConstants.PAYMENT_ERROR_KEY);

  }

  private boolean isValidOption(String checkoutOption) {
    if (checkoutOption != null) {
      checkoutOption = checkoutOption.trim();
      if (checkoutOption.equalsIgnoreCase(FrameworkConstants.CHECKOUT_OPTION_PAYPAL)
          || checkoutOption.equalsIgnoreCase(FrameworkConstants.CHECKOUT_OPTION_NOCHEX)
          || checkoutOption.equalsIgnoreCase(FrameworkConstants.CHECKOUT_OPTION_CHEQUE)){
        return true;
      }
    } 
    return false;
  }

  private boolean isValidRequest(HttpSession session) {

    /* check session validity */
    if (session == null || session.getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY) == null) {
      return false;
    }
    
    /* check shopping cart validity */ 
    ShoppingCart cart = (ShoppingCart) session.getAttribute(FrameworkConstants.CART_KEY);
    if ( cart == null || cart.getItems().isEmpty()) {
      return false;
    }
    return true;
  }
  
}
