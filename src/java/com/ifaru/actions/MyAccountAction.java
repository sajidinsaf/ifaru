package com.ifaru.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.framework.FrameworkConstants;

public class MyAccountAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    request.getSession().setAttribute(FrameworkConstants.MY_ACCOUNT_KEY, "");
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }
  
}
