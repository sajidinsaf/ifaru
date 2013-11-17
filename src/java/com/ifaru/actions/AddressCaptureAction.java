package com.ifaru.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.user.Address;
import com.ifaru.user.Customer;

public class AddressCaptureAction extends IFaruBaseAction {

  private static final String ON = "ON";

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    
    request.removeAttribute(FrameworkConstants.GET_SHIPPING_ADDRESS_KEY);
    if (request.getSession(true).getAttribute(FrameworkConstants.CART_KEY) == null) {
      return mapping.findForward(FrameworkConstants.INVALID_SESSION_KEY);      
    } 

    if (request.getParameter("checkout") != null) { //@see cart.jsp submit button for Checkout
      System.out.println("going to billing address capture");
      return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
    } 
    Address address = (Address)form;
    // this is the billing address set it to the session
    if (address.getType().equals( Address.BILLING)) {
      request.getSession().setAttribute(FrameworkConstants.BILLING_ADDRESS, address);
      // if this is also the shipping address set it to the session as the shipping address
      if ((address.getShipToBill() != null && address.getShipToBill().equalsIgnoreCase(ON))) {
        request.getSession().setAttribute(FrameworkConstants.SHIPPING_ADDRESS, address);
        return mapping.findForward(FrameworkConstants.SUCCESS_KEY);
      } 
      // if there is no shipping address already in the session get one. 
      // @ TODO remember to clear the shipping address from the session after checkout or we will not be able
      // to capture another shipping address until this session is invalidated.
      else if (request.getSession().getAttribute(FrameworkConstants.SHIPPING_ADDRESS) == null) {
        request.getSession().setAttribute(FrameworkConstants.GET_SHIPPING_ADDRESS_KEY, "true");
        System.out.println("going to shipping address capture");
        return mapping.findForward(FrameworkConstants.GET_SHIPPING_ADDRESS_KEY);
      }
    }
    if (address.getType().equals(Address.SHIPPING)) {
      request.getSession().setAttribute(FrameworkConstants.SHIPPING_ADDRESS, address);
    } 
     //@see addresscapture.jsp submit button
    return mapping.findForward(FrameworkConstants.SUCCESS_KEY);
  }



}
