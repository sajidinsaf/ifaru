package com.ifaru.checkout;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;

import com.ifaru.cart.IShoppingCart;
import com.ifaru.cart.ShoppingCart;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;

public interface PaymentHandler {

  public PaymentResponse handlePayment(IShoppingCart cart, ActionForm form, HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws IFaruException;
  
  public void init(FrameworkFacade facade) throws IFaruException;
}
