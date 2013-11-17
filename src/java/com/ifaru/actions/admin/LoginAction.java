package com.ifaru.actions.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.xml.sax.SAXException;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruException;
import com.ifaru.security.sha.PasswordService;
import com.ifaru.security.sha.SystemUnavailableException;
import com.ifaru.util.Logger;

/**
 * This class does not extend IFaruBaseAction because we don't want it to be validated as a 
 * User action class. Maybe in future we need an IFaruAdminAction which will perform default admin
 * session validation actions.
 * 
 * 
 * @author Sajid Insaf
 *
 */
public class LoginAction extends IFaruBaseAction {

  protected Logger logger = Logger.getInstance();
  
  public ActionForward iExecute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) throws IOException, SAXException, SystemUnavailableException, IFaruException {
    String mn = "iExecute";
   
    HttpSession session = request.getSession(true);
    session.removeAttribute(FrameworkConstants.ADMIN_LOGIN_FAILURE);
    session.removeAttribute(FrameworkConstants.ADMIN_LOGIN_SUCCESS); 
    Integer loginCount = (Integer)session.getAttribute(FrameworkConstants.LOGIN_COUNT_KEY);
    if (loginCount == null) {
      // create a new session
      loginCount = new Integer(0);
    }
    if (loginCount.intValue() > 3)
    {
      request.getSession(true).setAttribute(FrameworkConstants.LOGIN_COUNT_KEY, loginCount);
      session.setAttribute(FrameworkConstants.ADMIN_LOGIN_FAILURE, "You have exceeded the maximum number of attempts");
      return mapping.findForward(FrameworkConstants.FAILURE_KEY); 
    }
    //System.out.println(loginCount);

    DynaActionForm adminForm = (DynaActionForm) form;
    String username = adminForm.getString("username");
    String password = adminForm.getString("password");      
    //System.out.println(username);
    //System.out.println(password);
    if (!checkCredentials(username, password)) {
      msg(mn, new String[] {"validation for username: ", username, " and password: ", password, " failed." });
      loginCount = new Integer((loginCount.intValue() + 1));
      request.getSession(true).setAttribute(FrameworkConstants.LOGIN_COUNT_KEY, loginCount);
      String msg = "Invalid username or password";
      if (loginCount > 2) {
        msg += " This is your last attempt. After this the account will be blocked";
      }
      session.setAttribute(FrameworkConstants.ADMIN_LOGIN_FAILURE, msg);
      //System.out.println(msg);
      return mapping.findForward(FrameworkConstants.FAILURE_KEY);      
    } else {
      request.getSession(true).setAttribute(FrameworkConstants.LOGIN_COUNT_KEY, new Integer(0));
    }
    session.setAttribute("username", username);
    session.setAttribute(FrameworkConstants.ADMIN_LOGIN_SUCCESS, "Success");
    init(mapping, form, request, response);
    return mapping.findForward(FrameworkConstants.SUCCESS_KEY);
  }

  private boolean checkCredentials(String username, String password) throws SystemUnavailableException {
    if (username == null || password == null || username.trim().equals("") || password.trim().equals("")) {
      return false;
    }   
    //System.out.println(PasswordService.getInstance().encrypt(username));
    //System.out.println(PasswordService.getInstance().encrypt(password));
    username = PasswordService.getInstance().encrypt(username);
    password = PasswordService.getInstance().encrypt(password);
    return  username.equals(FrameworkConstants.UPDATE_CATALOG_USERNAME) && password.equals(FrameworkConstants.UPDATE_CATALOG_PASSWORD);
  }

  
  protected void entry(String method) {
    logger.entry(getClass(), method);
  }
  
  protected void exit(String method) {
    logger.exit(getClass(), method);
  }
  
  protected void msg(String method, String msg) {
    logger.msg(getClass(), method, msg);
  }
  
  protected void msg(String method, String msg, Exception e) {
    logger.msg(getClass(), method, msg, e);
  }


  protected void msg(String methodName, Object[] msg) {
    msg(methodName, getString(msg));
  }
  
  protected void msg(String methodName, String[] msg, Exception e) { 
    msg(methodName, getString(msg), e);
  }
  
  /**
   * 
   * @param msg the message array
   * @return Joins all the elements of the array and returns them as a String
   */
  public static String getString(Object[] msg) {
    StringBuffer sb = new StringBuffer();
    if (msg != null) {
      for (int i=0; i<msg.length; i++) {
        sb.append(msg[i]);
      }
    }    
    return sb.toString();
  }  
    
  public static void main (String[] args) throws SystemUnavailableException {
    LoginAction action = new LoginAction();
    DynaActionForm form = new DynaActionForm();
      
    System.out.println(action.checkCredentials("ifaruadmin", "155mmfhb"));
  }
}
