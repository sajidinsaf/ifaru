package com.ifaru.checkout;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;

import com.ifaru.cart.CartItem;
import com.ifaru.cart.IShoppingCart;

public class PayPalRedirectHandler {

  public PaymentResponse forwardToPayPal(IShoppingCart cart, ActionForm form,
      HttpServlet servlet, HttpServletRequest request,
      HttpServletResponse response) {
    PayPalPaymentResponse paymentResponse = new PayPalPaymentResponse();
    
    try {
      response.sendRedirect(new HtmlBuilder().constructPaypalUrl(cart, form, request));
      paymentResponse.setSuccess(true);
      return paymentResponse;
    } catch (IOException e) {
      paymentResponse.setSuccess(false);
      paymentResponse.setException(e);  
      paymentResponse.setFailureReason(PaymentResponse.UNDEFINED_IO_ERROR);
    }
    
    return paymentResponse;
    
  }


}