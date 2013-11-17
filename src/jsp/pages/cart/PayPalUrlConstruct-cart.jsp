<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/curtag.tld" prefix="set" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<logic:notPresent name="shoppingCart" scope="session">
    <h1>Your cart is empty</h1><BR>
    <html:form action="/catalog/ItemList"><html:submit styleClass="LoginButton" property="shop" value="Go to iFaru Shop"></html:submit></html:form>
     
</logic:notPresent>

 <logic:present name="shoppingCart" scope="session">
  <logic:empty name="shoppingCart" property="items">
    <span style="text-align:center;margin-top:100px">
      <h3>Your cart is empty</h3>
      <html:form action="/catalog/ItemList"><html:submit styleClass="LoginButton" property="shop" value="Back to the Shop"></html:submit></html:form>
    </span>  
  </logic:empty>
  <logic:notEmpty name="shoppingCart" property="items">
      <bean:define id="coCheque" value="CHEQUE"/>
      <bean:define id="coPaypal" value="PAYPAL"/> 
      <bean:define id="coNochex" value="NOCHEX"/>


			<TABLE class="CartTable" cellspacing=1 cellpadding=2">
				<TR style="background-color: FFFFFF; color:#999999">
					<TH>Product</TH>
					<TH>Price</TH>
					<TH>Quantity</TH>
          <TH>Total Price</TH>					
          <TH>Remove</TH>					
				</TR>
        <html:form method="get" action="/cart/UpdateCart">
        <c:forEach var="element" items="${shoppingCart.items}" varStatus="loop">				
				   <bean:define id="item" name="element" property="value"/>
               <bean:define id="trclass" value="FFFFCC"/>
               <c:if test="${loop.count % 2 == 0}">
                 <bean:define id="trclass" value="FFFF99"/>
               </c:if>				   
						<TR class="CartSummaryRow" style="background-color: <bean:write name='trclass'/>">
							<TD valign=top><STRONG><bean:write name="item" property="name"/></STRONG>&nbsp;<bean:write name="item" property="size"/></TD>
							<TD valign=top align="right">&pound;<STRONG><bean:write name="item" property="priceAsCurrency"/></STRONG></TD>
							<TD valign=top align="right"><INPUT type="text" size="2" name="<bean:write name='item' property='priceFieldId'/>_size_<bean:write name="item" property="size"/>" value="<bean:write name='item' property='quantity'/>" onchange="validateQuantity(this)"/></TD>
              <TD valign=top align="right">&pound;<bean:write name="item" property="totalPriceAsCurrency"/></TD>							
              <TD align="center" valign=top><input type="checkbox" name="<bean:write name='item' property='removeItemFieldId'/>"/></TD>							
						</TR>
				</c:forEach>
				   <TR>
				     <TD align="center" colspan="5">
               <html:submit styleClass="SearchButton" property="update" value="Update Cart"></html:submit>
             </TD>
           </TR>
				</html:form>
			</TABLE>
			<BR>
      <TABLE class="CartTable" width="80%">
        <TR>
           <TD valign="center" class="ContinueShoppingHeader"  style="background-color:FFFFFF" valign="center" align="center"><html:form action="/catalog/ItemList"><html:submit styleClass="SearchButton" property="shop" value="Continue Shopping"></html:submit></html:form></TD>
        </TR>
      </TABLE>			
			<BR>
			<TABLE class="CartTable" cellspacing=1">
				<TR class="CartTableHeader">
				  <TH/>
          <TH colspan="1" align="right">British Pounds</TH>					
				</TR>
				<TR>
					 <TD class="CartSummaryRow" align=right><STRONG>Total Amount</STRONG></TD>
					 <TD class="CartSummaryRow" align=right>&pound;<bean:write name="shoppingCart" property="itemTotalAsCurrency" scope="session"/> </TD>
				</TR>
				<TR>
					 <TD class="CartSummaryRow" align=right><STRONG>Shipping Charges</STRONG></TD>
					 <TD class="CartSummaryRow" align=right>&pound;<bean:write name="shoppingCart" property="shippingTotalAsCurrency" scope="session"/></TD>
				</TR>
				<logic:equal name="shoppingCart" property="insuranceRequired" value="true">
          <TR>
             <TD class="CartSummaryRow" align=right><STRONG>Postal Insurance</STRONG></TD>
             <TD class="CartSummaryRow" align=right>&pound;<bean:write name="shoppingCart" property="shippingInsuranceAsCurrency" scope="session"/></TD>
          </TR>			
        </logic:equal>	
				<TR>
					 <TD class="CartSummaryRow" align=right><STRONG>Grand Total</STRONG></TD>
					 <TD class="CartSummaryRow" align=right>&pound;<STRONG><bean:write name="shoppingCart" property="grandTotalAsCurrency" scope="session"/></STRONG></TD>
				</TR>
			</TABLE>
			<BR>			
      <TABLE class="CartTable" border=0>
        <TR>        
          <TH class="CartTableHeader" COLSPAN="3" align="center">CHECKOUT</TH>
        </TR>
        <TR style="background-color:FFFFFF">
          <TD style="padding:10 0 0 0; border: none; background-color:FFFFFF" align="center"> <%--  onmouseover="this.style.backgroundColor='#FF9933';" onmouseout="this.style.backgroundColor='FFFFFF';">--%>
          <form name="payByPaypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
            <input type="hidden" name="cmd" value="_cart"/>
            <input type="hidden" name="upload" value="1"/>
            <input type="hidden" name="business" value="contact@ifaru.com"/>
            <input type="hidden" name="currency_code" value="GBP"/> 
            <input type="hidden" name="return" value="http://www.ifaru.com"/> 
            <input type="hidden" name="shopping_url" value="http://www.ifaru.com/catalog/ItemList.do"/> 
            <input type="hidden" name="cancel_return" value="http://www.ifaru.com"/> 
                                                                      
            <% int count=0; %>    
            <c:forEach var="element" items="${shoppingCart.items}" varStatus="loop">        
               <bean:define id="item" name="element" property="value"/>
               <input type="hidden" name="item_name_<%= ++count %>" value="<bean:write name='item' property='name'/> <bean:write name='item' property='size'/>"/>
               <input type="hidden" name="amount_<%= count %>" value="<bean:write name='item' property='price'/>"/>
               <input type="hidden" name="quantity_<%= count %>" value="<bean:write name='item' property='quantity'/>"/>
               <input type="hidden" name="shipping_<%= count %>" value="<bean:write name='item' property='shippingPriceAsCurrency'/>"/>                               
            </c:forEach>
            <%-- add the insurance cost as an item --%>
            <logic:equal name="shoppingCart" property="insuranceRequired" value="true">            
               <input type="hidden" name="item_name_<%= ++count %>" value="Postal Insurance"/>
               <input type="hidden" name="amount_<%= count %>" value="<bean:write name='shoppingCart' property='shippingInsuranceAsCurrency'/>"/>
               <input type="hidden" name="quantity_<%= count %>" value="1"/>                           
            </logic:equal>
            
            <html:image src="/ifaru/images/pages/layout/pp.gif" alt="Pay By PayPal" onclick="document.payByPaypal.submit();"/>
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
           <logic:notEqual name="shoppingCart" property="selectedShippingOptionId" value="15037302">
             <TD align="center" style="color:green;font-weight:bold;font-style:italic;background-color:FFFFFF"> <%--  onmouseover="this.style.backgroundColor='#FF9933';"> onmouseout="this.style.backgroundColor='FFFFFF';"> --%> Pay by Cheque/Postal Order<br><html:link action="/cart/Checkout" paramId="checkoutOption" paramName="coCheque"><html:img src="/ifaru/images/pages/layout/cheque.jpg" alt="Pay By Cheque/Postal Order"/></html:link></TD>
           </logic:notEqual>          
          </TD>
        </TR>
      </TABLE>      

  </logic:notEmpty>
</logic:present>


<%-- 

<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_cart">
<input type="hidden" name="upload" value="1">
<input type="hidden" name="business" value="seller@designerfotos.com">
<input type="hidden" name="item_name_1" value="Item Name 1">
<input type="hidden" name="amount_1" value="1.00">
<input type="hidden" name="item_name_2" value="Item Name 2">
<input type="hidden" name="amount_2" value="2.00">
<input type="submit" value="PayPal">
</form>

--%>