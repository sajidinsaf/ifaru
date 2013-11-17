package com.ifaru.actions.forms;

import org.apache.struts.action.ActionForm;

/**
 * Struts form been for Login actions
 * @author si96555
 *
 */
public class LoginForm extends ActionForm {

  /**
   * serial version id for serialization
   */
  private static final long serialVersionUID = 5444676688378969361L;

  private String txtMessage;
  private String txtRedirect;
  private String txtAdmin;
  private String txtUsername;
  private String txtPassword;
  /**
   * @return the txtAdmin
   */
  public String getTxtAdmin() {
    return txtAdmin;
  }
  /**
   * @param txtAdmin the txtAdmin to set
   */
  public void setTxtAdmin(String txtAdmin) {
    this.txtAdmin = txtAdmin;
  }
  /**
   * @return the txtMessage
   */
  public String getTxtMessage() {
    return txtMessage;
  }
  /**
   * @param txtMessage the txtMessage to set
   */
  public void setTxtMessage(String txtMessage) {
    this.txtMessage = txtMessage;
  }
  /**
   * @return the txtPassword
   */
  public String getTxtPassword() {
    return txtPassword;
  }
  /**
   * @param txtPassword the txtPassword to set
   */
  public void setTxtPassword(String txtPassword) {
    this.txtPassword = txtPassword;
  }
  /**
   * @return the txtRedirect
   */
  public String getTxtRedirect() {
    return txtRedirect;
  }
  /**
   * @param txtRedirect the txtRedirect to set
   */
  public void setTxtRedirect(String txtRedirect) {
    this.txtRedirect = txtRedirect;
  }
  /**
   * @return the txtUsername
   */
  public String getTxtUsername() {
    return txtUsername;
  }
  /**
   * @param txtUsername the txtUsername to set
   */
  public void setTxtUsername(String txtUsername) {
    this.txtUsername = txtUsername;
  }
  
}
