<%@page import='ifaru.cart.users.*,ifaru.cart.*,ifaru.cart.products.*,ifaru.cart.orders.*,ifaru.cart.userinfo.*,java.util.*'%>
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
	UserInfoQuestions		userinfoquestions = website.userinfoquestions;
%>
<HTML>
<HEAD>
<TITLE><%=website.preferences.userInfoPage.txtTitle%></TITLE>
</HEAD>
<link rel=stylesheet type="text/css" href="/ifaru/Common.css">
<BODY>

<%=website.preferences.globalPage.txtHeader%>
<%=website.preferences.userInfoPage.txtHeader%>

<%@ include file='incOrderDetails.jsp'%>

	<TABLE cellspacing=1 cellpadding=2 class=Data width=80%>
		<FORM action="UserInfoPost.jsp" METHOD="POST" onsubmit="if(verifyForm()) return true; else return false;" name="UserInfo">
	<%
		Vector questions = website.userinfoquestions.getAll(0,-1);
		Enumeration enum = questions.elements();
		int i = 1;
		
		String txtScript = "";
		
		while(enum.hasMoreElements())
		{
			UserInfoQuestion q = (UserInfoQuestion) enum.nextElement();
			%>
			<input type=hidden name='nID' value='<%=q.nID%>'>
			<input type=hidden name='nType<%=q.nID%>' value='<%=q.nType%>'>
			<input type=hidden name='txtTitle<%=q.nID%>' value='<%=q.txtTitle%>'>
			<%
				if(q.nType==q.SEPARATOR)
				{
					%>
						<TR><TD colspan=2><HR size=1></TD></TR>
						</TABLE>
						<BR>
					<%
				}
				else if(q.nType==q.HEADING)
				{
					%>
						<TABLE cellspacing=1 cellpadding=2 class=Data width=80%>
						<TR><TH colspan=2><%=q.txtTitle%></TH></TR>
					<%
				}
				else
				{
					txtScript += q.htmlScript + "\r\n";
					%>
					<TR>
						<TD valign=top>
							<%=i++%>) <%=q.txtTitle%>
						</TD>
						<TD valign=top>
							<%=q.htmlQuestion%>
						</TD>
					</TR>
					<%
				}
		}
	%>
	
	<BR>
	<input type=submit value="Proceed To Pay">
	</FORM>


<SCRIPT LANGUAGE=javascript>
<!--

	function acceptOptions()
	{
		var argCount = acceptOptions.arguments.length;
		var object   = acceptOptions.arguments[0];
		
		for(i=0;i<object.length;i++)
		{
			var radio = object[i];
			if(!radio.checked)
				continue;
			for(j=1;j<argCount;j++)
			{
				if( radio.value == acceptOptions.arguments[j])
					return true;
			}
		}
		return false;
	}
	
	
	function rejectOptions()
	{
		var argCount = rejectOptions.arguments.length;
		var object   = rejectOptions.arguments[0];
		
		for(i=0;i<object.length;i++)
		{
			var radio = object[i];
			if(!radio.checked)
				continue;
			for(j=1;j<argCount;j++)
			{
				if( radio.value == rejectOptions.arguments[j])
					return true;
			}
		}
		return false;
	}
	
	

	function verifyForm()
	{
		<%=txtScript%>
		return true;
	}
//-->
</SCRIPT>

<%=website.preferences.userInfoPage.txtFooter%>
<%=website.preferences.globalPage.txtFooter%>

</BODY>
</HTML>
