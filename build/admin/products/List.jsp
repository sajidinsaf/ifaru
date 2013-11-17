<%@ page import='java.util.*,ifaru.cart.categories.*,ifaru.cart.products.*,ifaru.cart.users.*'%>
<%

	User user = (User) session.getAttribute("User");
	if(user==null || (!user.isAdmin()))
	{
		User.adminLogin(request,response);
		return;
	}
	
%>


<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite">
	<%website.init(application.getRealPath("/ifaru/"));%>
</jsp:useBean>
<%

	
	int nStart = website.getRequestParameter(request,"nStart",0);
	int nSize  = website.getRequestParameter(request,"nSize",10);
	
	Vector items = website.products.getAll(nStart,nSize);
	
	Enumeration enum = items.elements();
	
%>
<HTML><HEAD><TITLE>Products Administration - <%=website.shopName%></TITLE>
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
					
					Products Administration - <%=website.shopName%><BR>
					
					<!---------   Data Area ------------>
					
						<%
							if(items.size()>0)
							{
						%>
						
						<TABLE class='Data'  cellspacing=1 >
							<TR>
								<TH nowrap>ID</TH>
								<TH nowrap>Product</TH>
								<TH nowrap>Active</TH>
								<TH nowrap>Qty Per Pack</TH>
								<TH nowrap>Price Per Qty</TH>
								<TH nowrap>Price</TH>
								<TH nowrap>Dummy Price</TH>
								<TH nowrap>&nbsp;</TH>
								<TH nowrap>&nbsp;</TH>

							</TR>
							<%
								while(enum.hasMoreElements())
								{
									Product object = (Product) enum.nextElement();
							%>
							<TR>
									<TD nowrap valign=top><%=object.nID%></TD>
									<TD nowrap>	<STRONG><%=object.txtName%></STRONG><BR>
												<%=object.txtDescription%></TD>
									<TD nowrap valign=top><%=object.bActive==0 ? "No" : "Yes"%></TD>
									<TD nowrap valign=top><%=object.dblQtyPerPack%></TD>
									<TD nowrap valign=top><%=object.dblPricePerQty%></TD>
									<TD nowrap valign=top><%=object.dblPrice%></TD>
									<TD nowrap valign=top><%=object.dblDummyPrice%></TD>
								<TD><A href="Edit.jsp?nID=<%=object.nID%>">Edit</A></TD>
								<TD><A href="javascript:deleteObject('nID','<%=object.nID%>','<%=object.txtName%>')">Delete</A></TD>

							</TR>
							<%
								}
							%>
						</TABLE>
						
						<TABLE class='Data' cellspacing=1 >
							<TR>
								<% if(nStart>0){%>
								<TD><A HREF="List.jsp?nStart=<%=nStart-nSize%>">Prev</A> |</TD>
								<%}else{%>
								<TD>Prev |</TD>
								<%}%>
								<% if(items.size()==nSize){%>
								<TD><A HREF="List.jsp?nStart=<%=nStart+nSize%>">Next</A></TD>
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
								<TH>List</TH>
							</TR>
							<TR>
								<TD>Your query returned empty result</TD>
							</TR>
						</TABLE>
						<%
							}
						%>
						
						<TABLE class='Data' cellspacing=1 >
							<TR>
								<TD><A HREF="Add.jsp">Add New</A></TD>
							</TR>
						</TABLE>
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
