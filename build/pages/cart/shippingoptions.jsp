<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/curtag.tld" prefix="set" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<html:form action="/catalog/ShippingOptions">
                   
<div style="padding:10 0 10 20; margin-top:100px;margin-left:150px;margin-right:100px;border: thick solid #DDDDDD;text-align:left;font-family:Arial, Verdana, Courier New;font-size:12px"><br>

This information will be used to calculate the shipping cost for your order. It will be requested only once during your shopping session. <br><br>

<h3 style="text-decoration: underline;font-weight:bold"> Please select the region to which the order is to be shipped.</h3>
<input type="radio" name="region" value="15037301" CHECKED >United Kingdom (UK) <br>
<input type="radio" name="region" value="15037302">Non-UK (America, Europe, Asia, Australia)<br>

<hr>
<h3 style="text-decoration: underline;font-weight:bold">Do you require Postal Insurance.</h3>

<input type="radio" name="insurance" value="0" CHECKED >No<br>
<input type="radio" name="insurance" value="1">Yes - An additional cost of five british pounds will be added to the final shipping cost.

<br><br><br>
<span style="margin-left: 200px"/>
<html:submit styleClass="AddToCartButton" property="viewcart" value="View Cart" alt="View Cart"/>
</span>
</div>
</html:form>