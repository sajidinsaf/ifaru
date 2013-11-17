<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<%--

Tabs Layout.
This layout allows to render several tiles in a tabs fashion.
@param tabList A list of available tabs. We use MenuItem to carry data (name, body, icon etc..)
@param selectedIndex Index of default selected tab
@param parameterName Name of parameter carring selected info in http request

--%>

<%-- 
Use tiles attricues and declare them as page java variable.
These attribute must be passed to the tile
--%>

<tiles:useAttribute name="parameterName" classname="java.lang.String" />
<tiles:useAttribute id="selectedIndexStr" name="selectedIndex" ignore="true" classname="java.lang.String" />
<tiles:useAttribute name="tabURL" classname="java.lang.String" /> 
<tiles:useAttribute name="tabList" classname="java.util.List" />
<tiles:useAttribute name="selectedColor" classname="java.lang.String" /> 
<tiles:useAttribute name="notSelectedColor" classname="java.lang.String" /> 
<tiles:useAttribute name="tabFontColor" classname="java.lang.String" /> 
<tiles:useAttribute name="pageTitleColor" classname="java.lang.String" />

<bean:parameter id="selectedIndex" name="<%= parameterName %>" value="0"/>

<logic:lessThan name="selectedIndex" value="0">
  <% selectedIndex = "0"; %>
</logic:lessThan>
<logic:greaterEqual name="selectedIndex" value="<%= String.valueOf(tabList.size()) %>">
  <% selectedIndex = "0"; %>
</logic:greaterEqual>

<bean:define id="selectedBody" value="<%= ((org.apache.struts.tiles.beans.MenuItem)tabList.get(Integer.parseInt(selectedIndex))).getLink() %>" />

<table valign="top" width="625" height="400" border="0" cellspacing="0" cellpadding="0" style="margin-left:10px">
        <tr valign="top"><td valign="top" align="center" colspan="<%= tabList.size() %>" ><span style="color: <%= pageTitleColor %>;font-family:Times New Roman;font-weight:bold;font-size:20px;"><tiles:insert attribute="pageTitle"/></span></td></tr>
  <%-- Draw tabs --%>
	<tr>
	  <td width="0"></td>
	  <td>
	    <table border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <logic:iterate id="tab" indexId="index" name="tabList" type="org.apache.struts.tiles.beans.MenuItem">
	          <bean:define id="color" value="<%= notSelectedColor %>"/>
	            <logic:equal name="index" value="<%= selectedIndex %>">
	              <% selectedBody = tab.getLink(); %>
	              <bean:define id="color" value="<%= selectedColor %>"/>
	            </logic:equal>
	          <td style="background-color:<%=color%>;margin:0; padding:0">
	            <html:link forward="<%= tabURL %>" paramId="<%= parameterName %>" paramName="index" style="text-decoration: none;">
	              <span style="padding:3 4 3 4;color: <%= tabFontColor %>;font-family:Arial, Verdana, Times New Roman;font-size:16px;font-weight:bold">
	                <bean:write name="tab" property="value"/>
	              </span>
	            </html:link>
	          </td>
	          <td width="<%= (tabList.size() * 10) %>"></td>
	        </logic:iterate>
	      </tr>
	    </table>
	</tr>

    <tr>
      <td height="2" bgcolor="<%=selectedColor%>" colspan="3">
      </td>
    </tr>
    <%-- Draw body --%>
    <tr>
      <td width="1" bgcolor="<%=selectedColor%>"></td>
      <td>
        <tiles:insert name="<%=selectedBody%>" flush="true" />
      </td>
      <td width="1" bgcolor="<%=selectedColor%>"></td>
    </tr>
    
    <tr>
      <td height="5" bgcolor="<%=selectedColor%>" colspan="3"></td>
    </tr>
</table>

        