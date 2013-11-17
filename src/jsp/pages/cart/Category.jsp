<%@ page import='java.util.*,ifaru.cart.categories.*,ifaru.cart.users.*,ifaru.cart.products.*'%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %> 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<td colspan=11>
        <bean:parameter id="nParentId" name="nParentId" value="0"/>
        <jsp:useBean id="categories" scope="session" class="java.util.Map"/>
        <jsp:useBean id="parent" scope="session" class="ifaru.cart.categories.Category"/>
        
        <table width="55%" align="center" cellspacing="0" cellpadding="6" border="0">
          <tr>
            <td width="80%" height="20" align="left" valign="center">
               <html:link forward="shop">iFaru</html:link>
		        <logic:notEmpty name="parent">
		          <jsp:setProperty name="parent" property="separatorForHeirarchyOutput" value=" > "/>
		          <jsp:setProperty name="parent" property="queryStringForHeirarchyOutput" value=""/>	
		          <jsp:setProperty name="parent" property="uriForHeirarchyOutput" value="Shop.do"/>		          	             
		          <jsp:getProperty name="parent" property="hierarchyCrumbTrail"/>
		        </logic:notEmpty>               
            </td>
          </tr>
          <tr>
            
             <TD width="80%" height="420" align="center" valign="top">
               <logic:notEmpty name="categories">
                <TABLE class='Data' width=100%>
                 <TR>
                   <TH valign="top" colspan=2>Categories Under 
                   <logic:equal name="nParentId" value="0">
                      iFaru
                   </logic:equal>
                   <logic:notEqual name="nParentId" value="0"> 
                     <bean:write name="parent" property="txtName"/>
                   </logic:notEqual>
                   </TH>
                 </TR>
                 <logic:iterate id="category" type="ifaru.cart.categories.Category" name="categories" scope="page">
                  <TR>
                   <TD width=50% valign="top">
	                   <html:link forward="shop" paramId="nParentId" paramName="category" paramProperty="id">
	                     <bean:write name="category" property="txtName" />
	                   </html:link>
                   </TD>
                  </TR>
                 </logic:iterate>                 
                </TABLE>
               </logic:notEmpty>
               <BR>            
               <BR>
               <logic:notEmpty name="parent">
               <bean:define id="products" name="parent" property="products" type="java.util.Set"/>
                  <logic:notEmpty name="products">
                  <TABLE cellspacing=1 cellpadding=2 class=Data width=100%>
                    <TR>
                      <TH> </TH>
                      <TH> Product </TH>
                      <TH> Price </TH>
                      <TH>       </TH>
                    </TR>
                    <logic:iterate id="product" type="ifaru.cart.products.Product" name="products">
                      
                      <logic:notEqual name="product" property="active" value="0">
                        <bean:define id="parentnid" name="parent" property="NID"/>
                        <bean:define id="prodnid" name="product" property="NID"/>
                        <bean:define id="prodName" name="product" property="txtName" type="java.lang.String"/>
                        <bean:define id="prodDesc" name="product" property="txtDescription"/>
                        <bean:define id="prodPrice" name="product" property="dblPrice"/>                        
                        <bean:define id="prodImgSrc" name="product" property="txtImgUrl" type="java.lang.String"/>
                      <logic:empty name="product" property="txtBuyNowUrl">
		                  <TR>
		                    <TD>
		                      <html:link href="Product.do" paramId="nID" paramName="product" paramProperty="NID">
                                <html:img src="<%= prodImgSrc %>" alt="<%= prodName %>" width="66" height="38"/>
                              </html:link>  		                      
		                    </TD>
		                    <TD valign=top>
		                      <html:link href="Product.do" paramId="nID" paramName="product" paramProperty="NID">
		                        <STRONG><bean:write name="prodName"/></STRONG>
		                      </html:link>
		                      <BR><bean:write name="prodDesc"/></TD>
		                    <TD valign=top align=right><span style="color:'blue'"><STRONG>£<bean:write name="prodPrice"/></STRONG></span></TD>
		                    <html:form action="Cart.do">
		                      <html:hidden name="product" property="NID"/>
		                      <html:hidden property="command" value="Add"/>
		                      <TD valign=top>
		                        Quantity:<html:text maxlength="2" size="2" property="quantity" value="1"/><BR>
		                        <html:submit styleClass='SmallButton' value='Add To Cart'/>
		                        </TD>
		                    </html:form>
		                  </TR>
                      </logic:empty>
                      <logic:notEmpty name="product" property="txtBuyNowUrl">                     
                      <% // Goto Product Description Now %>
		                  <TR>
		                    <TD valign=top>
		                      <% java.util.HashMap reqParams = new java.util.HashMap(); 
		                         reqParams.put("nID", prodnid);
		                         reqParams.put("nCategoryID", parentnid);
		                         request.setAttribute("reqParams", reqParams);
		                       %>
		                      <html:link href="Product.jsp" name="reqParams">
		                        <STRONG><bean:write name="prodName"/></STRONG>
		                      </html:link>
		                      <BR>
		                      <bean:write name="prodDesc"/>
		                    </TD>
		                    <TD valign=top><bean:write name="prodQtyPerPack"/></TD>
		                    <TD valign=top align=right><span style="TEXT-DECORATION: line-through; color:red"><bean:write name="prodDummyPrice"/>£</span></TD>
		                    <TD valign=top align=right><span style="color:'blue'"><STRONG>£<bean:write name="prodPrice"/></STRONG></span></TD>
		                    <TD valign=top align=right>
		                      <html:link href="/ifaru/pages/cart/Goto.jsp" paramId="nID" paramName="product" paramProperty="NID">
		                        <STRONG>Buy Now</STRONG>
		                      </html:link>
		                    </TD>
		                  </TR>
                      </logic:notEmpty>
                      </logic:notEqual>
                    </logic:iterate>

                </TABLE>
                <BR>
              </logic:notEmpty>
            
            </logic:notEmpty> 
            
          <!---------   End of Data Area ------------>
            </TD>
          </TR>
        </TABLE>

</td>