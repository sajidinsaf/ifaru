<%@page import='ifaru.cart.users.*,ifaru.cart.*,ifaru.cart.products.*,ifaru.cart.orders.*,ifaru.cart.countries.*,java.util.*'%>
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


	order.txtEmailAddress = user.txtUsername;

	if(request.getMethod().equalsIgnoreCase("POST"))
	{
		order.shippingAddress = new ShippingAddress(request);
		order.setShippingCharge(website);
		order.calculateCart(website);
		
		response.sendRedirect("UserInfo.jsp");
		return;
	}

	UserProfile profile = users.getProfile(user.txtUsername);
	String txtCountry = website.getRequestParameter(request,"txtCountry",profile.txtCountry);
	
%><HTML>
<HEAD>
<TITLE><%=website.preferences.shippingPage.txtTitle%></TITLE>
</HEAD>
<link rel=stylesheet type="text/css" href="/ifaru/Common.css">
<BODY>

<%=website.preferences.globalPage.txtHeader%>
<%=website.preferences.shippingPage.txtHeader%>

<%@ include file='incOrderDetails.jsp'%>

	<FORM action="Shipping.jsp" method="POST" name="ShippingForm">
	<TABLE cellspacing=1 cellpadding=2 class=Data width=80%>
		<input type=hidden name="nOrderID" value="0">
		<TR>
			<TH colspan=2>Shipping Address</TH>
		</TR>
		<TR>
			<TD colspan=2>Please specify your Shipping Address, by default we have put your address in it, please modify it if you want to send the order to some other place.<BR></TD>
		</TR>
		<TR>
			<TD align=right nowrap>Deliver To:</TD>
			<TD><input class=LightBox type=text name='txtName' value='<%=profile.txtFirstname%> <%=profile.txtLastname%>'></TD>
		</TR>
		<TR>
			<TD align=right nowrap valign=top>Street Address:</TD>
			<TD><textarea class=LightBox cols=30 rows=3 name='txtStreetAddress'><%=profile.txtStreetAddress%></TEXTAREA></TD>
		</TR>
		<TR>
			<TD align=right nowrap>Zip:</TD>
			<TD><input class=LightBox type=text name='txtZipCode' value="<%=profile.txtZipCode%>" ></TD>
		</TR>
		<TR>
			<TD align=right nowrap>City:</TD>
			<TD><input class=LightBox type=text name='txtCity' value="<%=profile.txtCity%>"></TD>
		</TR>
		<TR>
			<TD align=right nowrap>State:</TD>
			<TD><input class=LightBox type=text name='txtState' value="<%=profile.txtState%>"></TD>
		</TR>
		<TR>
			<TD align=right nowrap>
				<A name=Country></A>
				Country:
			</TD>
			<TD>
				<SELECT name=txtCountry onchange='location.href="Shipping.jsp?txtCountry="+document.ShippingForm.txtCountry.value'>
            <%=countries.CountryOptions%>
				</SELECT>			
				
				<SCRIPT LANGUAGE=javascript>
				<!--
					document.ShippingForm.txtCountry.value = "<%=txtCountry%>"
				//-->
				</SCRIPT>
				
			</TD>
		</TR>
		<TR>
			<TD align=right nowrap>Phone:</TD>
			<TD><input class=LightBox type=text name='txtPhone' value="<%=profile.txtPhone%>" ></TD>
		</TR>
								
								
		<%
			Country cn = countries.get(txtCountry);
		%>
		<input type=hidden name="txtShippingMethod" value="ExpressCourier">
		<TR>
			<TD align=right nowrap>Shipping Charges</TD>
			<TD>
				<%=website.format(cn.dblExpressCourier)%>
			</TD>
		</TR>
		<TR>
			<TD colspan=2>*Registered Mails will not have tracking numbers for all the places.</TD>
		</TR>
								
		<TR>
			<TD></TD>
			<TD><input type=submit class=SmallDarkButton name='' value='Next..'></TD>
		</TR>
	</TABLE>

<%=website.preferences.shippingPage.txtFooter%>
<%=website.preferences.globalPage.txtFooter%>

</BODY>
</HTML>
