<%@ page import='java.util.*,ifaru.cart.orders.*,ifaru.cart.users.*,java.sql.*'%><%!


	String getDateBox(String prefix,int nDay,int nMonth,int nYear)
	{
		int i;
		String html = "";
		
		html += "<SELECT name='" + prefix + "_Day'>\r\n";
		for(i=1;i<=31;i++)
		{
			String num = String.valueOf(i);
			if(i==nDay)
				html += "<OPTION SELECTED Value='" + num + "'>" + num + "</OPTION>\r\n";
			else
				html += "<OPTION Value='" + num + "'>" + num + "</OPTION>\r\n";
		}
		html += "</SELECT>\r\n";
		
		html += "<SELECT name='" + prefix + "_Month'>\r\n";
		for(i=1;i<=12;i++)
		{
			String num = String.valueOf(i);
			if(i==nMonth)
				html += "<OPTION SELECTED Value='" + num + "'>" + com.ifaru.util.Date.getMonthName(i) + "</OPTION>\r\n";
			else
				html += "<OPTION Value='" + num + "'>" + com.ifaru.util.Date.getMonthName(i) + "</OPTION>\r\n";
		}
		html += "</SELECT>\r\n";
		
		html += "<SELECT name='" + prefix + "_Year'>\r\n";
		for(i=2003;i<2050;i++)
		{
			String num = String.valueOf(i);
			if(i==nYear)
				html += "<OPTION SELECTED Value='" + num + "'>" + num + "</OPTION>\r\n";
			else
				html += "<OPTION Value='" + num + "'>" + num + "</OPTION>\r\n";
		}
		html += "</SELECT>\r\n";
	
		return html;
	}


%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/ifaru/"));%></jsp:useBean>
<%
	response.addHeader("expires","0");
	User user = (User)session.getAttribute("User");
	if(user == null || (!user.isAdmin()))
	{
		User.adminLogin(request,response);
		return;
	}
	

	long now = System.currentTimeMillis();
	com.ifaru.util.Date dt = new com.ifaru.util.Date(now+86400000);
	
	int nStart = website.getRequestParameter(request,"nStart",0);
	int nSize  = website.getRequestParameter(request,"nSize",2000);
	
	int nOrderState = website.getRequestParameter(request,"nOrderState",3);

	int nEnd_Day = website.getRequestParameter(request,"nEnd_Day",dt.getDay());
	int nEnd_Month = website.getRequestParameter(request,"nEnd_Month",dt.getMonth());
	int nEnd_Year = website.getRequestParameter(request,"nEnd_Year",dt.getYear());
	
	dt = new com.ifaru.util.Date(now-86400000);
	int nStart_Day = website.getRequestParameter(request,"nStart_Day",dt.getDay());
	int nStart_Month = website.getRequestParameter(request,"nStart_Month",dt.getMonth());
	int nStart_Year = website.getRequestParameter(request,"nStart_Year",dt.getYear());
	
	String text;
	text = String.valueOf(nStart_Year);
	text += "-" + String.valueOf(nStart_Month);
	text += "-" + String.valueOf(nStart_Day);
	text += " 00:00:00.00000000";
	Timestamp tsStart = Timestamp.valueOf(text);

	text = String.valueOf(nEnd_Year);
	text += "-" + String.valueOf(nEnd_Month);
	text += "-" + String.valueOf(nEnd_Day);
	text += " 00:00:00.00000000";
	Timestamp tsEnd = Timestamp.valueOf(text);
	
	Vector items = website.orders.getAll(tsStart,tsEnd,nOrderState);
