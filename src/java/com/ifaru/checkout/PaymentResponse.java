package com.ifaru.checkout;
import com.ifaru.order.Order;
public interface PaymentResponse {
  int BAD_EMAIL_ADDRESS = 1;
  int MAIL_SERVER_ERROR = 2;
  int FILE_IO_ERROR = 3;
  int UNDEFINED_IO_ERROR = 4;  
  int IFARU_INTERNAL_ERROR = 5;
  int PAYPAL_SUCCESSFUL_PAYMENT_EMAIL_NOTIFICATION_FAILURE = 6;  
  
  public boolean isSuccess();
  public int getFailureReason();
  public Exception getException();
  public void setOrder(Order order);
  public Order getOrder();
}
