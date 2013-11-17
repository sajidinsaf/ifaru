package com.ifaru.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruActionServlet;
import com.ifaru.framework.IFaruFrameworkObject;
import com.ifaru.util.Logger;

public class SearchAction extends IFaruBaseAction {
  
  public ActionForward iExecute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }

}
