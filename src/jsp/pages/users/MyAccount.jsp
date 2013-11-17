<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %> 

 <session:existsAttribute name="userview" value="false">
   <logic:redirect forward="loginpage"/>          
 </session:existsAttribute>

 <session:existsAttribute name="myaccount.message" value="true">
   <session:attribute name="myaccount.page"/>          
 </session:existsAttribute>
 
<link rel=stylesheet type="text/css" href="/ifaru/Common.css">

	<TABLE align="center" class=Data width=300 cellspacing=1 >
		<TR>
			<TH colspan=2>My Account</TH>
		</TR>
		<TR>
			<TD><html:link forward="changepasswordpage">Change Password</html:link></TD>
			<!-- remove this tag when change profile implementation is complete -->
			<session:setAttribute name="coming.soon">
			  Change Profile
			</session:setAttribute>
			<TD><html:link forward="comingsoon">Change Profile</html:link></TD>
		</TR>
		<TR>
			<TD><A href="/ifaru/pages/orders/MyOrders.jsp">My Orders</A></TD>
			<TD><html:link page="/pages/users/Logout.jsp">Logout</html:link></TD>
		</TR>
	</TABLE>
	