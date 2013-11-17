package com.ifaru.actions;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.data.xml.fragrance.Fragrance;
import com.ifaru.data.xml.fragrance.Fragrances;
import com.ifaru.framework.FrameworkConstants;

public class GetFragranceInfoAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    String id = request.getParameter(FrameworkConstants.FRAGRANCE_ID_KEY);
    //System.out.println("Received id: "+ id);
    if ( id != null &&
        request.getSession(true).getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY) != null) {
      Iterator fragrances = ((Fragrances)request.getSession(true).getAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY)).getFragrances().iterator();
      while (fragrances.hasNext()) {
        Fragrance fragrance = (Fragrance)fragrances.next();
        //System.out.println("Found id: "+ fragrance.getId());
        if (fragrance.getId().equals(id)) {
          request.getSession().setAttribute(FrameworkConstants.FRAGRANCE_KEY, fragrance);
          //System.out.println("Found fragrance: "+fragrance.getName());
          break;
        }
      }
    }
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);    
  }

}
