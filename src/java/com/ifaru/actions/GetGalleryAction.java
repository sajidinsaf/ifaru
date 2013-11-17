package com.ifaru.actions;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.xml.sax.SAXException;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.gallery.Gallery;
import com.ifaru.gallery.GalleryFactory;

public class GetGalleryAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    Gallery gallery = (Gallery)request.getSession(true).getAttribute(FrameworkConstants.GALLERY_KEY);
    String galleryName = request.getParameter("galleryName");
    if (gallery == null && galleryName == null) {
      return mapping.findForward(FrameworkConstants.HOME_KEY);
    }
    if (gallery == null || (galleryName != null && !gallery.getName().equals(galleryName))) {
      init(request, form);
      return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
    } 
    
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }

  private void init(HttpServletRequest request, ActionForm form) throws IOException, SAXException {
    String mn="init";
    String galleryName = request.getParameter("galleryName");
    msg(mn, "Request to view gallery: "+galleryName);
    String galleryFile = this.getServlet().getInitParameter(request.getParameter("galleryName"));
    this.msg(mn, "Reading gallery descriptor file: "+galleryFile);
    File galleryDescriptor = new File(getServlet().getServletContext().getRealPath("/")+File.separator+galleryFile);
    Gallery gallery = GalleryFactory.getInstance().getXMLGallery(galleryDescriptor);
    gallery.setName(galleryName);
    request.getSession(true).setAttribute(FrameworkConstants.GALLERY_KEY, gallery);
  }

}
