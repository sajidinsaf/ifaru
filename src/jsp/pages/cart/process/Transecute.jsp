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
<jsp:useBean id="transecute" class="com.transecute.functions" scope="session" />
<%

	Products	products	= website.products;
	Orders		orders		= website.orders;
	Users		users		= website.users;

	String key = "eFv7H6l4479xDUxstAgaCFp2CgofcvG3" ;
	String desc = request.getParameter("desc");
	String amount = request.getParameter("amount");
	String status = request.getParameter("status");
	String checksum = request.getParameter("newchecksum");
	
	String result = "";

	String str = transecute.verifychecksum(desc , amount , status , checksum , key);

	int n = desc.lastIndexOf('-');
	String id = desc.substring(n+1);
	
	int nOrderID = Integer.parseInt(id);
	
	Order order = orders.get(nOrderID);
	
	
	if(str.equals("true") && status.equals("Y"))
	{
	
		order.nOrderState = order.PROCESSING_PENDING;
		orders.edit(order);
		result = "Payment for the order is done and it is under processing, you will be soon notified by email about status of your order.";
	
	}
	else if(str.equals("true") && status.equals("N"))
	{
		result = "<font color=red>Payment has failed, please try again later</font>";
	}
	else if(str.equals("true") && status.equals("P"))
	{
		result = "<font color=red>Payment has failed, please try again later</font>";
	}
	else
	{
		result = "<font color=red>Payment has failed, please try again later</font>";
	}

%>
<HTML>
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
		<TD><%=result%></TD>
	</TD>
</TABLE>
<BR>

<%=website.preferences.checkoutPage.txtFooter%>
<%=website.preferences.globalPage.txtFooter%>

</BODY>
</HTML>
