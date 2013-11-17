<%@page import='ifaru.cart.users.*,ifaru.cart.*,ifaru.cart.countries.*'%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/"));%></jsp:useBean>
<%

	Users		users		= website.users;
	Countries	countries	= website.countries;


	String txtRedirect = website.getRequestParameter(request,"txtRedirect");
	String txtMessage = null;
	String txtReferredBy = (String)session.getAttribute( website.shopName + "-Referred-By");
	if(txtReferredBy==null)
		txtReferredBy = "";
	
	UserProfile profile = null;
	
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		profile = new UserProfile(request);
 		txtMessage = users.insert(profile);
		if(txtMessage == null)
		{
			users.changePassword(profile.txtEmailAddress,"",request.getParameter("txtPassword"));
			//com.oph.email.Email.sendSignupMail(profile);
			response.sendRedirect("Login.jsp?txtMessage=Registration Successful,%20please%20login.&txtRedirect=" + com.ifaru.web.UrlEncoderEx.encode(txtRedirect));
			return;
		}
	}
	else
	{
		profile = new UserProfile();
	}
		
%>
<HTML>
<HEAD>
<TITLE><%=website.preferences.signupPage.txtTitle%></TITLE>
</HEAD>
<link rel=stylesheet type="text/css" href="/ifaru/Common.css">
<BODY>

<%=website.preferences.globalPage.txtHeader%>
<%=website.preferences.signupPage.txtHeader%>


			<!---------   Data Area ------------>
			<%
				if(txtMessage != null)
				{
					%>
					<P><font color=red size=2><b><%=txtMessage%></b></font></P>
					<%
				}
			%>
			<TABLE cellSpacing=1 cellPadding=2 border=0 class=Data>
			<TBODY>
				<TR>
					<FORM action="Signup.jsp" onsubmit="if(verifyForm()) return true; else return false;" method=POST name="SignupForm">
					<INPUT type=hidden name="txtRedirect" value="<%=txtRedirect%>">
					<INPUT type=hidden name="txtReferredBy" value="<%=txtReferredBy%>">
					<TH> Register to <%=website.shopName%></TH>
				</TR>
				<TR>
					<TD background=./../../images/tdbg04.gif>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;( Required Fields <font color=red>*</font> )
						<TABLE cellSpacing=5 cellPadding=2 border=0>
						<TBODY>
							<TR>
								<TD nowrap class=normal align=right><font color=red>*</font> Email Address:</TD>
								<TD class=normal><INPUT class=LightBox size=20 name=txtEmailAddress value="<%=profile.txtEmailAddress%>"> </TD>
							</TR>
							<TR>
								<TD align=right class=normal><font color=red>*</font> Password:</TD>
								<TD class=normal><INPUT class=LightBox type=password size=20 name=txtPassword> </TD>
							</TR>
							<TR>
								<TD align=right nowrap class=normal><font color=red>*</font> Confirm Password:</TD>
								<TD class=normal><INPUT class=LightBox type=password size=20 name=txtPassword2> </TD>
							</TR>
							<TR>
								<TD align=right nowrap class=normal valign=top> Friend who Referred you:</TD>
								<TD class=normal><INPUT class=LightBox type=text size=20 name=txtReferredBy value="<%=txtReferredBy%>"><BR>
									If the box is empty then please enter email address of your friend who referred you. Leave it as it is if no one referred you.
								</TD>
							</TR>
							<TR>
								<TD align=right nowrap class=normal><font color=red>*</font> First name:</TD>
								<TD class=normal><INPUT class=LightBox  size=20 name=txtFirstname value="<%=profile.txtFirstname%>"> </TD>
							</TR>
							<TR>
								<TD align=right nowrap class=normal><font color=red>*</font> Last name:</TD>
								<TD class=normal><INPUT class=LightBox  size=20 name=txtLastname value="<%=profile.txtLastname%>"> </TD>
							</TR>
							<TR>
								<TD align=right nowrap class=normal valign=top><font color=red>*</font> Street Address:</TD>
								<TD class=normal><TEXTAREA class=LightBox cols=30 rows=3 name=txtStreetAddress><%=profile.txtStreetAddress%></TEXTAREA></TD>
							</TR>
							<TR>
								<TD align=right class=normal><font color=red>*</font> City:</TD>
								<TD class=normal><INPUT class=LightBox  size=20 name=txtCity value="<%=profile.txtCity%>"> </TD>
							</TR>
							<TR>
								<TD align=right class=normal><font color=red>*</font> Post Code:</TD>
								<TD class=normal><INPUT class=LightBox  size=20 name=txtZipCode value="<%=profile.txtZipCode%>"> </TD>
							</TR>
							<TR>
								<TD align=right class=normal><font color=red>*</font> County:</TD>
								<TD class=normal><INPUT class=LightBox  size=20 name=txtState value="<%=profile.txtState%>"> </TD>
							</TR>
							<TR>
								<TD align=right class=normal><font color=red>*</font> Country:</TD>
								<TD class=normal><SELECT 
            name=txtCountry>
            <%=countries.CountryOptions%>
            </SELECT>
              </TD>
							</TR>
							<TR>
								<TD align=right class=normal valign=top><font color=red>*</font> Phone:</TD>
								<TD class=normal><INPUT class=LightBox  size=20 name=txtPhone value="<%=profile.txtPhone%>"><BR>
									<B>Correct tel number speeds up shipping!</B><BR><FONT size=1> Incorrect or invalid 
									phone numbers can cause delays in the processing of your order.</FONT><FONT 
									face="Verdana, Arial, Helvetica, sans-serif" size=2><FONT size=1> Phone numbers 
									are not displayed anywhere on the site and are a matter of privacy. We sometimes 
									call first-time customers to confirm validity of their order, for their 
									protection.</FONT></FONT>
								</TD>
							</TR>
							<TR>
								<TD align=right class=normal>How did you hear about us?:</TD>
								<TD class=normal><INPUT class=LightBox  size=20 name=txtReference> </TD>
							</TR>
							<TR>
								<TD align=right class=normal>&nbsp;</TD>
								<TD class=normal><INPUT type=checkbox value="1" <%=profile.bSendPromotion==1 ? "checked" : ""%> name=bSendPromotion> Send me special promotions.</TD>
							</TR>
							<TR>
								<TD align=right class=normal>&nbsp;</TD>
								<TD class=normal><INPUT type=checkbox value="1" <%=profile.bNeverSendMail==1 ? "checked" : ""%> name=bNeverSendMail> Never send me any mails.</TD>
							</TR>
							<TR>
								<TD align=right class=normal>&nbsp;</TD>
								<TD class=normal><INPUT type=checkbox value="1" size=20 name=bAgree> I agree all <A HREF="/static/TOU.jsp">terms and conditions</A>.</TD>
							</TR>
							<TR>
								<TD align=right class=normal>&nbsp;</TD>
								<TD class=normal><INPUT class=DarkButton type=submit name=Submit value="Sign-up"></TD>
							</TR>
						</TBODY>
						</TABLE>
						<!---------------------------------- ##### # ####### ---------------------------------->
					</TD>
				</TR>
				</FORM>
			</TBODY>
			</TABLE>
			


