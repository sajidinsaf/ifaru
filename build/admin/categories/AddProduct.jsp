<%@ page import='java.util.*,ifaru.cart.categories.*,ifaru.cart.products.*,ifaru.cart.users.*'%>
<%

	User user = (User) session.getAttribute("User");
	if(user==null || (!user.isAdmin()))
	{
		User.adminLogin(request,response);
		return;
	}
	
%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/ifaru/"));%></jsp:useBean>
<%

	
	int nStart = website.getRequestParameter(request,"nStart",0);
	int nSize  = website.getRequestParameter(request,"nSize",10);

	int nCategoryID = website.getRequestParameter(request,"nCategoryID",0);	
	Category category = website.categories.get(nCategoryID);
	
	String txtSearch = request.getParameter("txtSearch");
	if(txtSearch==null)
		txtSearch = "%";
		
	if(request.getMethod().equalsIgnoreCase("POST"))
	{
		String ids [] = request.getParameterValues("nID");
		if(ids==null)
		{
			int nID = website.getRequestParameter(request,"nID",0);
			Product product = website.products.get(nID);
			website.categories.addProduct(category,product);
		}
		else
		{
			for(int i=0;i<ids.length;i++)
			{
				int nID = Integer.parseInt(ids[i]);
				Product product = website.products.get(nID);
				website.categories.addProduct(category,product);
			}
		}
		String query = "nCategoryID=" + String.valueOf(nCategoryID);
		query += "&nStart=" + String.valueOf(nStart);
		query += "&nSize=" + String.valueOf(nSize);
		query += "&txtSearch" + com.ifaru.web.UrlEncoderEx.encode(txtSearch);
		response.sendRedirect("AddProduct.jsp?nCategoryID=" + String.valueOf(nCategoryID));
	}
	
	Vector items = website.products.getAll(txtSearch,category.getProductIDs(),nStart,nSize);
	
	Enumeration enum = items.elements();
	
%>
<HTML><HEAD><TITLE>Add Product Under "<%=category.txtName%>" Category</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">

<LINK href="/ifaru/Common.css" rel=stylesheet>

<META content="MSHTML 5.50.4134.100" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" onLoad="">
<%@include file='incToolbar.jsp'%>
<TABLE align=center width=759 cellspacing=0 cellpadding=0>
	<TR>
		<TD align=left valign=top width=100%>
		
			<TABLE cellpadding=15 cellspacing=0 border=0 width=100%>
				<TR>
					<TD>
					
					Add Product Under "<%=category.txtName%>" Category<BR>
					
					<!---------   Data Area ------------>
					
					<TABLE class=Data cellspacing=1>
						<TR>
							<TD><A href="List.jsp">Root</A> > 
							<%=category.getHierarchy(" > ","","List.jsp")%>
							</TD>
						</TR>
					</TABLE>
					
					
						<%
							if(items.size()>0)
							{
						%>
						
						<TABLE class='Data'  cellspacing=1 width=100%>
							<form action='AddProduct.jsp' method='POST' name='PList'>
							<input type=hidden name='nCategoryID' value='<%=nCategoryID%>'>
							<input type=hidden name='nStart' value='<%=nStart%>'>
							<input type=hidden name='nSize' value='<%=nSize%>'>
							<input type=hidden name='txtSearch' value='<%=txtSearch%>'>
							<TR>
								<TH nowrap>ID</TH>
								<TH nowrap>Product</TH>
								<TH nowrap>Active</TH>
								<TH nowrap>Price</TH>
								<TH nowrap>Dummy Price</TH>
								<TH nowrap>Shipping Factor</TH>

							</TR>
							<%
								while(enum.hasMoreElements())
								{
									Product object = (Product) enum.nextElement();
							%>
							<TR>
									<TD nowrap valign=top><input type=checkbox name='nID' value='<%=object.nID%>'></TD>
									<TD nowrap>	<STRONG><%=object.txtName%></STRONG><BR>
												<%=object.txtDescription%><%=(int)object.dblQtyPerPack%></TD>
									<TD nowrap valign=top><%=object.bActive==0 ? "No" : "Yes"%></TD>
									<TD nowrap valign=top><%=object.dblPrice%></TD>
									<TD nowrap valign=top><%=object.dblDummyPrice%></TD>
									<TD nowrap valign=top><%=object.dblShippingFactor%></TD>

							</TR>
							<%
								}
							%>
							<TR>
								<TD colspan=6>
									<input type=submit value='Add'>
								</TD>
							</TR>
							</form> 
						</TABLE>
						
						<TABLE class='Data' cellspacing=1 >
							<TR>
								<% if(nStart>0){%>
								<TD><A HREF="AddProduct.jsp?nCategoryID=<%=nCategoryID%>&nStart=<%=nStart-nSize%>">Prev</A> |</TD>
								<%}else{%>
								<TD>Prev |</TD>
								<%}%>
								<% if(items.size()==nSize){%>
								<TD><A HREF="AddProduct.jsp?nCategoryID=<%=nCategoryID%>&nStart=<%=nStart+nSize%>">Next</A></TD>
								<%}else{%>
								<TD>Next</TD>
								<%}%>
							</TR>
						</TABLE>
						
						
						<%
							}
							else
							{
						%>
						<TABLE class='Data'  cellspacing=1 >
							<TR>
								<TH>Product List</TH>
							</TR>
							<TR>
								<TD>No products, please goto products and add more</TD>
							</TR>
						</TABLE>
						<%
							}
						%>
						
					<!---------   End of Data Area ------------>
					
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>

<SCRIPT LANGUAGE=javascript>
<!--
	function deleteObject(id,idval,value)
	{
		if(confirm("Are you sure you want to delete "+value))
		{
			location.href = "Delete.jsp?" + id + "=" + idval;
		}
	}
//-->
</SCRIPT>


</BODY>
</HTML>

