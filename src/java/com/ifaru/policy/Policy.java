package com.ifaru.policy;

import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;

public interface Policy {
  
  public void apply(PolicyCandidate candidate) throws IFaruException;

}
