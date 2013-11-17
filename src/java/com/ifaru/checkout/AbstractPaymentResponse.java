package com.ifaru.checkout;

import com.ifaru.order.Order;

public abstract class AbstractPaymentResponse implements PaymentResponse {

  private boolean success;
  private int failureReason;
  private Exception exception;
  private Order order;
  public int getFailureReason() {
    return failureReason;
  }

  public boolean isSuccess() {
    return success;
  }

  public void setSuccess(boolean success) {
    this.success = success;
  }

  public void setFailureReason(int failureReason) {
    this.failureReason = failureReason;
  }

  public Exception getException() {
    return exception;
  }

  public void setException(Exception exception) {
    this.exception = exception;
  }

  public Order getOrder() {
    // TODO Auto-generated method stub
    return order;
  }

  public void setOrder(Order order) {
    this.order = order;
    
  }

}
