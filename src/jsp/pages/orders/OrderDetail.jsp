<%@page import='ifaru.cart.users.*,ifaru.cart.orders.*,ifaru.cart.products.*,ifaru.cart.*,ifaru.cart.orders.*,java.util.*'%>
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

	response.addHeader("expires","0");
	
	int nID = website.getRequestParameter(request,"nID",0);
	
	Order order = orders.get(nID);
	
	if(!user.isAdmin())
	{
		if(!order.txtEmailAddress.equals(user.txtUsername))
		{
			response.sendError(response.SC_UNAUTHORIZED);
			return;
		}
	}
	
%>
<HTML><HEAD><TITLE><%=website.shopName%> Order Detail</TITLE>
<LINK href="/ifaru/Common.css" rel=stylesheet>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" onLoad="">
<TABLE width=100% cellpadding=10>
	<TR>
		<TD>
				<!---------   Data Area ------------>
							
				<!---------   Order Details ------------>
				<%@include file='incOrderDetails.jsp'%>
				<!--------- End Of Order Details -------->
				
				<TABLE width=100% border=0 cellspacing=1 class=Data>
					<TR>
						<TH>  Order Status </TH>
					</TR>
					<TR>
						<TD> <%=order.getStatus()%></TD>
					</TR>
					<%if(order.txtRemarks!=null){%>
					<TR>
						<TD> <%=order.txtRemarks%></TD>
					</TR>
					<%}%>
				</TABLE>
				
				<!---------   End of Data Area ------------>
		</TD>
	</TR>
</TABLE>
</BODY></HTML>