<SCRIPT LANGUAGE=javascript>
<!--

	document.SignupForm.txtCountry.value = "United States of America"

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
		if(!verifyMail(document.SignupForm.txtEmailAddress))
			return false;
		if(!verifyPasswords(document.SignupForm.txtPassword,document.SignupForm.txtPassword2))
			return false;
		if(!verifyEmpty(document.SignupForm.txtFirstname,"First name"))
			return false;
		if(!verifyEmpty(document.SignupForm.txtLastname,"Last name"))
			return false;
		if(!verifyEmpty(document.SignupForm.txtStreetAddress,"Street address"))
			return false;
		if(!verifyEmpty(document.SignupForm.txtZipCode,"Post Code"))
			return false;
		if(!verifyEmpty(document.SignupForm.txtCity,"City"))
			return false;
		if(!verifyEmpty(document.SignupForm.txtState,"County"))
			return false;
		if(!verifyEmpty(document.SignupForm.txtPhone,"Phone"))
			return false;
		if(!document.SignupForm.bAgree.checked)
		{
			alert("You must agree to terms and conditions");
			document.SignupForm.bAgree.focus()
			return false;
		}
		return true;
	}
	
//-->
</SCRIPT>

<%=website.preferences.signupPage.txtFooter%>
<%=website.preferences.globalPage.txtFooter%>

</BODY>
</HTML>
