<%@page import='ifaru.cart.users.*,ifaru.cart.*,ifaru.cart.variables.*,ifaru.cart.products.*,ifaru.cart.orders.*,ifaru.cart.countries.*,java.util.*'%>
<%
	User user = (User) session.getAttribute("User");
	if(user==null)
	{
		User.doLogin(request,response);
		return;
	}
	
	
%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/"));%></jsp:useBean>
<%

	Products	products	= website.products;
	Orders		orders		= website.orders;
	Users		users		= website.users;
	Countries	countries	= website.countries;
	Variables	variables	= website.variables;	


		
	int nOrderID = website.getRequestParameter(request,"nOrderID",0);
	
	Order order = orders.get(nOrderID);
	
	double dblGrandTotal = order.dblGrandTotal;
	
	String orderID = website.shopID + "-" + String.valueOf(nOrderID);
	
%><HTML>
<HEAD>
<TITLE><%=website.preferences.checkoutPage.txtTitle%></TITLE>
</HEAD>
<link rel=stylesheet type="text/css" href="/ifaru/Common.css">
<BODY>

<%=website.preferences.globalPage.txtHeader%>
<%=website.preferences.checkoutPage.txtHeader%>

<%@ include file='incOrderDetails.jsp'%>


<TABLE class=Data width=80% cellspacing=1 >
	<TR><TH>Your Order ID is <%=nOrderID%></TH></TR>
	<TR>
		<TD>Please pay now for your pending order.</TD>
	</TD>
</TABLE>
<BR>

<%@ include file='incTransecute.jsp'%>

<%=website.preferences.checkoutPage.txtFooter%>
<%=website.preferences.globalPage.txtFooter%>

</BODY>
</HTML>