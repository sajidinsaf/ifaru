<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/curtag.tld" prefix="set" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<div id="chequeconfirmbox">

<span style="text-align:center;font-size:15px;font-family:Arial;font-weight:bold;color:CC9900;text-decoration: underline">Thank you for confirming payment by Cheque.</span>
<br>
<span style="text-align:left;font-size:12px;font-family:Arial;font-weight:normal">
<p>An email specifying the order details and payment instructions has been sent to your email address: <strong><bean:write name="paymentResult" property="order.customer.emailAddress"/></strong></p>
</span>
<BR><BR><BR><BR><BR>
<hr id="ChequePaymentHR"/>
    <table style="text-align:center; width:100%">
      <tr>
        <td style="padding-right:350px">  
           <html:form action="/catalog/ItemList"><html:submit styleClass="SearchButton" property="shop" value="Beck to the Shop"></html:submit></html:form>
        </td>
      </tr>
    </table>
</div>