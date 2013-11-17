<%@page import='ifaru.cart.users.*,ifaru.cart.*,ifaru.cart.products.*,java.util.*'%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/"));%></jsp:useBean>
<%
	Products	products	= website.products;
	Users		users		= website.users;
%>
<HTML>
<HEAD>
<TITLE><%=website.preferences.productListPage.txtTitle%></TITLE>
</HEAD>
<link rel=stylesheet type="text/css" href="/ifaru/Common.css">
<BODY>

<%=website.preferences.globalPage.txtHeader%>
<%=website.preferences.productListPage.txtHeader%>

<TABLE cellspacing=1 cellpadding=2 class=Data>
	<TR>
		<TH> Product </TH>
		<TH> Pills/Pack </TH>
		<TH> Price/Pill </TH>
		<TH> General Price </TH>
		<TH> Our Price </TH>
		<TH> Buy Now </TH>
	</TR>
	<%
		Vector items = products.getAll(0,-1);
		Enumeration enum = items.elements();
		while(enum.hasMoreElements())
		{
			Product product = (Product)enum.nextElement();
			if(product.bActive==0)
				continue;
	%>
	<TR>
		<TD valign=top><STRONG><%=product.txtName%></STRONG><BR><%=product.txtDescription%></TD>
		<TD valign=top><%=(int)product.dblQtyPerPack%></TD>
		<TD valign=top><%=website.format(product.dblPricePerQty)%>GBP</TD>
		<TD valign=top align=right><font color=red style="TEXT-DECORATION: line-through"><%=product.dblDummyPrice%> GBP</font></TD>
		<TD valign=top align=right><font color=blue><STRONG><%=product.dblPrice%> GBP</STRONG></font></TD>
		<FORM action="/ifaru/pages/cart/Cart.jsp">
			<input type=hidden name='nID' value='<%=product.nID%>'>
			<input type=hidden name='txtCommand' value='Add'>
			<TD valign=top>
				<select name='nQuantity'>
					<option value='1'>1 Pack</option>
					<option value='2'>2 Packs</option>
					<option value='3'>3 Packs</option>
					<option value='4'>4 Packs</option>
					<option value='5'>5 Packs</option>
				</select><BR>
				<input type=submit class='SmallButton' value='Add To Cart'>
				</TD>
		</FORM>
	</TR>
	<%
		}
	%>
</TABLE>

<%=website.preferences.productListPage.txtFooter%>
<%=website.preferences.globalPage.txtFooter%>

</BODY>
</HTML>
