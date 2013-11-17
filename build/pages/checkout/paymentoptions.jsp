<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/curtag.tld" prefix="set" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

 <logic:present name="shoppingCart" scope="session">
      <bean:define id="coCheque" value="CHEQUE"/>
      <bean:define id="coPaypal" value="PAYPAL"/> 
      <bean:define id="coNochex" value="NOCHEX"/>
   <div style="margin-top:50px"/>
     <TABLE class="CartTable" border=0>
        <TR>        
          <TH class="CartTableHeader" COLSPAN="3" align="center">CHECKOUT</TH>
        </TR>
        <TR/>
        <TR/>
        <TR/>
        <TR>
          <TD>
            <br>
            <br>
            Please choose your preferred payment method. 
            <br>
            <ul>
              <li>Pay by credit/debit card securely via PayPal. A PayPal account or registration is not required to use this service.</li>
              <li>Pay by cheque/postal order (UK only). Detailed instructions about the process will be displayed in the next step.</li>
            </ul>              
            <br>
            <br>
            <br>
          </TD>
          <TD/>
        </TR>
        <TR style="background-color:FFFFFF">
          <TD style="padding:10 0 0 0; border: none; background-color:FFFFFF" align="center"> <%--  onmouseover="this.style.backgroundColor='#FF9933';" onmouseout="this.style.backgroundColor='FFFFFF';">--%>
            <form name="payByPaypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
              <html:link action="/cart/Checkout" paramId="checkoutOption" paramName="coPaypal"><html:img src="/ifaru/images/pages/layout/pp.gif" alt="Checkout with Paypal"/></html:link>
            </form>
          </TD>
        <%--  
          <TD style="border: none;background-color:FFFFFF" align="center" onmouseover="this.style.backgroundColor='#FF9933';" onmouseout="this.style.backgroundColor='FFFFFF';">
            <form name="payByNochex" method="POST" action="https://secure.nochex.com/">
              <input type="hidden" name ="merchant_id" value="contact@ifaru.com">
              <input type="hidden" name ="amount" value="<bean:write name='shoppingCart' property='grandTotal' scope='session'/>">
              <input type="hidden" name ="description" value="iFaru Online">
              <input type="hidden" name ="order_id" value="123455678">
              <html:image src="/ifaru/images/pages/layout/nochex-logo.gif" alt="Pay By Nochex" onclick="document.payByNochex.submit();"/>
            </form>          
          </TD>
          --%>
           
          <TD align="center" style="color:green;font-weight:bold;font-style:italic;background-color:FFFFFF">
           <logic:notEqual name="shoppingCart" property="selectedShippingOptionId" value="15037302">
             <%--  onmouseover="this.style.backgroundColor='#FF9933';"> onmouseout="this.style.backgroundColor='FFFFFF';"> --%> Pay by Cheque/Postal Order<br><html:link action="/cart/Checkout" paramId="checkoutOption" paramName="coCheque"><html:img src="/ifaru/images/pages/layout/cheque.jpg" alt="Pay By Cheque/Postal Order"/></html:link>
           </logic:notEqual>          
          </TD>
        </TR>
      </TABLE>      
    </div>  
 </logic:present>