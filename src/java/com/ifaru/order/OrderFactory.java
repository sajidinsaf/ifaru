package com.ifaru.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruException;
import com.ifaru.user.Customer;

public class OrderFactory {

  private static OrderFactory factory;
  
  private OrderFactory() {
    
  }
  
  public static OrderFactory getInstance() {
    if (factory == null) {
      factory = new OrderFactory();
    }
    return factory;
  }
  
  public Order createOrder() {
  
return null;
  }

  public Order getOrder(ActionForm form, HttpServletRequest request) throws IFaruException {
    
    OrderItemFactory factory = OrderItemFactory.getInstance();
    List orderItems = factory.getOrderItems(form, request);
    long orderNumber = OrderNumberFactory.getInstance().getUniqueOrderNumber();
    Order order = new Order();
    order.setOrderItems(orderItems);
    // we should have a valid customer object in the session by the time we get here otherwise something is quite wrong
    Customer customer = (Customer)request.getSession().getAttribute(FrameworkConstants.CUSTOMER_KEY);
    order.setCustomer(customer);
    OrderNumberFactory onFactory = OrderNumberFactory.getInstance();
    order.setOrderNumber(onFactory.getUniqueOrderNumber());
        
    return order;
  }
}
