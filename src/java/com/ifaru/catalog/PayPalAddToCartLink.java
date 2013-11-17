package com.ifaru.catalog;



public class PayPalAddToCartLink implements AddToCartLink {

  private final static String DEFAULT_ADD = "1";
  private final static String DEFAULT_CMD = "_cart";
  private final static String DEFAULT_LC = "GB";
  private final static String DEFAULT_BN = "PP-ShopCartBF";
  private final static String DEFAULT_NO_NOTE = "1";
  private final static String DEFAULT_NO_SHIPPING = "0";
  private final static String DEFAULT_CURRENCY_CODE = "GBP";
  private final static String DEFAULT_BUSINESS = "contact@ifaru.com";
  private final static String DEFAULT_ADD_TO_CART_IMAGE_URL = "https://www.paypal.com/en_GB/i/btn/x-click-but22.gif";
  
  private String business, add, cmd, item_name, item_number, amount, no_shipping, no_note, currency_code, lc, bn, addToCartImageUrl;

  public String getBusiness() {
    return business != null && !business.trim().equals("") ? business : DEFAULT_BUSINESS;
  }

  public void setBusiness(String business) {
    this.business = business;
  }

  public String getItem_name() {
    return item_name;
  }

  public void setItem_name(String item_name) {
    this.item_name = item_name;
  }

  public String getItem_number() {
    return item_number;
  }

  public void setItem_number(String item_number) {
    this.item_number = item_number;
  }

  public String getAmount() {
    return amount;
  }

  public void setAmount(String amount) {
    this.amount = amount;
  }

  public String getNo_shipping() {
    return no_shipping != null && !no_shipping.trim().equals("") ? no_shipping : DEFAULT_NO_SHIPPING;    
  }

  public void setNo_shipping(String no_shipping) {
    this.no_shipping = no_shipping;
  }

  public String getNo_note() {
    return no_note != null && !no_note.trim().equals("") ? no_note : DEFAULT_NO_NOTE;
  }

  public void setNo_note(String no_note) {
    this.no_note = no_note;
  }

  public String getCurrency_code() {
    return currency_code != null && !currency_code.trim().equals("") ? currency_code : DEFAULT_CURRENCY_CODE;
  }

  public void setCurrency_code(String currency_code) {
    this.currency_code = currency_code;
  }

  public String getLc() {
    return lc != null && !lc.trim().equals("") ? lc : DEFAULT_LC;
  }

  public void setLc(String lc) {
    this.lc = lc;
  }

  public String getBn() {
    return bn != null && !bn.trim().equals("") ? bn : DEFAULT_BN;
  }

  public void setBn(String bn) {
    this.bn = bn;
  }

  public String getAdd() {
    return add != null && !add.trim().equals("") ? add : DEFAULT_ADD;
  }

  public void setAdd(String add) {
    this.add = add;
  }

  public String getCmd() {
    return cmd != null && !cmd.trim().equals("") ? cmd : DEFAULT_CMD;
  }

  public void setCmd(String cmd) {
    this.cmd = cmd;
  } 
  
  public String getLinkHtml() {
    String hidden = "<input type=\"hidden\"";
    StringBuffer sb = new StringBuffer();
    sb.append("<form target=\"paypal\" action=\"https://www.paypal.com/cgi-bin/webscr\" method=\"post\">");
    sb.append("<input type=\"image\" src=\"");
    sb.append(getAddToCartImageUrl());
    sb.append("\" border=\"0\" name=\"submit\" alt=\"Add to Cart\">");
    sb.append("<img alt=\"\" border=\"0\" src=\"https://www.paypal.com/en_GB/i/scr/pixel.gif\" width=\"1\" height=\"1\">");
    sb.append(hidden); 
    sb.append(" name=\"add\" value=\"");
    sb.append(getAdd());
    sb.append("\">");
    sb.append(hidden);
    sb.append(" name=\"cmd\" value=\"");
    sb.append(getCmd());
    sb.append("\">");
    sb.append(hidden); 
    sb.append(" name=\"business\" value=\"");
    sb.append(getBusiness());
    sb.append("\">");
    sb.append(hidden);
    sb.append(" name=\"item_name\" value=\"");
    sb.append(getItem_name());
    sb.append("\">");
    sb.append(hidden);
    sb.append(" name=\"item_number\" value=\"");
    sb.append(getItem_number());
    sb.append("\">");
    sb.append(hidden);
    sb.append(" name=\"amount\" value=\"");
    sb.append(getAmount());
    sb.append("\">");
    sb.append(hidden);
    sb.append(" name=\"no_shipping\" value=\"");
    sb.append(getNo_shipping());
    sb.append("\">");
    sb.append(hidden);
    sb.append(" name=\"no_note\" value=\"");
    sb.append(getNo_note());
    sb.append("\">");
    sb.append(hidden);
    sb.append(" name=\"currency_code\" value=\"");
    sb.append(getCurrency_code());
    sb.append("\">");
    sb.append(hidden);
    sb.append(" name=\"lc\" value=\"");
    sb.append(getLc());
    sb.append("\">");
    sb.append(hidden);
    sb.append(" name=\"bn\" value=\"");
    sb.append(getBn());
    sb.append("\">");

    sb.append("</form>");
    return sb.toString();
  }

  public String getAddToCartImageUrl() {
    return addToCartImageUrl != null && !addToCartImageUrl.trim().equals("") ? addToCartImageUrl : DEFAULT_ADD_TO_CART_IMAGE_URL;
  }

  public void setAddToCartImageUrl(String addToCartImageUrl) {
    this.addToCartImageUrl = addToCartImageUrl;
  }

  public static void main(String args[]) {
    PayPalAddToCartLink link = new PayPalAddToCartLink();
    link.setAmount("3.99");
    link.setItem_name("Black Musk");
    link.setItem_number("283277832");
    System.out.println(link.getLinkHtml());
  }
}


//<form target="paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
//<input type="image" src="https://www.paypal.com/en_GB/i/btn/x-click-but22.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online.">
//<img alt="" border="0" src="https://www.paypal.com/en_GB/i/scr/pixel.gif" width="1" height="1">
//<input type="hidden" name="add" value="1">
//<input type="hidden" name="cmd" value="_cart">
//<input type="hidden" name="business" value="contact@ifaru.com">
//<input type="hidden" name="item_name" value="3ml Black Musk Arabian Attar / Perfume Oil Alcohol Free">
//<input type="hidden" name="item_number" value="if0000001">
//<input type="hidden" name="amount" value="3.85">
//<input type="hidden" name="no_shipping" value="0">
//<input type="hidden" name="no_note" value="1">
//<input type="hidden" name="currency_code" value="GBP">
//<input type="hidden" name="lc" value="GB">
//<input type="hidden" name="bn" value="PP-ShopCartBF">
//
//</form>