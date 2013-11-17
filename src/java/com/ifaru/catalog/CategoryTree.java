package com.ifaru.catalog;

import java.util.Iterator;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;

import com.ifaru.framework.IFaruIdentifiableObject;

/**
 * represents a category tree of iFaru services
 * @author Sajid Insaf
 *
 */
public class CategoryTree extends IFaruIdentifiableObject {

  private Map topLevelCategories;

  public Map getTopLevelCategories() {
    return topLevelCategories;
  }
  
  public void createFromCatalog(CatalogItems items) {
    String mn="createFromCatalog(CatalogItems)";
    if (topLevelCategories == null) {
      topLevelCategories = new TreeMap();
    }
    Iterator allCats = items.getCategories().iterator();
    while (allCats.hasNext()) {
      Category cat = (Category) allCats.next();
      if (cat.getSubcategories() != null && !cat.getSubcategories().trim().equals("")) {
        topLevelCategories.put(cat.getId(), cat);
      }
    }
 
    Iterator topCats = topLevelCategories.values().iterator();
    while (topCats.hasNext()) {
      Category topCat = (Category) topCats.next();
      msg(mn, new Object[]{"Top Level Category: ",topCat.getName(), " has sub categories: ",topCat.getSubcategories()});
      StringTokenizer subCatIds = new StringTokenizer(topCat.getSubcategories(), "-");
      while (subCatIds.hasMoreTokens()) {
        String subCatId = subCatIds.nextToken().trim();
        allCats = items.getCategories().iterator();
        while (allCats.hasNext()) {
          Category subCat = (Category) allCats.next();
          if (subCat.getId().trim().equals(subCatId)) {
            topCat.addSubCategory(subCat);
          }
        }
      }    
    }
  }
}
