<%@ page import='java.lang.reflect.*,java.util.*,ifaru.cart.orders.*,ifaru.cart.users.*,ifaru.cart.preferences.*'%>
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
<HTML><HEAD><TITLE>Preferences Admin - <%=website.shopName%></TITLE>
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
					
						Preferences Admin - <%=website.shopName%><BR>
					
						<TABLE class='Data' width=100% cellspacing=1 >
							<TR>
								<TH>Page</TH>
								<TH>Edit</TH>

							</TR>
							<%
								Field [] fields = website.preferences.getClass().getFields();
								for(int i=0;i<fields.length;i++)
								{
									String name = fields[i].getType().getName();
							%>
							<TR>
								<TD><%=name%></TD>
								<TD><A href="Edit.jsp?txtName=<%=name%>">Edit</A></TD>
							</TR>
							<%
								}
							%>
						</TABLE>
						
					<!---------   End of Data Area ------------>
					
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>

</BODY>
</HTML>
