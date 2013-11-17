package com.ifaru.checkout;


import java.util.HashMap;
import java.util.Map;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.util.Logger;

public class PaymentHandlerFactory {

  private static PaymentHandlerFactory factory;
  private static Logger logger = Logger.getInstance();
  
  private PaymentHandlerFactory(){}
  private Map handlers = new HashMap();
  
  public static PaymentHandlerFactory getInstance() throws IFaruException {
    if (factory == null) {
      factory = new PaymentHandlerFactory();
    }
    return factory;
  }
  
  public void init(FrameworkFacade facade) throws IFaruException {
      factory = new PaymentHandlerFactory();
      PaymentHandler handler = new PayPalHandler();
      handler.init(facade);
      handlers.put(FrameworkConstants.CHECKOUT_OPTION_PAYPAL, handler);
      handler = new NochexHandler();
      handler.init(facade);
      handlers.put(FrameworkConstants.CHECKOUT_OPTION_NOCHEX, handler);
      handler = new ChequeHandler();
      handler.init(facade);
      handlers.put(FrameworkConstants.CHECKOUT_OPTION_CHEQUE, handler);
    if (facade != null) {
      logger = facade.getLogger();
    }
  }
  
  public PaymentHandler getPaymentHandler(String key) {
  
    return (PaymentHandler)handlers.get(key);
  }
 
  
  public static void main(String args[]) throws IFaruException {
//    File file = new File("C:/projects/ifaru/data/catalog/catalog.xml");
    PaymentHandlerFactory factory = PaymentHandlerFactory.getInstance();
//    try {
//      Pa shippingOptions = factory.getShippingOptions(file);
//        Iterator frags = shippingOptions.values().iterator();
//        System.out.println("Number of Items: "+ shippingOptions.size());
//        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//        System.out.println("");                
//
//        while (frags.hasNext()) {
//          ShippingOption frag = (ShippingOption) frags.next();
//          System.out.println("Shipping Option Id: "+frag.getId());   
//          System.out.println("Shipping Option Name: "+frag.getName()); 
//
//
//     
//        }
//
//    } catch (IOException e) {
//      e.printStackTrace();
//    } catch (SAXException e) {
//      e.printStackTrace();
//    }
  }
}

