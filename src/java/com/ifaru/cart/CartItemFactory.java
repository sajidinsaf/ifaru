package com.ifaru.cart;

import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.DynaActionForm;

import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.CatalogItems;
import com.ifaru.catalog.Size;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.policy.PolicyFactory;
import com.ifaru.util.Logger;

public class CartItemFactory {

  public static CartItemFactory factory;
  private static Logger logger;

  private CartItemFactory(){
    logger = Logger.getInstance();
    
  }
  
  public static CartItemFactory getInstance() {
    if (factory == null) {
      factory = new CartItemFactory();
    }
    return factory;
  }
  
  public static void init(FrameworkFacade facade) {
    if (factory == null) {
      factory = new CartItemFactory();
    }
    logger = facade.getLogger();
  }
  
  public CartItem getItem(ActionForm form, HttpServletRequest request) throws IFaruException {
    CartItem cartItem = createFromForm(form, request);
    
    return cartItem;
  }

  private CartItem createFromForm(ActionForm form, HttpServletRequest request) throws IFaruException {
    String mn = "";
    String id = ((DynaActionForm)form).get("id").toString();
    String size = ((DynaActionForm)form).get("size").toString();
    int quantity = Integer.parseInt(((DynaActionForm)form).get("quantity").toString());
    CartItem cartItem = new CartItem();
    cartItem.setQuantity(quantity);
    cartItem.setId(id);
    cartItem.setSize(size);
    msg (mn, new String[] {"Item : ",id, " of size: ", size, " for session: ", request.getSession().getId(), " is about to be enriched" });
    cartItem = enrichItem(cartItem, request);
    return cartItem;
  }

  private CartItem enrichItem(CartItem cartItem, HttpServletRequest request) throws IFaruException {
    String mn = "enrichItem";
    Iterator catItems = ((CatalogItems)request.getSession().getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY)).getItems().iterator();
    CatalogItem catItem = null;
    while (catItems.hasNext()) {
      catItem = (CatalogItem)catItems.next();
      if (catItem.getId().equals(cartItem.getId())) {
        break;
      }
    }

    cartItem.setBrandId(catItem.getBrandId());
    cartItem.setCategoryIds(catItem.getCategoryIds());
    cartItem.setDescription(catItem.getDescription());
    cartItem.setGender(catItem.getGender());
    cartItem.setImage(catItem.getImage());
    cartItem.setInformation(catItem.getInformation());
    cartItem.setName(catItem.getName());
    cartItem.setPriceFieldId(catItem.getPriceFieldId());
    Size size = catItem.getSize(cartItem.getSize());
    msg(mn, new String[] {"setting price for item: ", cartItem.getId(), " of size: ", cartItem.getSize()});
    cartItem.setPrice(size.getSalePrice());
    cartItem.applyPolicies(PolicyFactory.getInstance().getPolicies());
    cartItem.setRemoveItemFieldId(catItem.getId()+FrameworkConstants.REMOVE_ITEM_FIELD_ID_END+FrameworkConstants.CART_ITEM_ID_FIELD_SEPERATOR+cartItem.getSize());
    msg(mn, new Object[] {"Enriched Item: ", cartItem});
    return cartItem;
  }  
  

  protected void entry(String method) {
    logger.entry(CartItemFactory.class, method);
  }
  
  protected void exit(String method) {
    logger.exit(CartItemFactory.class, method);
  }
  
  protected void msg(String method, String msg) {
    if(logger != null)
    {
       logger.msg(CartItemFactory.class, method, msg);
    }
  }
  
  protected void msg(String method, String msg, Exception e) {
    logger.msg(CartItemFactory.class, method, msg, e);
  }


  protected void msg(String methodName, Object[] msg) {
    if (Logger.isEnabled()) {
     msg(methodName, getString(msg));
    }
  }
  
  protected void msg(String methodName, String[] msg, Exception e) {
    if (Logger.isEnabled()) {    
      msg(methodName, getString(msg), e);
    }      
  }
  
  /**
   * 
   * @param msg the message array
   * @return Joins all the elements of the array and returns them as a String
   */
  public static String getString(Object[] msg) {
    StringBuffer sb = new StringBuffer();
    if (msg != null) {
      for (int i=0; i<msg.length; i++) {
        sb.append(msg[i]);
      }
    }    
    return sb.toString();
  }  
    
}
