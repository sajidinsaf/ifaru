package com.ifaru.policy;

import com.ifaru.framework.IFaruException;

public interface PolicyCandidate {

  public void applyPolicy(Policy policy) throws IFaruException;
  public void applyPolicies(Policies policies) throws IFaruException;
  
}
