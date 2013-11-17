<%@ page language="java" %>
<%@page import='ifaru.cart.*'%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>


<html>
  <head>
    <tiles:insert attribute="header-tag"/>
    <title><tiles:getAsString name="title" ignore="true"/></title>
  <head>
  
<body link=#66CC99 alink=olive vlink=olive><!-- background="/ifaru/images/pages/layout/background.jpg">-->
  <table width=100% border="0" align="center">
    <tr height="20"> 
      <td align="center" nowrap bgcolor="lightblue" colspan="3">
         <tiles:insert attribute="header"/>
      </td>
    </tr>
    <tr height="500">
      <td width="10%" valign="top" bgcolor="gold">
          <tiles:insert attribute="left.menu" />     
      </td> 
      <td width="80%" bgcolor="white">
         <tiles:insert attribute="body" />
      </td>
      <td width="10%" bgcolor="yellow">
        iFaru News
      </td>
    </tr>
    <tr height="10"> 
      <td align="center" colspan="3" bgcolor="blue">
       <!--  <tiles:insert attribute="footer" /> -->
      </td>
    </tr>
  </table>
</body>
</html>

