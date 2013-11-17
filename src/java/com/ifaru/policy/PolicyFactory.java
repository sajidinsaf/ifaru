package com.ifaru.policy;

import com.ifaru.cart.ShoppingCartItemPolicy;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.shipping.ShippingPolicy;
import com.ifaru.util.Logger;

public class PolicyFactory {

  public static PolicyFactory factory;
  private static Policies policies;  
  private static Logger logger;
  private boolean initialised;
  
  private PolicyFactory(){
    policies = new Policies();    
  }
  
  public static PolicyFactory getInstance() {
    if (factory == null) {
      factory = new PolicyFactory();
    }
    return factory;
  }
  
  public void init(FrameworkFacade facade) {
    loadPolicies(facade);
    initialised = true;
  }
  
  public Policy getPolicy(Class policyClass) throws IFaruException {
    return (Policy) policies.get(policyClass);
    
  }

  public Policies getPolicies() {
    return policies;
  }
  
  private static void loadPolicies(FrameworkFacade facade) {
    policies.put(ShippingPolicy.class, new ShippingPolicy()); 
    policies.put(ShoppingCartItemPolicy.class, new ShoppingCartItemPolicy());
  }

  public boolean isInitialised() {
    return initialised;
  }

}
