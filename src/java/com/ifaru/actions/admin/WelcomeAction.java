package com.ifaru.actions.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.framework.FrameworkConstants;

public class WelcomeAction extends Action {

  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {

    HttpSession session = request.getSession(true);
    session.removeAttribute(FrameworkConstants.SUCCESS_KEY);
    session.removeAttribute("alreadyExists");
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }

}
