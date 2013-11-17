<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>


<html>
  <head>
    <tiles:insert attribute="header.tag"/>
    <title><tiles:getAsString name="title" ignore="true"/></title>
  </head>
  
  <body>
      <table>
        <tr>
          <td id="navigation">
            <tiles:insert attribute="left.menu" />
          </td>
        </tr>
        <tr>
          <td>
            <tiles:insert attribute="body" />
          </td>
      </table>
  </body>
</html>

