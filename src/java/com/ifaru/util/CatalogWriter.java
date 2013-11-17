package com.ifaru.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.ifaru.catalog.Brand;
import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.CatalogItems;
import com.ifaru.catalog.Category;
import com.ifaru.catalog.Information;
import com.ifaru.catalog.Size;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.gallery.Image;

public class CatalogWriter {
  
  private CatalogWriter(FrameworkFacade facade) {
    
  }
  
  public static CatalogWriter getInstance(FrameworkFacade facade) {
    return new CatalogWriter(facade);
  }
  
  public void writeCatalog(CatalogItems catalog, File outputFile) throws IOException {
    List<String> catalogLines = new ArrayList<String>();
    catalogLines.add("<catalog>");
    catalogLines.add("  <items>");
    
    List<String> itemLines = new ArrayList<String>();
    for (CatalogItem item: catalog.getItems()) {
      StringBuilder itemLine = new StringBuilder("    <item id=\"");
      itemLine.append(item.getId()).append("\" ");
      itemLine.append("name=\"").append(item.getName()).append("\" ");
      itemLine.append("description=\"").append(item.getDescription()).append("\" ");
      itemLine.append("categoryIds=\"").append(item.getCategoryIds()).append("\" ");
      itemLine.append("brandId=\"").append(item.getBrandId()).append("\" ");
      itemLine.append("status=\"").append(item.getStatus()).append("\" ");
      itemLine.append("gender=\"").append(item.getGender()).append("\" ");
      itemLine.append("measurementUnit=\"").append(item.getMeasurementUnit()).append("\" ");
      itemLine.append("quantityAvailable=\"").append(item.getQuantityAvailable()).append("\" >");
      
      Size size = (Size)item.getSizes().get(0);
      itemLine.append(System.getProperty("line.separator")).append("      <size size=\"").append(size.getSize()).append("\" ");
      itemLine.append("stock=\"").append(size.getStock()).append("\" ");
      itemLine.append("salePrice=\"").append(size.getSalePrice()).append("\" ");
      itemLine.append("measurementUnit=\"").append(size.getMeasurementUnit()).append("\" />");
      
      Information info = item.getInformation();
      itemLine.append(System.getProperty("line.separator")).append("      <information url=\"").append(info.getUrl()).append("\" />");
      
      Image img = item.getImage();
      itemLine.append(System.getProperty("line.separator")).append("      <image src=\"").append(info.getUrl()).append("\" ").append("thumbnail=\"").append(img.getThumbnail()).append("\" />");

      itemLine.append(System.getProperty("line.separator")).append("    </item>");
      itemLines.add(itemLine.toString());
    }
    System.out.println(itemLines.size());
    Collections.sort(itemLines);
    catalogLines.addAll(itemLines);
    catalogLines.add("  </items>");
    
    catalogLines.add("  <categories>");
    
    for(Category cat:catalog.getCategories()) {
      StringBuffer catLine = new StringBuffer("    <category id=\"");
      catLine.append(cat.getId()).append("\" name=\"");
      catLine.append(cat.getName()).append("\" subcategories=\"");
      catLine.append(cat.getSubcategories()).append("\" >");
      catLine.append(System.getProperty("line.separator")).append("      <keywords keywords=\"");
      catLine.append(cat.getKeywords()).append("\" />");
      catLine.append(System.getProperty("line.separator")).append("    </category>");
      catalogLines.add(catLine.toString());
    }  
    catalogLines.add("  </categories>"); 
    catalogLines.add("  <brands>"); 
    for (Brand cat : catalog.getBrands()) {
      StringBuffer catLine = new StringBuffer("    <brand id=\"");
      catLine.append(cat.getId()).append("\" name=\"");
      catLine.append(cat.getName()).append("\" >");
      catLine.append(System.getProperty("line.separator")).append("      <keywords keywords=\"");
      catLine.append(cat.getKeywords()).append("\" />");
      catLine.append(System.getProperty("line.separator")).append("    </brand>");
      catalogLines.add(catLine.toString());
    }
    catalogLines.add("  </brands>"); 
    catalogLines.add("</catalog>"); 
    PrintWriter writer = new PrintWriter(new FileWriter(outputFile));
    for (String line : catalogLines) {
      writer.println(line);
    }
    writer.flush();
    writer.close();
  }

}
