package com.ifaru.order;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.DynaActionForm;

import com.ifaru.cart.CartItem;
import com.ifaru.cart.ShoppingCart;
import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.CatalogItems;
import com.ifaru.catalog.Size;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.policy.PolicyFactory;
import com.ifaru.user.Customer;
import com.ifaru.util.Logger;

public class OrderItemFactory {

  public static OrderItemFactory factory;
  private static Logger logger = Logger.getInstance();

  private OrderItemFactory(){

    
  }
  
  public static OrderItemFactory getInstance() {
    if (factory == null) {
      factory = new OrderItemFactory();
    }
    return factory;
  }
  
  public List getOrderItems(ActionForm form, HttpServletRequest request) throws IFaruException {
    List orderItems = createFromCart(form, request);
    
    return orderItems;
  }

  private List createFromCart(ActionForm form, HttpServletRequest request) throws IFaruException {
    ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute(FrameworkConstants.CART_KEY);
    List orderItems = new ArrayList();
    CartItem[] items = cart.getCartItems();
    for (int i=0; i<items.length; i++) {
      OrderItem oi = new OrderItem();
      orderItems.add(getOrderItem(items[i], form, request));
    }

    return orderItems;
  }

  private OrderItem getOrderItem(CartItem cartItem, ActionForm form, HttpServletRequest request) throws IFaruException {
    OrderItem orderItem = new OrderItem();
    orderItem.setQuantity(cartItem.getQuantity());
    orderItem.setId(cartItem.getId());
    orderItem.setSize(cartItem.getSize());

    orderItem.setBrandId(cartItem.getBrandId());
    orderItem.setCategoryIds(cartItem.getCategoryIds());
    orderItem.setDescription(cartItem.getDescription());
    orderItem.setGender(cartItem.getGender());
    orderItem.setImage(cartItem.getImage());
    orderItem.setInformation(cartItem.getInformation());
    orderItem.setName(cartItem.getName());
    orderItem.setPrice(cartItem.getPrice());
    orderItem.setName(cartItem.getName());
    Customer customer = (Customer) request.getSession().getAttribute(FrameworkConstants.CUSTOMER_KEY);
    orderItem.setCustomer(customer);
    return orderItem;
  }  
  
  
}
