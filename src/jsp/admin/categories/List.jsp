<%@ page import='java.util.*,ifaru.cart.categories.*,ifaru.cart.users.*,ifaru.cart.products.*'%>
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
	int nParentID = website.getRequestParameter(request,"nParentID",0);
	
	Category parent = null;
	Vector items = null;
	if(nParentID != 0)
	{
		parent = website.categories.get(nParentID);
		items = parent.childCategories;
	}
	else
	{
		items = website.categories.getAll(nParentID,nStart,nSize);
	}
	
	Enumeration enum = items.elements();
	
%>
<HTML><HEAD><TITLE>Categories Admin - <%=website.shopName%></TITLE>
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
					
					<!---------   Data Area ------------>
					
						Categories Admin - <%=website.shopName%><BR>
						
						<TABLE class=Data cellspacing=1>
							<TR>
								<TD><A href="List.jsp">Root</A> > 
								<%=( (parent!=null) ? parent.getHierarchy(" > ","","List.jsp") : "" )%>
								</TD>
							</TR>
						</TABLE>
					
						<%
							if(items.size()>0)
							{
						%>
						
						<TABLE class='Data' width=100%>
							<TR>
								<TH valign="top" colspan=5>Categories Under <%=((parent==null)?("Root"):(parent.txtName))%></TH>
							</TR>
							<TR>
								<TH valign="top">ID</TH>
								<TH valign="top">Name</TH>
								<TH valign="top">List</TH>
								<TH valign="top">&nbsp;</TH>
								<TH valign="top">&nbsp;</TH>

							</TR>
							<%
								while(enum.hasMoreElements())
								{
									Category object = (Category) enum.nextElement();
							%>
							<TR>
									<TD valign="top"><%=object.nID%></TD>
									<TD valign="top"><A href="List.jsp?nParentID=<%=object.nID%>"><%=object.txtName%></A></TD>
									<TD valign="top"><A href="List.jsp?nParentID=<%=object.nID%>">List</A></TD>
								<TD valign="top"><A href="Edit.jsp?nParentID=<%=nParentID%>&nID=<%=object.nID%>&nStart=<%=nStart%>&nSize=<%=nSize%>">Edit</A></TD>
								<TD valign="top"><A href="javascript:deleteObject('nID','<%=object.nID%>','<%=object.nID%>')">Delete</A></TD>

							</TR>
							<%
								}
							%>
						</TABLE>
						
						<TABLE class='Data'>
							<TR>
								<% if(nStart>0){%>
								<TD><A HREF="List.jsp?nStart=<%=nStart-nSize%>&nSize=<%=nSize%>">Prev</A> |</TD>
								<%}else{%>
								<TD>Prev |</TD>
								<%}%>
								<% if(items.size()==nSize){%>
								<TD><A HREF="List.jsp?nStart=<%=nStart+nSize%>&nSize=<%=nSize%>">Next</A></TD>
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
						<TABLE class='Data'  width=100%>
							<TR>
								<TH>Category List</TH>
							</TR>
							<TR>
								<TD>No Categories Below parent category</TD>
							</TR>
						</TABLE>
						<%
							}
						%>
						
						<TABLE class='Data'>
							<TR>
								<TD><A HREF="Add.jsp?nParentID=<%=nParentID%>&nStart=<%=nStart%>&nSize=<%=nSize%>">Add New Category</A></TD>
							</TR>
						</TABLE>
						
						<BR>
						<%if(parent != null){%>
						<TABLE class=data cellspacing=1 width=100%>
							<TR>
								<TH colspan=3>Products Under <%=parent.txtName%></TH>
							</TR>
							<%
								Vector products = parent.products;
								enum = products.elements();
								while(enum.hasMoreElements())
								{
									Product p = (Product) enum.nextElement();
							%>
							<TR>
								<TD><STRONG><%=p.txtName%></STRONG><BR><%=p.txtDescription%></TD>
								<TD><A href="../products/Edit.jsp?nID=<%=p.nID%>">Edit</A></TD>
								<TD><A href="javascript:removeProduct(<%=parent.nID%>,'<%=parent.txtName%>',<%=p.nID%>,'<%=p.txtName%>')">Remove from this Category</A></TD>
							</TR>
							<%
								}
							%>
							<TR>
								<TD colspan=3>
									<A href="AddProduct.jsp?nCategoryID=<%=parent.nID%>">Add Product Under <%=parent.txtName%> Category</A>
								</TD>
							</TR>
						</TABLE>
						<BR>
						
						<%}%>
						
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
			location.href = "Delete.jsp?" + id + "=" + idval + "&nStart=<%=nStart%>&nSize=<%=nSize%>";
		}
	}
	
	function removeProduct(nCategoryID,txtCategoryName,nProductID,txtProductName)
	{
		if(confirm("Are you sure you want to remove "+txtProductName+" from "+txtCategoryName))
		{
			location.href = "RemoveProduct.jsp?nCategoryID="+nCategoryID+"&nProductID="+nProductID+"&nStart=<%=nStart%>&nSize=<%=nSize%>";
		}
	}
//-->
</SCRIPT>


</BODY>
</HTML>
