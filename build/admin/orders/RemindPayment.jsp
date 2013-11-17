<%@page import='ifaru.cart.*,ifaru.cart.users.*,ifaru.cart.products.*,ifaru.cart.orders.*,java.util.*,java.text.*,java.sql.*'%>
<%
	response.setContentType("text/text");
	response.addHeader("expires","0");
	User user = (User)session.getAttribute("User");
	if(user==null || (!user.isAdmin()))
	{
		User.adminLogin(request,response);
		return;
	}
	
%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/ifaru/"));%></jsp:useBean>
<%
	
	int nStart = website.getRequestParameter(request,"nStart",0);
	int nSize  = website.getRequestParameter(request,"nSize",2000);
	
	int nOrderState = website.getRequestParameter(request,"nOrderState",0);

	int nStart_Day = website.getRequestParameter(request,"nStart_Day",1);
	int nStart_Month = website.getRequestParameter(request,"nStart_Month",1);
	int nStart_Year = website.getRequestParameter(request,"nStart_Year",2003);
	
	int nEnd_Day = website.getRequestParameter(request,"nEnd_Day",1);
	int nEnd_Month = website.getRequestParameter(request,"nEnd_Month",12);
	int nEnd_Year = website.getRequestParameter(request,"nEnd_Year",3000);
	
	String text,startdate,enddate;
	text = String.valueOf(nStart_Year);
	text += "-" + String.valueOf(nStart_Month);
	text += "-" + String.valueOf(nStart_Day);
	startdate = text;
	text += " 00:00:00.00000000";
	Timestamp tsStart = Timestamp.valueOf(text);

	text = String.valueOf(nEnd_Year);
	text += "-" + String.valueOf(nEnd_Month);
	text += "-" + String.valueOf(nEnd_Day);
	enddate = text;
	text += " 00:00:00.00000000";
	Timestamp tsEnd = Timestamp.valueOf(text);

	Vector pageorders = null;
	
	String ids[] = request.getParameterValues("nID");
	if(ids != null)
	{
		pageorders = website.orders.getAll(request.getParameterValues("nID"));
	}
	else
	{
		pageorders = new Vector();
		pageorders.addElement( website.orders.get( website.getRequestParameter(request,"nID",0) ) );
	}

	Enumeration enum = pageorders.elements();
	while(enum.hasMoreElements())
	{
		Order order = (Order)enum.nextElement();
		if(order.nOrderState == order.PAYMENT_PENDING)
		{
			website.mailer.sendPaymentPendingMail(order,website.users);
		}
	}
	
	response.sendRedirect( "./List.jsp?" + request.getQueryString() );
%>
