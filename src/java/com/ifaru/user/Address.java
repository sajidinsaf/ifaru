package com.ifaru.user;

import org.apache.struts.action.ActionForm;

public class Address extends ActionForm {

  public final static String BILLING = "0";
  public final static String SHIPPING = "1";
  /**
   * 
   */
  private static final long serialVersionUID = 2166376788898701833L;
  private String title, firstName, lastName, addressLine1, addressLine2, addressLine3, city, county, country, postcode, email, homePhone, workPhone, mobilePhone;
  private String type = "-";
  private String shipToBill;
  
  public String getShipToBill() {
    return shipToBill;
  }
  public void setShipToBill(String shipToBill) {
    this.shipToBill = shipToBill;
  }
  public static long getSerialVersionUID() {
    return serialVersionUID;
  }
  public String getTitle() {
    return title;
  }
  public String getFirstName() {
    return firstName;
  }
  public String getLastName() {
    return lastName;
  }
  public String getAddressLine1() {
    return addressLine1;
  }
  public String getAddressLine2() {
    return addressLine2;
  }
  public String getAddressLine3() {
    return addressLine3;
  }
  public String getCity() {
    return city;
  }
  public String getCounty() {
    return county;
  }
  public String getCountry() {
    return country;
  }
  public String getPostcode() {
    return postcode;
  }
  public String getEmail() {
    return email;
  }
  public String getHomePhone() {
    return homePhone;
  }
  public String getWorkPhone() {
    return workPhone;
  }
  public String getMobilePhone() {
    return mobilePhone;
  }
  public String getType() {
    return type;
  }
  public void setType(String type) {
    this.type = type;
  }

  public void setTitle(String title) {
    this.title = title;
  }
  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }
  public void setLastName(String lastName) {
    this.lastName = lastName;
  }
  public void setAddressLine1(String addressLine1) {
    this.addressLine1 = addressLine1;
  }
  public void setAddressLine2(String addressLine2) {
    this.addressLine2 = addressLine2;
  }
  public void setAddressLine3(String addressLine3) {
    this.addressLine3 = addressLine3;
  }
  public void setCity(String city) {
    this.city = city;
  }
  public void setCounty(String county) {
    this.county = county;
  }
  public void setCountry(String country) {
    this.country = country;
  }
  public void setPostcode(String postcode) {
    this.postcode = postcode;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public void setHomePhone(String homePhone) {
    this.homePhone = homePhone;
  }
  public void setWorkPhone(String workPhone) {
    this.workPhone = workPhone;
  }
  public void setMobilePhone(String mobilePhone) {
    this.mobilePhone = mobilePhone;
  }

}
