<%@page import='ifaru.cart.users.*,ifaru.cart.*,ifaru.cart.products.*,ifaru.cart.categories.*,java.util.*'%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/"));%></jsp:useBean>
<%
	Products	products	= website.products;
	Users		users		= website.users;
	
	int nID					= website.getRequestParameter(request,"nID",0);
	int nCategoryID			= website.getRequestParameter(request,"nCategoryID",-1);
	
	Category parent			= null;
	if(nCategoryID!=-1)
		parent				= website.categories.get(nCategoryID);
	
	Product product			= products.get(nID);
	
	String txtHeader		= (product.txtHeader == null) ? website.preferences.productPage.txtHeader : product.txtHeader;
	String txtFooter		= (product.txtFooter == null) ? website.preferences.productPage.txtFooter : product.txtFooter;
	
%>
<HTML>
<HEAD>
<TITLE><%=product.txtName%> - <%=website.shopName%></TITLE>
</HEAD>
<link rel=stylesheet type="text/css" href="/ifaru/Common.css">
<BODY>

<%=website.preferences.globalPage.txtHeader%>
<%=txtHeader%>

<TABLE class=Data cellspacing=1 width=100%>
	<TR>
		<TD align=left><A href="Category.jsp"><%=website.shopName%></A> > 
		<%=( (parent!=null) ? parent.getHierarchy(" > ","","Category.jsp") : "" )%> > <%=product.txtName%>
		</TD>
	</TR>
</TABLE>
<BR>


<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=0 class=Data width=100%>
	<TR>
		<TD valign=top>
			<STRONG><%=product.txtName%></STRONG><BR><%=product.txtDescription%><BR>
			<%if(product.txtImgUrl!=null && product.txtImgUrl.length()>0){%>
			<IMG src='<%=product.txtImgUrl%>' alt='<%=product.txtName%>'>
			<%}%>
		</TD>
		<TD valign=top>
			General Price <STRONG><font color=red><%=product.dblDummyPrice%></font></STRONG> GBP<BR>
			Our Price <STRONG><%=product.dblPrice%></STRONG> GBP<BR>
			<BR>
			<%if(product.txtBuyNowUrl!=null){%>
			
				<input type=button class='SmallButton' value='Buy Now' onclick="location.href='Goto.jsp?nProductID=<%=product.nID%>'">
				
			<%}else{%>
			
				<FORM action="Cart.jsp" id=form1 name=form1>
					<input type=hidden name='nID' value='<%=product.nID%>'>
					<input type=hidden name='txtCommand' value='Add'>
						<select name='nQuantity'>
							<option value='1'>1 Pack</option>
							<option value='2'>2 Packs</option>
							<option value='3'>3 Packs</option>
							<option value='4'>4 Packs</option>
							<option value='5'>5 Packs</option>
						</select>
						<input type=submit class='SmallButton' value='Add To Cart' id=submit1 name=submit1>
				</FORM>
				
			<%}%>
		</TD>
	</TR>
</TABLE>


<%=txtFooter%>
<%=website.preferences.globalPage.txtFooter%>

</BODY>
</HTML>