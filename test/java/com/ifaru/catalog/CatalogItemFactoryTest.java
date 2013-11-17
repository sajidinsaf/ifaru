package com.ifaru.catalog;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import org.xml.sax.SAXException;

import com.ifaru.actions.admin.UpdateCatalogAction;
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.IFaruException;
import com.ifaru.framework.MockFrameworkFacade;
import com.ifaru.gallery.Image;

public class CatalogItemFactoryTest {

  
  public static void main(String args[]) throws IFaruException {
//    File file = new File("C:/projects/ifaru/data/catalog/catalog.xml");
//    CatalogItemFactory factory = CatalogItemFactory.getInstance();
//    factory.init(new MockFrameworkFacade());
//    try {
//      CatalogItems catalogItems = factory.getItems(file);
//        List frags = catalogItems.getItems();
//        System.out.println("Number of Items: "+ frags.size());
//        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//        System.out.println("");                
//
//        for (int j=0; j<frags.size(); j++) {
//          CatalogItem frag = (CatalogItem) frags.get(j);
//          System.out.println(frag);   
//          System.out.println("===================================");        
//          List prices = frag.getSizes();
//          for (int p=0; p<prices.size(); p++) {
//            Size size = (Size)prices.get(p);
//            System.out.print(size);                     
//            System.out.println(" Quantity Available: "+size.getQuantityAvailable()); 
//            System.out.println("");
//          }
//          System.out.println("===================================");
//          
//          Information info = frag.getInformation();
//          if (info != null) {
//              System.out.println("Information URL: "+info.getUrl());
//          } else {
//            System.out.println("No information available");
//          }
//          
//          Image image = frag.getImage();
//          if (image != null) {
//            System.out.println("Image Source: "+image.getSrc());
//            System.out.println("Image Thumb: "+image.getThumbnail());
//          }
//          
//        }
//        System.out.println("===============BRANDS=====================");
//        Iterator brands = catalogItems.getBrands().iterator();
//        while(brands.hasNext()) {
//          System.out.println(brands.next());
//        }
//        System.out.println("=================CATEGORIES===================");
//        Iterator categories = catalogItems.getCategories().iterator();
//        while(categories.hasNext()) {
//          System.out.println(categories.next());
//        }        
//    } catch (IOException e) {
//      e.printStackTrace();
//    } catch (SAXException e) {
//      e.printStackTrace();
//    }
    GregorianCalendar today = new GregorianCalendar();
    StringBuilder date = new StringBuilder();
    date.append(UpdateCatalogAction.padLeft((today.get(GregorianCalendar.DAY_OF_MONTH)), FrameworkConstants.PAD_CHAR_0,2));
    date.append(UpdateCatalogAction.padLeft((today.get(GregorianCalendar.MONTH)+1), FrameworkConstants.PAD_CHAR_0,2));
    date.append(today.get(GregorianCalendar.YEAR));
    date.append(UpdateCatalogAction.getHourOfTheDay(today.get(GregorianCalendar.HOUR), today.get(GregorianCalendar.AM_PM)));
    date.append(UpdateCatalogAction.padLeft((today.get(GregorianCalendar.MINUTE)), FrameworkConstants.PAD_CHAR_0,2));
    date.append(UpdateCatalogAction.padLeft((today.get(GregorianCalendar.SECOND)), FrameworkConstants.PAD_CHAR_0,2));
    System.out.println(date);
    
    for (int i=40;i<150;i++) {
      System.out.println(i + "=" + (char)i);
    }
  }
    
}
