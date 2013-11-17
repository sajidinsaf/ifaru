<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>

   <session:existsAttribute name="global.error.invalidlogin" value="true">
     <session:attribute name="global.error.invalidlogin"/>
   </session:existsAttribute>    
    <p align=center>
	<html:form focus="txtUsername" action="/Login" method="POST">
          <br><br><br><br>
	  <TABLE align="center" class=Data cellspacing=1 >
		<TR>
			<TH colspan=2>Please Login</TH>
		</TR>
		<TR>
			<TD>Username</TD>
			<TD><html:text property="txtUsername" size="25"/></TD>
		</TR>
		<TR>
			<TD>Password</TD>
			<TD><html:password property="txtPassword" value="" size="25"/></TD>
		</TR>
		<TR>
			<TD colspan=2><html:submit property="submit"/></TD>
		</TR>
	</TABLE>
	</html:form>
	<BR>
	<!--
	<TABLE align="center" class=Data cellspacing=1 >
		<html:form action="/Login" method="POST">
		<TR>
			<TH colspan=2>Forgot Password?</TH>
		</TR>
		<TR>
			<TD>Username</TD>
			<TD><html:text property="txtUsername" size="25"/></TD>
		</TR>
		<TR>
			<TD colspan=2><input type=submit value="Send Password" id=submit2 name=submit2></TD>
		</TR>
		</html:form>
	</TABLE>
	<BR>
	<BR>
	<TABLE align="center" class=Data cellspacing=1 >
		<TR>
			<TH>Do not have a login?</TH>
		</TR>
		<TR>
			<TD><A href="Signup.jsp">Click Here</a> to signup with iFaru</TD>
		</TR>
	</TABLE> -->
   </p>
