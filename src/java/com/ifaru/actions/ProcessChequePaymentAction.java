package com.ifaru.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.cart.ShoppingCart;
import com.ifaru.checkout.PaymentHandler;
import com.ifaru.checkout.PaymentHandlerFactory;
import com.ifaru.checkout.PaymentResponse;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruException;
import com.ifaru.order.Order;

public class ProcessChequePaymentAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) throws IFaruException {
      PaymentHandlerFactory factory = PaymentHandlerFactory.getInstance();
      factory.init(getFrameworkFacade());
      PaymentHandler handler = factory.getPaymentHandler(FrameworkConstants.CHECKOUT_OPTION_CHEQUE);
      ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute(FrameworkConstants.CART_KEY);    
      PaymentResponse pr = handler.handlePayment(cart, form, getServlet(), request, response);
      request.getSession().setAttribute(FrameworkConstants.PAYMENT_RESULT, pr);
//      request.getSession().removeAttribute(FrameworkConstants.CART_KEY);
//      return mapping.findForward(FrameworkConstants.SUCCESS_KEY);
      if (pr.isSuccess()) {
        request.getSession().removeAttribute(FrameworkConstants.CART_KEY);
        return mapping.findForward(FrameworkConstants.SUCCESS_KEY);
      } else {
        if (pr.getException() != null) {
          msg("iExecute", "Exception thrown during handling cheque payment", pr.getException());
          pr.getException().printStackTrace();
        }        
        if (pr.getFailureReason() == PaymentResponse.BAD_EMAIL_ADDRESS) {
          msg("iExecute", "payment process failed due to bad email");
          request.getSession().setAttribute(FrameworkConstants.PAYMENT_RESULT, PaymentResponse.BAD_EMAIL_ADDRESS);
          return mapping.findForward(FrameworkConstants.INVALID_EMAIL_ADDRESS_KEY);
        } else {
          msg("iExecute", "payment process failed due to internal error");
          request.getSession().setAttribute(FrameworkConstants.PAYMENT_RESULT, PaymentResponse.IFARU_INTERNAL_ERROR);
          return mapping.findForward(FrameworkConstants.FAILURE_KEY);
        }
      }

  }

  
}
