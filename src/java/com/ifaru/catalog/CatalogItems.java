package com.ifaru.catalog;

import java.util.ArrayList;
import java.util.List;

import com.ifaru.util.Logger;

public class CatalogItems {
  private List<CatalogItem> items;
  private List<Category> categories;
  private List<Brand> brands;
  protected Logger logger = Logger.getInstance();  
  /**
   * @return the items
   */
  public List<CatalogItem> getItems() {
    return items;
  }
  /**
   * @param items the items to set
   */
  public void setItems(List<CatalogItem> items) {
    this.items = items;
  }
  
  /**
   * Add
   * @param attar
   */
  public void addItem(CatalogItem catalogItem) {
    if (items==null) {
      items = new ArrayList(10);
    }
    items.add(catalogItem);
  }  
  
  
  /**
   * Add
   * @param attar
   */
  public void addCategory(Category category) {
    if (categories==null) {
      categories = new ArrayList(10);
    }
    categories.add(category);
  }
  
  public List<Category> getCategories() {
    return categories;
  }
  public void setCategories(List categories) {
    this.categories = categories;
  }
  
  /**
   * Add
   * @param attar
   */
  public void addBrand(Brand brand) {
    String mn="addBrand";
    if (brands==null) {
      brands = new ArrayList(5);
    }
    msg (mn, new Object[]{"Adding brand with id:", brand.getId(), " and name: ",  brand.getName()});    
    brands.add(brand);
  }
  
  public List<Brand> getBrands() {
    return brands;
  }
  public void setBrands(List brands) {
    this.brands = brands;
  }    
  
  protected void entry(String method) {
    logger.entry(getClass(), method);
  }
  
  protected void exit(String method) {
    logger.exit(getClass(), method);
  }
  
  protected void msg(String method, String msg) {
    logger.msg(getClass(), method, msg);
  }
  
  protected void msg(String method, String msg, Exception e) {
    logger.msg(getClass(), method, msg, e);
  }


  protected void msg(String methodName, Object[] msg) {

    msg(methodName, getString(msg));
  }
  
  protected void msg(String methodName, String[] msg, Exception e) {
    
    msg(methodName, getString(msg), e);
  }
  
  /**
   * 
   * @param msg the message array
   * @return Joins all the elements of the array and returns them as a String
   */
  public static String getString(Object[] msg) {
    StringBuffer sb = new StringBuffer();
    if (msg != null) {
      for (int i=0; i<msg.length; i++) {
        sb.append(msg[i]);
      }
    }    
    return sb.toString();
  }
  
  public void addItem(int i, CatalogItem catalogItem) {
    if (items==null) {
      items = new ArrayList(10);
    }
    items.add(i, catalogItem);
    
  }    
}
