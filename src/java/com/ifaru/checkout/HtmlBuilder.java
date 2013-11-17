package com.ifaru.checkout;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;

import com.ifaru.cart.CartItem;
import com.ifaru.cart.IShoppingCart;

public class HtmlBuilder {
  
  private final static String CART_SUMMARRY_ROW = "padding:2 2 2 2;background-color: #FFFFCC; font-family: Arial; font-size: 12px;font-weight:normal";
  private final static String CART_TABLE = "width:50%;border: thin solid darkgreen;FONT-SIZE: 12px;FONT-WEIGHT: normal;FONT-FAMILY: Arial;VALIGN=CENTER;";  
  private final static String CART_TABLE_HEADER = "padding:2 2 2 2;background-color: #FFFFB5;font-family: Arial;font-size: 12px;font-weight:normal;color:#333333;";  
  

  public String constructPaypalUrl(IShoppingCart cart, ActionForm form,
      HttpServletRequest request) {
    StringBuffer url = new StringBuffer("https://www.paypal.com/cgi-bin/webscr?");
    url.append("cmd=_cart&upload=1&business=contact@ifaru.com&currency_code=GBP");
    url.append("&return=http://www.ifaru.com&shopping_url=http://www.ifaru.com/catalog/ItemList.do");
    url.append("&cancel_return=http://www.ifaru.com"); 
    CartItem[] items = cart.getCartItems();
    for (int i=0; i<items.length;i++) {
      CartItem item = items[i];
      url.append("&item_name_").append(i+1).append("=").append(item.getName()).append(" ").append(item.getSize());
      url.append("&amount_").append(i+1).append("=").append(item.getPrice());
      url.append("&quantity_").append(i+1).append("=").append(item.getQuantity());
      url.append("&shipping__").append(i+1).append("=").append(item.getShippingPriceAsCurrency());
    }
    // add the insurance cost as an item
    if (cart.isInsuranceRequired()) {
      url.append("&item_name_").append(items.length+1).append("=").append("Postal Insurance");    
      url.append("&amount_").append(items.length+1).append("=").append(cart.getShippingInsuranceAsCurrency());
      url.append("&quantity_").append(items.length+1).append("=").append(1);                           
    }
    return url.toString();
  }  

  
  public String getOrderDetailsTableHtml(IShoppingCart cart, long orderNumber) {
    StringBuffer sb = new StringBuffer("");
    sb.append("<TABLE style=\""+CART_TABLE+"\" cellspacing=\"1\" cellpadding=\"2\">").append(
    "<TR style=\"background-color: #DDDDDD; color:#333333\">").append(
      "<TH>Order Number</TH><TH>"+orderNumber+"</TH></TR></TABLE>").append(
    "<TABLE style=\""+CART_TABLE+"\" cellspacing=\"1\" cellpadding=\"2\" border=\"1\">").append(
    "<TR style=\"background-color: #FFFFCC; color:#333333\">").append(
      "<TH>Product</TH><TH>Price</TH><TH>Quantity</TH><TH>Total Price</TH></TR>");
     Iterator items = cart.getItems().values().iterator();
     int i=0;
     while (items.hasNext()) {
       CartItem item = (CartItem)items.next();
       String trclass = i%2==0 ? "#FFFFFF" : "#EEEEEE";
       sb.append("<TR style=\"background-color:"+trclass+";padding:2 2 2 2\">").append(
       "<TD valign=\"top\"><STRONG>"+item.getName()+"</STRONG>&nbsp;"+item.getSize()+"</TD>").append(
       "<TD valign=\"top\" align=\"right\">&pound;"+item.getPriceAsCurrency()+"</TD>").append(
       "<TD valign=\"top\" align=\"right\">"+item.getQuantity()+"</TD>").append(
       "<TD valign=\"top\" align=\"right\">&pound;"+item.getTotalPriceAsCurrency()+"</TD>").append(             
       "</TR>");
     }
     sb.append("</TABLE><BR> <TABLE style=\""+CART_TABLE+"\" cellspacing=\"1\" width=\"80%\"> <TR style=\""+CART_TABLE_HEADER+"\">").append(
     "<TH colspan=\"2\">Order Total</TH> <TH colspan=\"1\" align=\"right\">British Pounds</TH></TR>").append(
     "<TR> <TD style=\""+CART_SUMMARRY_ROW+"\"/><TD style=\""+CART_SUMMARRY_ROW+"\" align=right>Total Amount</TD>").append(
     "<TD style=\""+CART_SUMMARRY_ROW+"\" align=right>&pound;"+cart.getItemTotalAsCurrency()+"</TD></TR>").append(
     "<TR><TD style=\""+CART_SUMMARRY_ROW+"\"/><TD style=\""+CART_SUMMARRY_ROW+"\" align=\"right\">Shipping Charges</TD>").append(
     "<TD style=\""+CART_SUMMARRY_ROW+"\" align=\"right\">&pound;"+cart.getShippingTotalAsCurrency()+"</TD></TR>");
     if (cart.isInsuranceRequired()) {
       sb.append( "<TR><TD style=\""+CART_SUMMARRY_ROW+"\"/><TD style=\""+CART_SUMMARRY_ROW+"\" align=\"right\">Postal Insurance</TD>").append(
           "<TD style=\""+CART_SUMMARRY_ROW+"\" align=\"right\">&pound;"+cart.getShippingInsuranceAsCurrency()+"</TD></TR>"
       );
     }
     sb.append(
     "<TR><TD style=\""+CART_SUMMARRY_ROW+"\"/><TD style=\""+CART_SUMMARRY_ROW+"\" align=\"right\">Grand Total</TD>").append(
     "<TD style=\""+CART_SUMMARRY_ROW+"\" align=right>&pound;<STRONG>"+cart.getGrandTotalAsCurrency()+"</STRONG></TD></TR></TABLE>");    
    return sb.toString();
  }  
  
}
