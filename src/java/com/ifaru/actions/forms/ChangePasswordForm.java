package com.ifaru.actions.forms;

import org.apache.struts.action.ActionForm;

public class ChangePasswordForm extends ActionForm {
  
  /**
   * 
   */
  private static final long serialVersionUID = -6381663827633422505L;
  
  String txtOldPassword, txtNewPassword, txtNewPassword2;

  /**
   * @return the txtNewPassword
   */
  public String getTxtNewPassword() {
    return txtNewPassword;
  }

  /**
   * @param txtNewPassword the txtNewPassword to set
   */
  public void setTxtNewPassword(String txtNewPassword) {
    this.txtNewPassword = txtNewPassword;
  }

  /**
   * @return the txtNewPassword2
   */
  public String getTxtNewPassword2() {
    return txtNewPassword2;
  }

  /**
   * @param txtNewPassword2 the txtNewPassword2 to set
   */
  public void setTxtNewPassword2(String txtNewPassword2) {
    this.txtNewPassword2 = txtNewPassword2;
  }

  /**
   * @return the txtOldPassword
   */
  public String getTxtOldPassword() {
    return txtOldPassword;
  }

  /**
   * @param txtOldPassword the txtOldPassword to set
   */
  public void setTxtOldPassword(String txtOldPassword) {
    this.txtOldPassword = txtOldPassword;
  }
}
