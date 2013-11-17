<%@page import='ifaru.cart.users.*,ifaru.cart.*,ifaru.cart.orders.*,java.util.*'%>
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
	Users	users = website.users;
	Orders	orders = website.orders;
	int nStart = website.getRequestParameter(request,"nStart",0);
	int nSize  = website.getRequestParameter(request,"nSize",20);
	
	Vector items = orders.getAll(nStart,nSize,user.txtUsername);
%>
<HTML>
<HEAD>
<TITLE><%=website.preferences.myordersPage.txtTitle%></TITLE>
</HEAD>
<link rel=stylesheet type="text/css" href="/ifaru/Common.css">
<BODY>
<%=website.preferences.globalPage.txtHeader%>
<%=website.preferences.myordersPage.txtHeader%>


	<TABLE width=80% cellpadding=2 cellspacing=1 class=Data>
		<TR>
			<TH align=left>Order ID</TH>
			<TH align=left>Date</TH>
			<TH align=right>Amount</TH>
			<TH colspan=2>Status</TH>
			<TH>Cancel</TH>
		</TR>
		<%
			Enumeration enum = items.elements();
			while(enum.hasMoreElements())
			{
				Order order = (Order)enum.nextElement();
				com.ifaru.util.Date date = new com.ifaru.util.Date(order.tsDate);
				%>
					<TR>
						<TD align=left><%=order.nID%>&nbsp;&nbsp;<A href="javascript:orderDetail(<%=order.nID%>)">Details</A></TD>
						<TD align=left><%=date.getShortDate()%></TD>
						<TD align=right><%=website.format(order.dblGrandTotal)%> GBP</TD>
						<TD>&nbsp;&nbsp;&nbsp;</TD>
						<%if(order.nOrderState==order.PAYMENT_PENDING){%>
							<TD align=left><%=order.getStatus()%> <BR>
							<A href="/ifaru/pages/cart/Checkout2.jsp?nOrderID=<%=order.nID%>">Pay Now!!</A></TD>
							<TD align=right><a href="javascript:cancelOrder('<%=order.nID%>')">Cancel</A></TD>
						<%}else{%>
							<TD align=left><%=order.getStatus()%></TD>
							<TD align=right>N/A</TD>
						<%}%>
					</TR>
				<%
			}
		%>
	</TABLE>
		
	Orders under payment pending can only be cancelled.					
	
<SCRIPT LANGUAGE=javascript>
<!--
	function orderDetail(nID)
	{
		window.open("./OrderDetail.jsp?nID="+nID,"OrderDetail"+nID,"top=50,left=50,width=500,height=400")
	}
	
	function cancelOrder(nID)
	{
		if(confirm("Are you sure you want to cancel order "+nID))
		{
			location.href = "./Delete.jsp?nOrderID=" + nID + "&nStart=<%=nStart%>&nSize=<%=nSize%>"
		}
	}
//-->
</SCRIPT>
	
<%=website.preferences.myordersPage.txtFooter%>
<%=website.preferences.globalPage.txtFooter%>
</BODY>
</HTML>
