<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
   <div align="center" style="font-family:Arial, Verdana; font-size:12px">
   <session:existsAttribute name="catalogItemKey">
     <bean:define id="item" name="catalogItemKey" type="com.ifaru.catalog.CatalogItem"/>
       <span style="font-weight:bold"/> <bean:write name="item" property="name"/></span>
        <hr style="color:blue;height:1px;width:90px"/>
        <html:form action="/catalog/AddToCart">
           <html:hidden name="item" property="id"/>
           <table style="text-align:center; font-family:Arial, Verdana; font-size:12px">
             <tr style="text-align:center">
               <th>Size</th>
               <th>Price</th>
               <th>Quantity</th>
               <th/>
             </tr>
             <tr style="text-align:center">
               <td>
               <%--<td> Brand: <bean:write name="item" property="brandId"/> </td><br>--%>
               <bean:define id="sizes" name="item" property="sizes" type="java.util.List"/>
               <bean:size id="numberOfSizes" name="sizes"/>

                  <logic:greaterThan name="numberOfSizes" value="1">
                    <select name="size" onchange="setSalePrice(this);" id="<bean:write name='item' property='id'/>">
                      <logic:iterate id="size" name="sizes">
                         <option value="<bean:write name='size' property='size'/>"><bean:write name="size" property="size"/></option>
                      </logic:iterate>
                    </select>
                  </logic:greaterThan>
                  <logic:equal name="numberOfSizes" value="1">
                    <bean:define id="size" name="item" property="sizes[0]"/>
                    <input name="price" size="6" type="text" value="<bean:write name='size' property='salePrice'/>" readonly="true"/>
                  </logic:equal>
               </td>
               <td>
                 </%-- The priceFieldId is worked out by the javascript in the header tag for this page 
                   This id is used to determine selected the size of the item.
                 --%>
                 <input type="text" id="<bean:write name='item' property='priceFieldId'/>" name="<bean:write name='item' property='priceFieldId'/>" value="<bean:write name='item' property='sizes[0].salePriceAsCurrency'/>" readonly="true" size="3" style="text-align:right"/>
               </td>
               <td>                     
                  <select name="quantity">
                    <c:forEach var="n" begin="1" end="5" >
                      <option value="<c:out value='${n}'/>"><c:out value="${n}"/></option> 
                    </c:forEach>
                  </select>
               </td>
               <td>
                 <html:submit styleClass="AddToCartButton" property="addtocart" value="Add To Cart" alt="Add To Cart"/>
               </td>
            </tr>               
           </table>
       </html:form>
   </session:existsAttribute>
   </div>