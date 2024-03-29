<%@ page import='java.util.*,ifaru.cart.userinfo.*,ifaru.cart.users.*'%>
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
	int nSize  = website.getRequestParameter(request,"nSize",100);
	
	Vector items = website.userinfoquestions.getAll(nStart,nSize);
	
	Enumeration enum = items.elements();
	
%>
<HTML><HEAD><TITLE>UserInfoQuestions Admin - <%=website.shopName%></TITLE>
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
					
						UserInfoQuestions Admin - <%=website.shopName%><BR>
					
						<%
							if(items.size()>0)
							{
						%>
						
						<TABLE class='Data' width=100% cellspacing=1 >
							<TR>
								<TH valign="top">ID</TH>
								<TH valign="top">Title</TH>
								<TH valign="top">Type</TH>
								<TH valign="top">Choices</TH>
								<TH valign="top">AcceptOnly</TH>
								<TH valign="top">RejectOnly</TH>
								<TH valign="top">&nbsp;</TH>
								<TH valign="top">&nbsp;</TH>

							</TR>
							<%
								while(enum.hasMoreElements())
								{
									UserInfoQuestion object = (UserInfoQuestion) enum.nextElement();
							%>
							<TR>
									<TD valign="top"><%=object.nID%></TD>
									<TD valign="top"><%=object.txtTitle%></TD>
									<TD valign="top"><%=object.getType()%></TD>
									<TD valign="top"><%=object.txtChoices%></TD>
									<TD valign="top"><%=object.txtAcceptOnly%></TD>
									<TD valign="top"><%=object.txtRejectOnly%></TD>
								<TD valign="top"><A href="Edit.jsp?nID=<%=object.nID%>&nStart=<%=nStart%>&nSize=<%=nSize%>">Edit</A></TD>
								<TD valign="top"><A href="javascript:deleteObject('nID','<%=object.nID%>','<%=object.nID%>')">Delete</A></TD>

							</TR>
							<%
								}
							%>
						</TABLE>
						
						<TABLE class='Data' cellspacing=1 >
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
								<TD><A HREF="Add.jsp?nStart=<%=nStart%>&nSize=<%=nSize%>">Add New</A></TD>
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
			location.href = "Delete.jsp?" + id + "=" + idval + "&nStart=<%=nStart%>&nSize=<%=nSize%>";
		}
	}
//-->
</SCRIPT>


</BODY>
</HTML>
