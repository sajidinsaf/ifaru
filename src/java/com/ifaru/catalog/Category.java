package com.ifaru.catalog;

import java.util.Map;
import java.util.TreeMap;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruIdentifiableObject;

public class Category extends IFaruIdentifiableObject implements Searchable  {
  
  private String subcategories;
  private String keywords;
  private Map subCategories;
  
  /**
   * 
   * @return A comma separated list of subcategory ids.
   */
  public String getSubcategories() {
    return subcategories;
  }

  /**
   * Expects a comma separated list of subcategory ids
   * @param subcategories
   */
  public void setSubcategories(String subcategories) {
    String mn = "setSubcategories(String)";
    msg(mn, new Object[] {"Subcategories: ", subcategories, " set to top level category: ", getName()});
    this.subcategories = subcategories;
  }

  public Map getSubCategories() {
    return subCategories;
  }

  public void addSubCategory(Category cat) {
    String mn = "addSubCategory(Category)";
    if (subCategories == null) {
      subCategories = new TreeMap();
    }
    msg(mn, new Object[]{"adding sub category: ", cat.getName()});
    subCategories.put(cat.getId(), cat);
  }

  public String getKeywords() {
    return keywords;
  }

  public void setKeywords(String keywords) {
    this.keywords = keywords;
  }
  
  public String toString() {
    StringBuffer sb = new StringBuffer(super.toString());
    sb.append(" Keywords: ");
    sb.append(getKeywords());
    sb.append(" Subcategories: ");
    sb.append(getSubcategories());    
    return sb.toString();
  }  
}
