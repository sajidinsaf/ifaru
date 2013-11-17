package com.ifaru.catalog;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.xml.sax.SAXException;

import com.ifaru.framework.IFaruException;
import com.ifaru.framework.MockFrameworkFacade;
import com.ifaru.gallery.Image;

public class CatalogConverter {

  
  public static void main(String args[]) throws IFaruException, IOException, SAXException {
    File file = new File("/Users/sajidinsaf/projects/ifaru/data/catalog/catalog.xml");
    CatalogConverterHelper factory = CatalogConverterHelper.getInstance();
    factory.init(new MockFrameworkFacade());

    CatalogItems catalogItems = factory.getItems(file);
    CatalogItems newCatalog = new CatalogItems();

      newCatalog.setBrands(catalogItems.getBrands());
      newCatalog.setCategories(catalogItems.getCategories());  
      
      List origItems = catalogItems.getItems();
      System.out.println(origItems.size());
      for (int j=0; j<origItems.size(); j++) {
        CatalogItem origItem = (CatalogItem) origItems.get(j);

        List<Size> prices = origItem.getSizes();
        if (prices.size() > 1)
        {
          int counter = 97;
          for (int p=1; p<prices.size(); p++) {
            CatalogItem newItem = new CatalogItem();
            List<Size> newSizes = new ArrayList<Size>();
            
            newSizes.add((Size)prices.get(p));
            newItem.setSizes(newSizes);
            newItem.setAvailable(origItem.isAvailable());
            newItem.setBrandId(origItem.getBrandId());
            newItem.setCategoryIds(origItem.getCategoryIds());
            newItem.setDescription(origItem.getDescription());
            newItem.setGender(origItem.getGender());
            newItem.setId(origItem.getId()+(char)counter++);
            newItem.setImage(origItem.getImage());
            newItem.setInformation(origItem.getInformation());
            newItem.setInformationUrl(origItem.getInformationUrl());
            newItem.setMeasurementUnit(origItem.getMeasurementUnit());
            newItem.setName(origItem.getName());
            newItem.setPriceFieldId(origItem.getPriceFieldId());
            newItem.setQuantityAvailable(origItem.getQuantityAvailable());
            newItem.setStatus(origItem.getStatus());
            newCatalog.addItem(newItem);
            
          }
          for (int p=1; p<prices.size(); p++) {
            prices.remove(p);
          }

        }

        newCatalog.addItem(0, origItem);
      }

      List<String> catalogLines = new ArrayList<String>();
      catalogLines.add("<catalog>");
      catalogLines.add("  <items>");
      
      List<String> itemLines = new ArrayList<String>();
      for (CatalogItem item: newCatalog.getItems())
      {
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
      
      for(Category cat:catalogItems.getCategories()) {
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
      for (Brand cat : catalogItems.getBrands()) {
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
      file = new File("/Users/sajidinsaf/projects/ifaru/data/catalog/catalog.new.xml");
      PrintWriter writer = new PrintWriter(new FileWriter(file));
      for (String line : catalogLines)
      {
        writer.println(line);
      }
      writer.flush();
      writer.close();
      System.out.println(factory.getItems(file).getItems().size());  
  }
    
}
