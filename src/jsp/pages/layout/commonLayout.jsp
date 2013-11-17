<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>


<html>
  <head>
    <tiles:insert attribute="header.tag"/>
    <title><tiles:getAsString name="title" ignore="true"/></title>
  </head>
  
  <body>
    <div id="container">
      <div id="header">
        <table border="0">
        <tr>
          <td id="BrandingLocation">   
             <image src="/ifaru/images/pages/layout/ifarulogo.gif" alt="iFaru.com"/>
          </td>
         <td id="topmenu">
           <tiles:insert attribute="header"/> 
         </td>
        <td id="UserLocation">
           <tiles:insert attribute="user.location"/> 
        </td>      
        </tr>
      </table>   
      </div>  
    
      <div id="navigation">
        <table border="0">
          <tr><td>
             <tiles:insert attribute="left.menu" />  
          </td></tr>
          <tr><td align="center" style="padding-top:100px">
               <%-- PayPal Logo --%>
                 <img  src="/ifaru/images/pages/layout/pp-verified.gif" border="0" alt="Paypal Verified">
               <%-- PayPal Logo --%>  
          </td></tr>           
          <tr><td>
               <%-- PayPal Logo --%>
                 <img  src="/ifaru/images/pages/layout/pp-cards.gif" border="0" alt="Paypal Secure Payments">
               <%-- PayPal Logo --%>  
          </td></tr>        
        </table> 
      </div> 
<%--
      <div id="rightbar">
         <tiles:insert attribute="alt.services.location" />     
      </div>       --%> 
      <div id="content">
         <tiles:insert attribute="body" />
      </div>
  
  
      <div id="footer">
         <tiles:insert attribute="footer" />
      </div>      
    </div>
  </body>
</html>

