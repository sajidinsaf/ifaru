package com.ifaru.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.framework.FrameworkConstants;

public class UserAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    if (request.getParameter(FrameworkConstants.VIEW_CART_KEY) != null) {
      return mapping.findForward(FrameworkConstants.DEFAULT_KEY);      
    }
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }

}
