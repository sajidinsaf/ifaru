package com.ifaru.actions.admin;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.util.CatalogWriter;

public abstract class SaveUpdatesAction extends IFaruBaseAction {


  @Override
  public final ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    
    ActionForward af = saveUpdates(mapping, form, request, response);
    if (af.getName().equals(FrameworkConstants.SUCCESS_KEY) && session.getAttribute("alreadyExists") == null) {
      FrameworkFacade facade = getFrameworkFacade();
      CatalogWriter writer = CatalogWriter.getInstance(facade);
      writer.writeCatalog(catalogItems, getCatalogUpdatesFile());
    }
    return af;
  }

  protected abstract ActionForward saveUpdates (ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
  throws Exception;
}
