package com.ifaru.catalog;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruIdentifiableObject;
import com.ifaru.gallery.Image;
import com.ifaru.measurement.MeasurementUnit;

public class CatalogItem extends IFaruIdentifiableObject implements Searchable  {
  
  private String name;
  private String description;
  private String categoryIds;  
  private List sizes = new ArrayList();
  private Information information;
  private String id;
  private Image image;
  private String gender;
  private String brandId;
  private String priceFieldId;
  private String status;
  private boolean available;
  private String informationUrl;
  private String measurementUnit;
  private String quantityAvailable;  
  public static final String MEASUREMENT_UNIT_NAME_MLS = "ml";
  public static final String MEASUREMENT_UNIT_NAME_GRAMS = "gms";
  public static final String MEASUREMENT_UNIT_NAME_UNITS = "unit";
  
  /**
   * @return the grades
   */
  public List getSizes() {
    return sizes;
  }
  /**
   * @param grades the grades to set
   */
  public void setSizes(List prices) {
    this.sizes = prices;
  }
  /**
   * @return the information
   */
  public Information getInformation() {
    return information;
  }
  /**
   * @param information the information to set
   */
  public void setInformation(Information information) {
    this.information = information;
  }
  
  public void addSize(Size size) {
    sizes.add(size);
  }
  /**
   * @return the name
   */
  public String getName() {
    return name;
  }
  /**
   * @param name the name to set
   */
  public void setName(String name) {
    this.name = name; 
  }
  public String getCategoryIds() {
    return categoryIds;
  }
  public void setCategoryIds(String categoryId) {
    this.categoryIds = categoryId;
  }
  /**
   * @return the id
   */
  public String getId() {
    return id;
  }

  /**
   * @param id the id to set
   */
  public void setId(String id) {
    this.id = id;
  }

  /**
   * @return the image
   */
  public Image getImage() {
    return image;
  }
  /**
   * @param image the image to set
   */
  public void setImage(Image image) {
    this.image = image;
  }
  /**
   * @return the gender
   */
  public String getGender() {
    return gender;
  }
  /**
   * @param gender the gender to set
   */
  public void setGender(String gender) {
    this.gender = gender;
  }
  public String getDescription() {
    return description;
  }
  public void setDescription(String description) {
    this.description = description;
  }
  public String getBrandId() {
    return brandId;
  }
  public void setBrandId(String brand) {
    this.brandId = brand;
  }
  
  public String getPriceFieldId() {
    return getId() + "_PriceField";
  }
  
  public void setPriceFieldId(String priceFieldId) {
    this.priceFieldId = priceFieldId;
  }
  
  public Size getSize(String aSize) {
    Iterator iter = sizes.iterator();
    aSize = aSize != null ? aSize : "";
    while (iter.hasNext()) {
      Size size = (Size) iter.next();
      if (size.getSize().trim().toLowerCase().equals(aSize.trim().toLowerCase())) {
        return size;
      }
    }
    return null;
  }
  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    if (status != null && status.equalsIgnoreCase(FrameworkConstants.ITEM_AVAILABLE)) {
      available=true;
    }
    this.status = status;
  }

  public boolean isAvailable() {
    return available;
  }

  public void setAvailable(boolean available) {
    this.available = available;
  }
      
  public String toString() {
    StringBuffer ci = new StringBuffer(super.toString());
    ci.append(" Brand: ");
    ci.append(getBrandId());
    ci.append(" Category Ids: ");
    ci.append(getCategoryIds());     
    ci.append(" Description: ");
    ci.append(getDescription());    
    ci.append(" Gender: ");
    ci.append(getGender());   
    ci.append(" Status: ");
    ci.append(getStatus());    
    ci.append(" Available: ");
    ci.append(isAvailable());        
    ci.append(getImage());    
    ci.append(getInformation()); 
 
    // Do not add priceFieldId to this method. 
    // It breaks the jsp because the id gets set to null
    return ci.toString();
  }
  
  public String getKeywords() {
    return getName() + FrameworkConstants.KEYWORD_SEPARATOR + getDescription();
  }
  
  public String getInformationUrl() {
    // /catalog/GetItem.do?itemPriceFieldId="",itemInfoUrl=""
    if (informationUrl == null) {
      StringBuffer url = new StringBuffer(FrameworkConstants.INFO_URL_START);
      url.append(FrameworkConstants.ITEM_HTML_INFO_URL_PARAM_NAME).append("=").append(getInformation().getUrl());
      url.append("&");
      url.append(FrameworkConstants.ITEM_PRICEFIELD_ID_PARAM_NAME).append("=").append(getPriceFieldId());
      setInformationUrl(url.toString());
    }
    return informationUrl;
  }
  
  public void setInformationUrl(String informationUrl) {
    this.informationUrl = informationUrl;
  }
  
  public String getMeasurementUnit() {
    return measurementUnit;
  }
  
  public void setMeasurementUnit(String measurementUnit) {
    this.measurementUnit = measurementUnit;
  }  
  
  public String getDisplayMeasurementUnit() {
    String mu = getMeasurementUnit() == null || getMeasurementUnit().equalsIgnoreCase(MEASUREMENT_UNIT_NAME_UNITS)? "" 
               : getMeasurementUnit().toLowerCase();
    return mu;
  }
  
  public String getQuantityAvailable() {
    return quantityAvailable;
  }
  
  public void setQuantityAvailable(String quantityAvailable) {
    this.quantityAvailable = quantityAvailable;
  }
  
//  public int hashCode() {
//    return COMMON_HASHCODE;
//  }
//  
//  public boolean equals(Object obj) {
//    if (obj instanceof CatalogItem) {
//      CatalogItem c = (CatalogItem) obj;
//      if (same(c.getName(), getName()) 
//          && same(c.getInformation().getUrl(), getInformation().getUrl()) 
//          && same(c.getBrandId(), getBrandId()) 
//          && same(c.getCategoryIds(), getCategoryIds())
//          && same(c.getMeasurementUnit() ,getMeasurementUnit())
//          && same(c.getGender(), getGender())
//          && same(c.getImage(), getImage())) {
//        return true;
//      }
//    }
//    return false;
//  }
  

}
