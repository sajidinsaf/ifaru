<%@page import='ifaru.cart.users.*,ifaru.cart.*'%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/"));%></jsp:useBean>
<%

	Users		users		= website.users;

	String txtRedirect = website.getRequestParameter(request,"txtRedirect");
	String txtAdmin = website.getRequestParameter(request,"txtAdmin");
	String txtUsername = website.getRequestParameter(request,"txtUsername");

	User user = users.get(txtUsername);
	
	String txtMessage = users.sendPassword(user);
	
	txtRedirect = "txtRedirect="+com.ifaru.web.UrlEncoderEx.encode(txtRedirect);
	txtAdmin = "txtAdmin="+com.ifaru.web.UrlEncoderEx.encode(txtAdmin);
	txtUsername = "txtUsername="+com.ifaru.web.UrlEncoderEx.encode(txtUsername);
	txtMessage = "txtMessage="+(txtMessage == null ? "Your%20password%20is%20sent" : com.ifaru.web.UrlEncoderEx.encode(txtMessage) );
	
	response.sendRedirect("Login.jsp?"+txtRedirect+"&"+txtAdmin+"&"+txtUsername+"&"+txtMessage);
%>