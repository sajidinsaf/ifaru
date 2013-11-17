
<jsp:useBean id="transecute" class="com.transecute.functions" scope="session" />

<%

	// Start new scope here..
	{
	
		UserProfile profile = users.getProfile(user.txtUsername);

		Variable usd2inr = variables.get("USD-2-INR");
		
		double dblGrandTotalINR = dblGrandTotal * Double.parseDouble(usd2inr.txtValue);
		

		//Below are the constants this program needs
		//replace them with your values

		String toid = "571" ; //put in your clientid you recvd after signing up
		String totype = "transecute";
		String amount = website.format(dblGrandTotalINR) ; //your script should substitute the amount here
		String description = orderID;
		String orderdescription = website.shopName + " Products";
		String redirecturl = website.shopWebAddress + "/ifaru/pages/cart/process/Transecute.jsp";
		String key = "eFv7H6l4479xDUxstAgaCFp2CgofcvG3" ; 

		
		
		String countrycode= profile.txtCountry;
		String currencysymbol="USD";
		String customamount= website.format(dblGrandTotal);
		String city= profile.txtCity ;
		String state= profile.txtState;
		String street=profile.txtStreetAddress;
		String zip=profile.txtZipCode;
		String telno=profile.txtPhone;
		String telnocc="091";
		String emailaddr=user.txtUsername;
		
		
		String checksum = transecute.getchecksum(toid,totype,amount,description ,redirecturl,key);
		
		//to be used while testing integration
		String testurl = "https://secure.transecute.com/transecuteicici/icicicredit/payprocesstest.php3"; 
		
		//to be used in live mode
		String liveurl = "https://secure.transecute.com/transecuteicici/icicicredit/payprocess.php3"; 


%>
<form name="frm1" method="post" action=<%=liveurl %>>
<input type=hidden name=toid value=<%=toid %>>
<input type=hidden name=totype value=<%=totype %>>
<input type=hidden name=amount value=<%=amount %>>
<input type=hidden name=description value=<%=description %>>
<input type=hidden name=orderdescription value=<%=orderdescription%>>
<input type=hidden name=redirecturl value=<%=redirecturl %>>
<input type=hidden name=checksum value=<%=checksum %>>


<input type="hidden" name="TMPL_<%=countrycode %>" value="selected">
<input type="hidden" name="TMPL_AMOUNT" value="<%=customamount %>">
<input type="hidden" name="TMPL_CURRENCY" value="<%=currencysymbol %>">
<input type="hidden" name="TMPL_city" value="<%=city %>">
<input type="hidden" name="TMPL_state" value="<%=state %>">
<input type="hidden" name="TMPL_street" value="<%=street %>">
<input type="hidden" name="TMPL_zip" value="<%=zip %>">
<input type="hidden" name="TMPL_telno" value="<%=telno %>">
<input type="hidden" name="TMPL_telnocc" value="<%=telnocc %>">
<input type="hidden" name="TMPL_emailaddr" value="<%=emailaddr %>">
<input type="hidden" name="fromtype" value="icicicredit">

<TABLE class=Data width=80% cellspacing=1 >
	<TR><TH colspan=2>Pay Now via Transecute</TH></TR>
	<TR>
		<TD>Transecute is india's no. 1 secure payment gateway. Please pay by transecute now.</TD>
		<TD><input type=submit value="Proceed To Pay"></TD>
	</TD>
</TABLE>

</form>
<%
	}
%>