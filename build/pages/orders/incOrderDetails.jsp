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
								<tr>
									<th>Order Details [<%=date.getLongDate()%>]</th>
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
										Product product = products.get(oi.nProductID);
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
									<td align=right><%=website.format(order.dblTotal)%> GBP</td>
								</tr>
							
								<%if(order.dblShippingCharges>0){%>
								<tr>
									<td align=right><STRONG>Shipping Charges</STRONG></td>
									<td align=right><%=website.format(order.dblShippingCharges)%> GBP </td>
								</tr>
								<%}%>
								
								<tr>
									<th align=right>Grand Total</th>
									<th align=right><%=website.format(order.dblGrandTotal) %> GBP</th>
								</tr>


							</table>
							<BR>
							<BR>
							<%
			
								}
							%>
							
							<!--- End Of Order Details   ---->
