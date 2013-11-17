package com.ifaru.actions;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.gallery.Gallery;
import com.ifaru.gallery.Picture;

public class GetGalleryPictureAction extends IFaruBaseAction {

  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    if (request.getParameter("id") == null || request.getParameter("id").equals("") || request.getSession(false) == null) {
      return mapping.findForward(FrameworkConstants.HOME_KEY);
    }
    
    request.getSession().removeAttribute(FrameworkConstants.GALLERY_PICTURE_KEY);
    request.getSession().removeAttribute(FrameworkConstants.GALLERY_PICTURE_PREVIOUS_KEY);
    request.getSession().removeAttribute(FrameworkConstants.GALLERY_PICTURE_NEXT_KEY);
    
    List gallery = ((Gallery)request.getSession(true).getAttribute(FrameworkConstants.GALLERY_KEY)).getPictures();
    if (gallery == null) {
      return mapping.findForward(FrameworkConstants.HOME_KEY);
    } else {
      Picture picture = null;
      Picture previousPicture = null;
      Picture nextPicture = null;
      Iterator pics = gallery.iterator();
      
      while (pics.hasNext()) {
        picture = (Picture) pics.next();
        if (picture.getId().equals(request.getParameter("id"))) {
          request.getSession().setAttribute(FrameworkConstants.GALLERY_PICTURE_KEY, picture);
          if (previousPicture != null) {
            request.getSession().setAttribute(FrameworkConstants.GALLERY_PICTURE_PREVIOUS_KEY, previousPicture);
          }
          if (pics.hasNext()) {
            nextPicture = (Picture)pics.next();
            request.getSession().setAttribute(FrameworkConstants.GALLERY_PICTURE_NEXT_KEY, nextPicture);
          }
          break;
        }
        previousPicture = picture;
      }
    }
    return mapping.findForward(FrameworkConstants.DEFAULT_KEY);
  }

}
