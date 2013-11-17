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
<jsp:useBean id="order" scope="session" class="ifaru.cart.orders.Order" />
<%

	Products	products	= website.products;
	Orders		orders		= website.orders;
	Users		users		= website.users;
	Countries	countries	= website.countries;
	Variables	variables	= website.variables;	

	String result = orders.insert(order);
	if(result != null)
		throw new Exception("Could not place the order...");
		
	int nOrderID = order.nID;
	double dblGrandTotal = order.dblGrandTotal;
	
	// Free up the shopping cart....
	//order.clear();
	
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
		<TD>Please note your order ID which will be required for you to tracking purposes.</TD>
	</TD>
</TABLE>
<BR>

<TABLE class=Data width=80% cellspacing=1 >
	<TR><TH>Pay Now</TH></TR>
	<TR>
		<TD>Put your code here to transmit data to payment gateway, order's status is Payment Pending, 
			it is programmer's responsibility to integrate payment gateway properly. Administrator can 
			still go into admin area and change orders's status to anything.
		</TD>
	</TD>
</TABLE>
<BR>



<%=website.preferences.checkoutPage.txtFooter%>
<%=website.preferences.globalPage.txtFooter%>

</BODY>
</HTML>

<%
	// Free up the shopping cart....
	order.clear();
%>
