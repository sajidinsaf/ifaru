<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/curtag.tld" prefix="set" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<div style="margin-left:10%" id="chequebox">

<logic:present name="loginFailure" scope="session">
  <span style="color:red">Login failed: <bean:write name="loginFailure"/></span>
</logic:present>


<br>
<br>
<span style="text-align:center;font-size:14px;font-family:Arial;font-weight:bold">Welcome Administrator. Please Login:</span>
<br>


<div id="ChequePaymentDialogue">

      <form name="adminLoginForm" action="/ifaru/admin/Authentication.do">
        <table>
          <tr>
              <td style="font-weight:bold;padding:0 4 0 0;">
                Username
              </td>
              <td>
                <input type="text" name="username" length="60"/><br>
              </td>
          </tr> 
          <tr>  
            <td style="font-weight:bold;padding:0 4 0 0;">
                Password
            </td>
            <td>
              <input type="password" name="password" length="60"/>   
            </td>
          </tr>
          <tr>   
            <td/>
            <td>        
              <span style="padding:0 0 0 4;">
                <input type="submit" name="submit" value="Login"/>
              </span>
            </td>
          </tr>
        </table>
      </form>
      <br><br>
</div>

</div>
