package com.ifaru.checkout;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;

import org.apache.struts.action.DynaActionForm;

import com.ifaru.cart.CartItem;
import com.ifaru.cart.IShoppingCart;
import com.ifaru.cart.ShoppingCart;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.framework.IFaruIdentifiableObject;
import com.ifaru.order.Order;
import com.ifaru.order.OrderFactory;
import com.ifaru.order.OrderItem;
import com.ifaru.order.OrderItemFactory;
import com.ifaru.order.OrderNumberFactory;
import com.ifaru.user.Address;
import com.ifaru.user.Customer;
import com.ifaru.util.Logger;
import com.ifaru.util.MailUtil;

public class ChequeHandler extends IFaruIdentifiableObject implements
    PaymentHandler {

  private Logger logger = Logger.getInstance();

  private MailUtil mailUtil = null;
  private final static String ORDER_DETAILS_TOKEN = "{order-details}";
  private final static String GREETING_TOKEN = "{greeting}";
  private String getEmail(String path, IShoppingCart cart, Order order, HttpServletRequest request) throws IOException {
    List emailLines = getList(new File(path));
    StringBuffer email = new StringBuffer();
    Iterator lines = emailLines.iterator();
    while(lines.hasNext()) {
      String line = lines.next().toString();
      if (line.equalsIgnoreCase(GREETING_TOKEN)) {
        email.append(FrameworkConstants.LINE_SEPARATOR).append(
            getGreeting(request));
        
      } else if (line.equalsIgnoreCase(ORDER_DETAILS_TOKEN)) {
        email.append(FrameworkConstants.LINE_SEPARATOR).append(
            new HtmlBuilder().getOrderDetailsTableHtml(cart, order.getOrderNumber()));
        
      } else {
        email.append(!email.equals("") ? FrameworkConstants.LINE_SEPARATOR + line : line);
      }
    }
    return email.toString();
  }

  private String getGreeting(HttpServletRequest request) {
    
    Address billAddr = (Address)request.getSession().getAttribute(FrameworkConstants.BILLING_ADDRESS);
    return new StringBuffer("Dear ")
    .append(billAddr.getFirstName())
    .append(",").toString();
    
    
  }

  private List getList(File template) throws IOException {
    List list = new ArrayList();
    logger.msg(getClass(), "getList", "getting lines from temaplte file: "+template.getAbsolutePath());
    BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(template)));
    String line = null;
    while ((line = reader.readLine()) != null) {
      list.add(line);
    }
    return list;
  }

  public PaymentResponse handlePayment(IShoppingCart cart, ActionForm form, HttpServlet servlet,
      HttpServletRequest request, HttpServletResponse response) {
    // TODO Auto-generated method stub
    ChequePaymentResponse pr = new ChequePaymentResponse();
    try {
      

      String path = servlet.getServletContext().getRealPath(servlet.getInitParameter("chequePaymentEmailTemplate"));
      logger.msg(getClass(),"handlePayment", "cheque payment email template: "+path);
      Order order = OrderFactory.getInstance().getOrder(form, request);
      long orderNumber = order.getOrderNumber();
      pr.setOrder(order);
      String htmlBody = getHtmlBody(cart, path, order, form, request);
      mailUtil.setHtmlBody(htmlBody);
      mailUtil.setSubject("Cheque payment request for order number: "+orderNumber);
      mailUtil.setTo(order.getCustomer().getAddress().getEmail());  
      mailUtil.send();
      pr.setSuccess(true);
      msg("handlePayment", "payment for order :[" +order+"] from Customer: ["+order.getCustomer().getAddress().getEmail()+"] processed successfuly]");
    } catch (IOException e) {
      pr.setException(e);
      pr.setSuccess(false);
      pr.setFailureReason(PaymentResponse.UNDEFINED_IO_ERROR);
      logger.msg(getClass(), "handlePayment", "IOException while handling cheque payment", e);
    } catch (IFaruException e) {
      pr.setException(e);
      pr.setSuccess(false);
      pr.setFailureReason(PaymentResponse.IFARU_INTERNAL_ERROR);
      logger.msg(getClass(), "handlePayment", "IFaruException while handling cheque payment", e);      
    } catch (MessagingException e) {
      pr.setException(e);
      pr.setSuccess(false);
      pr.setFailureReason(PaymentResponse.MAIL_SERVER_ERROR);
    } catch (RuntimeException e) {
      pr.setException(e);
      pr.setSuccess(false);
      pr.setFailureReason(PaymentResponse.IFARU_INTERNAL_ERROR);
      logger.msg(getClass(), "handlePayment", "IFaruException while handling cheque payment", e);            
    }
    return pr;
  }

  private String getHtmlBody(IShoppingCart cart, String path, Order order, ActionForm form, HttpServletRequest request) throws IFaruException, IOException {
    logger.msg(getClass(), "getHtmlBody", "Got servlet root path: "+path);
    
    String email = getEmail(path, cart, order, request);
    return email;
  }

  

  
  public void init(FrameworkFacade facade) throws IFaruException {
    mailUtil = new MailUtil();
    mailUtil.init(facade);
//    mailHost = facade.getServletConfig().getInitParameter(FrameworkConstants.EMAIL_HOST_KEY);

  }
  
//  public static void main(String[] args) throws IOException {
//    ShoppingCart cart = new ShoppingCart();
//    cart.setGrandTotal(12.4);
//    cart.setItemTotal(10.4);
//    cart.setShippingTotal(2);
//    CartItem item = new CartItem();
//    item.setId("647463764");
//    item.setName("Black Musk");
//    item.setSize("12ml");
//    item.setPrice("10.4");
//    item.setQuantity(1);
//    cart.addItem(item);
//    String path="C:/projects/ifaru/email/ChequeEmailTemplate.html";
//    ChequeHandler handler = new ChequeHandler();
//    Order order = new Order();
//    order.setOrderNumber(123456);
//    Customer customer = new Customer();
//    Address address = new Address();
//    address.setBillEmail("gr8buyer@buybuy.com");
//    address.setBillFirstName("John");
//    customer.setAddress(address);
//    order.setCustomer(customer);
//    cart.setInsuranceRequired("1");
//    String html = handler.getEmail(path, cart, order);
//    System.out.println(html);
//  }
}