%>
<HTML><HEAD>
<TITLE>Orders of <%=website.shopName%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="/ifaru/Common.css" rel=stylesheet>
<META content="MSHTML 5.50.4134.100" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" onLoad="">
<%@include file='incToolbar.jsp'%>
<TABLE align=center width=759 cellspacing=0 cellpadding=0>
	<TR>
		<TD align=left valign=top>
		
		
			<TABLE width=100% cellpadding=10>
				<TR>
					<TD>
							<!---------   Data Area ------------>

						<TABLE width=100% cellpadding=2 cellspacing=1 class=Data>
							<FORM action="List.jsp" name="OrdersForm">
							<input type=hidden name=nStart value='<%=nStart%>'>
							<input type=hidden name=nSize value='<%=nSize%>'>
							<TR>
								<TD colspan=5>
									Show 
									<SELECT name='nOrderState'>
										<OPTION Value='-1'>All</OPTION>
										<OPTION Value='0'>Payment Pending</OPTION>
										<OPTION Value='1'>Payment Awaited from CreditCard Processor</OPTION>
										<OPTION Value='2'>Credit Card Authorization Failed</OPTION>
										<OPTION Value='3'>Order Under Processing</OPTION>
										<OPTION Value='4'>Order Processed & Shipped</OPTION>
										<OPTION Value='7'>Order Processed & Tracking Updated</OPTION>
										<OPTION Value='5'>Order Rejected</OPTION>
									</SELECT>
								</TD>
							</TR>
							<TR>
								<TD>
									From
								</TD>
								<TD>
									<%=getDateBox("nStart",nStart_Day,nStart_Month,nStart_Year)%>
								</TD>
								<TD>
									To
								</TD>
								<TD>
									<%=getDateBox("nEnd",nEnd_Day,nEnd_Month,nEnd_Year)%>
								</TD>
								<TD>
									<input type=submit class=darksmallbutton value=Show>
								</TD>
							</TR>
						</TABLE>
						<TABLE width=100% cellpadding=2 cellspacing=1 class=Data>
							<TR>
								<TH align=left><input type=checkbox name='nAllID' value='' onclick='doCheck()'></TH>
								<TH align=left>Order ID</TH>
								<TH align=left>User</TH>
								<TH align=left>Date</TH>
								<TH align=right>Amount</TH>
								<TH colspan=2>Status</TH>
								<TH>Remarks</TH>
							</TR>
							<%
								Enumeration enum = items.elements();
								while(enum.hasMoreElements())
								{
									Order order = (Order)enum.nextElement();
									com.ifaru.util.Date date = new com.ifaru.util.Date(order.tsDate);
									%>
										<TR>
											<TD align=left><input type=checkbox name='nID' value='<%=order.nID%>'></TD>
											<TD align=left><%=order.nID%>&nbsp;&nbsp;<A href="javascript:orderDetail(<%=order.nID%>)">Details</A></TD>
											<TD align=left><a href="mailto:<%=order.txtEmailAddress%>"><%=order.txtEmailAddress%></A></TD>
											<TD align=left><%=date.getShortDate()%></TD>
											<TD align=right><%=website.format(order.dblGrandTotal)%> GBP</TD>
											<TD>&nbsp;&nbsp;&nbsp;</TD>
											<TD align=left><%=order.getStatus()%> &nbsp;&nbsp;&nbsp;
											<TD align=right><%=order.txtRemarks==null?"":order.txtRemarks%></TD>
										</TR>
									<%
								}
							%>
							</FORM>
						</TABLE>
						
						
		
						<TABLE class='Data' cellspacing=1 >
							<TR>
								<TD><A href="javascript:editSelected()">Edit Selected</A></TD>
								<TD><A href="javascript:printCSV()">Download All CSV (Office Use)</A></TD>
							</TR>
							<TR>
								<TD><A href="javascript:editTracking()">Tracking Update</A></TD>
								<TD><A href="javascript:print()">Print All (Office Use)</A></TD>
							</TR>
							<TR>
								<TD><A href="javascript:remindPayment()">Send Payment Reminder Selected</A></TD>
								<TD><A href="javascript:printListInfo()">Print All (User Info)</A></TD>
							</TR>
							<TR>
								<TD><A href="javascript:deleteSelected()">Delete Selected</A></TD>
							</TR>
						</TABLE>
						
<SCRIPT LANGUAGE=javascript>
<!--
	document.OrdersForm.nOrderState.value = <%=nOrderState%>

	function doCheck()
	{
		l=document.OrdersForm.nID.length
		for(i=0;i<l;i++)
		{
			document.OrdersForm.nID[i].checked = document.OrdersForm.nAllID.checked
		}
	}
	
	function print()
	{
		document.OrdersForm.action = "./PrintList.jsp";
		document.OrdersForm.submit();
	}
	
	function editSelected()
	{
		document.OrdersForm.action = "./Edit.jsp";
		document.OrdersForm.submit();
	}
	
	function editTracking()
	{
		document.OrdersForm.action = "./EditTracking.jsp";
		document.OrdersForm.submit();
	}
	
	function deleteSelected()
	{
		if(confirm("Are you sure you want to delete selected orders?"))
		{
			document.OrdersForm.action = "./Delete.jsp";
			document.OrdersForm.submit();
		}
	}
	
	function printListInfo()
	{
		document.OrdersForm.action = "./PrintListInfo.jsp";
		document.OrdersForm.submit();
	}
	
	function printCSV()
	{
		document.OrdersForm.action = "./PrintCSV.jsp";
		document.OrdersForm.submit();
	}
	
	function remindPayment()
	{
		document.OrdersForm.action = "./RemindPayment.jsp";
		document.OrdersForm.submit();
	}
	
	function show(start,size)
	{
		document.OrdersForm.action = "./List.jsp";
		document.OrdersForm.nStart.value = start;
		document.OrdersForm.nSize.value = size;
		document.OrdersForm.submit();
	}
//-->
</SCRIPT>
							<!----   End of Data Area ---------->
		
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
<SCRIPT LANGUAGE=javascript>
<!--
	function orderDetail(nID)
	{
		window.open("./OrderDetail.jsp?nID="+nID,"OrderDetail"+nID,"top=50,left=50,width=500,height=400,scrollbars=1,resize=1")
	}
	
	function cancelOrder(nID)
	{
		if(confirm("Are you sure you want to delete order "+nID))
		{
			location.href = "./Delete.jsp?nOrderID=" + nID
		}
	}
//-->
</SCRIPT>
</BODY>
</HTML>
