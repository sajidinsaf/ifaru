<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
        
  <logic:notPresent name="adminCatalogKey" scope="session">
     <span style="color:red">This is an invalid entry path. <br> Please click <a href="/ifaru/admin/Welcome.do">here</a> to go to the login page</span>
  </logic:notPresent>
          
  <logic:present name="adminCatalogKey" scope="session">

      <logic:notEmpty name="adminCatalogKey" property="items">
        <logic:present name="Success" scope="session">
          <logic:present name="alreadyExists" scope="session">
            <span style="color:amber"><bean:write name="alreadyExists"/></span><br><br>
          </logic:present>  
          <logic:notPresent name="alreadyExists">
            <span style="color:green">Category Added Successfully</span><br><br>
          </logic:notPresent>
        </logic:present>

          <html:form action="/admin/AddCategory">
            <table class="CatalogTable" border="0" cellpadding="0" cellspacing="1">
               <tr><td class="CatalogTableHeader">Id</td>  
                   <td> 
                      <input type="text" id="id" name="id" value="<bean:write name='lastCategory' property='id' ignore='true' />"/>
                   </td>  
               </tr>            
               <tr><td class="CatalogTableHeader">Name</td>  
                   <td> 
                     <input type="text" id="name" name="name" value="<bean:write name='lastCategory' property='name' ignore='true' />" />
                   </td>
               </tr>             
               <tr><td class="CatalogTableHeader">Subcategories</td>  
                    <td>     
                      <input type="text" id="subcategories" name="subcategories" value="<bean:write name='lastCategory' property='subcategories' ignore='true' />" />
                    </td>
               </tr>
               <tr><td class="CatalogTableHeader">Stock</td>  
                    <td>
                      <input type="text" id="keywords" name="keywords" value="<bean:write name='lastCategory' property='keywords' ignore='true' />" />
                    </td>
               </tr>
                
               <tr><td/>  
                   <td>
                     <html:submit styleClass="AddToCartButton" property="save" value="Save" alt="Save"/>
                   </td>  
               </tr>
               <input type="hidden" id="add" name="add" value="true"/>
            </table>
          </html:form>
 
      </logic:notEmpty>
  </logic:present>
