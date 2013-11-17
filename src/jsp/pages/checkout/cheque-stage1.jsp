<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/curtag.tld" prefix="set" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<div id="chequebox">

<span style="text-align:center;font-size:14px;font-family:Arial;font-weight:bold">Thank you for choosing to pay by Cheque.</span>
<br><br><br>
<span style="text-align:left;font-size:12px;font-family:Arial;font-weight:bold">
<p>The process is as follows:</p>
</span>
<ul id="CheckPaypentProcessUL">
  <li>Type in your email address and press the <strong>Confirm Order</strong> button.</li>
  <li>We will send you an email with the order details and the payment instructions.</li>
  <li>On receipt and clearing of your cheque we will ship your order.</li>
</ul>

<div id="ChequePaymentDialogue">

      <form name="emailForm" action="/ifaru/checkout/ProcessChequePayment.do">
        <table><tr><td><span style="font-weight:bold;padding:0 4 0 0;">Email</span><input type="text" name="email" length="60"/><span style="padding:0 0 0 4;"><input type="submit" name="submit" value="Confirm Order" onclick="return emailIfValid(document.emailForm, document.emailForm.email);"/></span></td></tr></table>
      </form>
      <br><br>
</div>
<hr id="ChequePaymentHR"/>
    <table style="width:100%">
      <tr>
        <td style="padding-right:150px">  
           <html:form action="/catalog/ItemList"><html:submit styleClass="SearchButton" property="shop" value="Continue Shopping"></html:submit></html:form>
        </td>
        <td style="text-align:right">
           <html:form action="/user/UserAction"><html:image src="/ifaru/images/pages/layout/cart.jpg" styleClass="CartButton" border="0" property="" value="viewCart" alt="Cart" title="View Shopping Cart"></html:image></html:form>
        </td>
      </tr>
    </table>
</div>
