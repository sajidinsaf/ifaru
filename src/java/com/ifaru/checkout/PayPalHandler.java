package com.ifaru.checkout;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.DynaActionForm;

import com.ifaru.cart.CartItem;
import com.ifaru.cart.IShoppingCart;
import com.ifaru.cart.ShoppingCart;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.framework.IFaruIdentifiableObject;
import com.ifaru.order.Order;
import com.ifaru.order.OrderItem;
import com.ifaru.order.OrderItemFactory;
import com.ifaru.user.Customer;
import com.ifaru.util.Logger;
import com.ifaru.util.MailUtil;

public class PayPalHandler extends IFaruIdentifiableObject implements
    PaymentHandler {

  private Logger logger = Logger.getInstance();

  private FrameworkFacade facade;

  public PaymentResponse handlePayment(IShoppingCart cart, ActionForm form, HttpServlet servlet,
      HttpServletRequest request, HttpServletResponse response) {
    
    if (request.getParameter(FrameworkConstants.PAYPAL_PAYMENT_FORWARD_KEY) != null) {
      return new PayPalRedirectHandler().forwardToPayPal(cart, form, servlet, request, response);
    }
    
    PayPalPaymentSuccessNotificationHandler snHandler = new PayPalPaymentSuccessNotificationHandler();
    try {
      snHandler.init(facade);
    } catch (IFaruException e) {
      PayPalPaymentResponse paymentResponse = new PayPalPaymentResponse();
      paymentResponse.setException(e);
      paymentResponse.setFailureReason(PaymentResponse.PAYPAL_SUCCESSFUL_PAYMENT_EMAIL_NOTIFICATION_FAILURE);
      return paymentResponse;
    }
    return snHandler.handlePaymentResponse(cart, form, servlet, request, response);
    
  }

  public void init(FrameworkFacade facade) {
      this.facade = facade;
  }


}

