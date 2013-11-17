<%@ page import='java.util.*,ifaru.cart.orders.*,ifaru.cart.products.*,ifaru.cart.users.*,java.sql.*'%>
<%
	response.addHeader("expires","0");
	User user = (User)session.getAttribute("User");
	if(user == null || (!user.isAdmin()))
	{
		User.adminLogin(request,response);
		return;
	}
	
%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/ifaru/"));%></jsp:useBean>

<%
	int nID = website.getRequestParameter(request,"nID",0);
	
	Order order = website.orders.get(nID);
	
	String Message = null;
	
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		order.nOrderState = website.getRequestParameter(request,"nOrderState",0);
		order.txtRemarks = request.getParameter("txtRemarks");
		order.txtTracking = request.getParameter("txtTracking");
		Message = website.orders.edit(order,website.users);
		if(Message==null)
			Message = "Order's State Successfully Changed";
	}
	
	
%>
<HTML><HEAD><TITLE>Order Details of OrderID <%=order.nID%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="/ifaru/Common.css" rel=stylesheet>
<META content="MSHTML 5.50.4134.100" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" onLoad="">
<TABLE width=100% cellpadding=10>
	<TR>
		<TD>
				<!---------   Data Area ------------>
							
							<!---------   Order Details  ------------>
							<%
								if(order.size()>0)
								{
									com.ifaru.util.Date date = null;
									if(order.tsDate!=null)
										date = new com.ifaru.util.Date(order.tsDate);
									else
										date = new com.ifaru.util.Date();
							%>
							<table width=100% class=Data cellspacing=1 >
								<%if(Message!=null){%>
									<tr>
										<td><font color=red><STRONG><%=Message%></STRONG></font></td>
									</tr>
								<%}%>
								<tr>
									<th>Order Details of <A href="mailto:<%=order.txtEmailAddress%>"><%=order.txtEmailAddress%></a> [<%=date.getLongDate()%>]</th>
								</tr>
							</table>
							<table class=data width=100% cellspacing=1 >
								<TR>
									<TH>Drug</TH>
									<TH>Packs</TH>
									<TH>Pills</TH>
									<TH>Price</TH>
								</TR>
								
								<%
									Enumeration enum = order.orderedItems.elements();
									while(enum.hasMoreElements())
									{
										OrderedItem oi = (OrderedItem) enum.nextElement();
										Product product = website.products.get(oi.nProductID);
										%>
										<tr>
											<TD width=75 valign=top><b><%=product.txtName%></b><br><%=product.txtWeight%></TD>
											<TD valign=top><%=oi.nQuantity%></TD>
											<TD valign=top align=right><%=(int)product.dblQtyPerPack%> pill(s) Per Pack <BR>
												<STRONG>Total <%=((int)product.dblQtyPerPack)*oi.nQuantity%> pills</STRONG>
											</TD>
											<TD valign=top align=right><%=website.format(oi.dblPrice)%> GBP Per Pack <BR>
												<STRONG>Total : <%=website.format(oi.dblPrice*oi.nQuantity)%> GBP</STRONG>
											</TD>
										</tr>
										<tr>
											<td colspan=4>
												<STRONG><U>Reason:</U></STRONG><BR>
												<%=oi.txtReason%>
												<hr size=1>
											</td>
										</tr>
										<%
									}
								%>
								
							</table>
							<br>
							<br>
							<table cellspacing=1 cellpadding=2 width=100% class=Data>
								
								<tr>
									<th colspan=2>Final Order</th>
								</tr>
								
								<tr>
									<td align=right><STRONG>Total Amount</STRONG></td>
									<td width="130" align=right><%=website.format(order.dblTotal)%> GBP</td>
								</tr>
												
								<tr>
									<td align=right><STRONG>Shipping Charges</STRONG></td>
									<td align=right><%=website.format(order.dblShippingCharges)%> GBP </td>
								</tr>
								
								<tr>
									<th align=right>Grand Total</th>
									<th align=right><%=website.format(order.dblGrandTotal) %> GBP</th>
								</tr>
								
							</table>
							<BR>
							<BR>
							
							<TABLE width=100% border=0 cellspacing=1 class=Data>
								<TR>
									<TH>  Order Status </TH>
								</TR>
								<TR>
									<TD> <%=order.getStatus()%></TD>
								</TR>
								<%if(order.txtRemarks!=null){%>
								<TR>
									<TD> <%=order.txtRemarks%></TD>
								</TR>
								<%}%>
							</TABLE>

							<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=1 class=data>
							<form action="OrderDetail.jsp" method=post name=OrdersForm>
							<input type=hidden name=nID value='<%=order.nID%>'>
							<TR>
								<TH>Modify the Order State</TH>
							</TR>
							<TR>
								<TD>
									<SELECT name='nOrderState'>
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
									<TEXTAREA name=txtRemarks cols=33 rows=4><%=order.txtRemarks==null?"":order.txtRemarks%></TEXTAREA>
								</TD>
							</TR>
							<TR>
								<TD><input type=submit value="Change" id=submit1 name=submit1></TD>
							</TR>
							</form>
						</TABLE>
<SCRIPT LANGUAGE=javascript>
<!--
	document.OrdersForm.nOrderState.value = <%=order.nOrderState%>
//-->
</SCRIPT>
							

							
							<%
			
								}
							%>
							
							<!--- End Of Order Details   ---->
							
				<!---------   End of Data Area ------------>
		</TD>
	</TR>
</TABLE>
</BODY></HTML>
