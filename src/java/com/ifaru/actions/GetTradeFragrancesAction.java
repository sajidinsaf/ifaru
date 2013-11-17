package com.ifaru.actions;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.data.xml.fragrance.Fragrance;
import com.ifaru.data.xml.fragrance.FragranceFactory;
import com.ifaru.data.xml.fragrance.Fragrances;
import com.ifaru.framework.FrameworkConstants;

public class GetTradeFragrancesAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    String alphabet = request.getParameter(FrameworkConstants.ALPHABETIC_ORDER_PARAM_NAME);
    Fragrances fragrances = null;
    FragranceFactory.init(getFrameworkFacade());
    String fileName = getServlet().getInitParameter(FrameworkConstants.FRAGRANCE_DATA_FILE_KEY);
    File dataFile = new File(getServlet().getServletContext().getRealPath(fileName));
    fragrances = FragranceFactory.getInstance().getFragrances(dataFile);
    request.getSession(true).setAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY, fragrances);
        
    if (alphabet == null) {
      return mapping.findForward(FrameworkConstants.DEFAULT_KEY);      
    } else if (fragrances != null && fragrances.getFragrances() != null && !fragrances.getFragrances().isEmpty()
        && alphabet != null && !alphabet.toLowerCase().endsWith("all")) {
      return getAlphabeticFragrances(fragrances, alphabet, request, mapping);
    }
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }

  private ActionForward getAlphabeticFragrances(Fragrances fragrances, String alphabet, HttpServletRequest request, ActionMapping mapping) {
    Iterator iter = fragrances.getFragrances().iterator();
    Fragrances newSet = new Fragrances();
    while (iter.hasNext()) {
      Fragrance fragrance = (Fragrance)iter.next();
      if (fragrance.getName().toUpperCase().startsWith(alphabet.toUpperCase())) {
        newSet.addFragrance(fragrance);
      }
    }
    request.getSession(true).setAttribute(FrameworkConstants.CATALOGITEMS_OBJECT_KEY, newSet);
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }

}
