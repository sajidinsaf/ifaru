<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %> 

   <session:existsAttribute name="global.error.invalidlogin" value="true">
     <session:attribute name="global.error.invalidlogin"/>
     <!-- remove this from the session so that it doesn't get displayed if we navigate away from this 
          page without successfully changing the password and then return later during the session
          to try again -->
     <session:removeAttribute name="global.error.invalidlogin"/>
   </session:existsAttribute>    
   <session:existsAttribute name="userview" value="false">
     <logic:redirect forward="loginpage"/>          
   </session:existsAttribute>
 
<link rel=stylesheet type="text/css" href="/ifaru/Common.css">

	<TABLE align="center" class=Data width=300 cellspacing=1 >
		<html:form action="/ChangePassword" onsubmit="if(verifyForm()) return true; else return false;">
		<TR>
			<TH colspan=2>ChangePassword</TH>
		</TR>
		<TR>
			<TD valign=top>Old Password</TD>
			<TD valign=top><html:password property="txtOldPassword" value="" size="25"/></TD>
		</TR>
		<TR>
			<TD valign=top>New Password</TD>
			<TD valign=top><html:password property="txtNewPassword" value="" size="25"/></TD>
		</TR>
		<TR>
			<TD valign=top>New Password Again</TD>
			<TD valign=top><html:password property="txtNewPassword2" value="" size="25"/></TD>
		</TR>
		<TR>
			<TD><html:submit property="Submit"/></TD>
			<TD></TD>
		</TR>
		</html:form>
	</TABLE>
	
<SCRIPT LANGUAGE=javascript>
<!--

	alphabets = new String("abcdefghijklmnopqrstuvwxyz");
	numbers = new String("0123456789");
	function verifyEmpty(object,name)
	{
		if(object.value=="")
		{
			alert(name + " can not be empty.")
			object.focus();
			return false;
		}
		return true;
	}
	
	function verifyLength(object,n,name)
	{
		Value = new String(object.value)
		if(Value.length<n)
		{
			alert(name + " must have atleast " + n + " characters")
			object.focus();
			return false;
		}
		return true;
	}
	
	function exists(chars,ch)
	{
		ch = ch.toLowerCase();
		if(chars.indexOf(ch) != -1)
			return true;
		return false;
	}
	
	function verifyUsername(object)
	{
		if(!verifyEmpty(object,"Username"))
			return false;
		if(!verifyLength(object,5,"Username"))
			return false;
		Value = new String(object.value)
		for(i=0;i<Value.length;i++)
		{
			ch = Value.charAt(i)
			if(exists(alphabets,ch) || exists(numbers,ch) || ch=="_")
			{
			}
			else
			{
				alert("Username field can contain only alphabets, digits and underscore (_) sign.");
				object.focus();
				return false;
			}
		}
		return true;
	}
	
	function verifyPasswords(pass,pass2)
	{
		if(!verifyEmpty(pass,"Password"))
			return false;
		if(!verifyLength(pass,5,"Password"))
			return false;
		passString = new String(pass.value)
		pass2String = new String(pass2.value)
		if((passString.length == pass2String.length) && (passString.indexOf(pass2String)==0))
			return true;
		alert("Both passwords are not same. Please enter once again")
		pass.value = "";
		pass2.value = "";
		pass.focus();
		return false;
	}
	
	function verifyMail(object)
	{
		if(!verifyEmpty(object,"Email Address"))
			return false;
		if(!exists(object.value,"@"))
		{
			alert("Please enter any valid email address")
			return false;
		}
		return true;
	}
	
	function verifyForm()
	{
		if(!verifyEmpty(document.PasswordForm.txtOldPassword,"Old Password"))
			return false;
		if(!verifyPasswords(document.PasswordForm.txtNewPassword,document.PasswordForm.txtNewPassword2))
			return false;
		return true;
	}
	
//-->
</SCRIPT>

