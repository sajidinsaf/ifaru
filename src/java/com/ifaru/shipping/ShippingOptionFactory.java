package com.ifaru.shipping;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import com.ifaru.framework.FrameworkFacade;
import com.ifaru.gallery.Image;
import com.ifaru.util.Logger;
import org.apache.commons.digester.Digester;
import org.xml.sax.SAXException;

public class ShippingOptionFactory {

  private static ShippingOptionFactory factory;
  private static Logger logger;
  
  private ShippingOptionFactory(){}
  
  public static ShippingOptionFactory getInstance() {
    if (factory == null) {
      factory = new ShippingOptionFactory();
    }
    return factory;
  }
  
  public static void init(FrameworkFacade facade) {
    if (factory == null) {
      factory = new ShippingOptionFactory();
    }
    logger = facade.getLogger();
  }
  
  public ShippingOptions getShippingOptions(File data) throws IOException, SAXException {
    ShippingOptions shippingOptions = createFromXML(data);
    
    return shippingOptions;
  }
  
  private ShippingOptions createFromXML(File data) throws IOException, SAXException {
    Digester digester = new Digester();
    digester.setValidating( false );

    digester.addObjectCreate( "shippingoptions", ShippingOptions.class);

    digester.addObjectCreate( "shippingoptions/shippingoption", ShippingOption.class);
    digester.addSetProperties( "shippingoptions/shippingoption");
    digester.addSetNext("shippingoptions/shippingoption", "addOption");
   
    digester.addObjectCreate( "shippingoptions/shippingoption/rate", Rate.class);
    digester.addSetProperties( "shippingoptions/shippingoption/rate");
    digester.addSetNext("shippingoptions/shippingoption/rate", "addRate");

    ShippingOptions shippingOptions = (ShippingOptions)digester.parse( data );

    return shippingOptions;
  }

  public Countries getCountries(File data) throws IOException, SAXException {
    Digester digester = new Digester();
    digester.setValidating( false );

    digester.addObjectCreate( "countries", Countries.class);

    digester.addObjectCreate( "countries/country", Country.class);
    digester.addSetProperties( "countries/country");
    digester.addSetNext("countries/country", "addCountry");
    Countries countries = (Countries)digester.parse( data );

    return countries;
  }  

  
  public static void main(String args[]) {
    File file = new File("C:/projects/ifaru/data/shipping/shippingoptions.xml");
    ShippingOptionFactory factory = ShippingOptionFactory.getInstance();
    try {
//      ShippingOptions shippingOptions = factory.getShippingOptions(file);
//        Iterator frags = shippingOptions.values().iterator();
//        System.out.println("Number of Items: "+ shippingOptions.size());
//        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//        System.out.println("");                
//
//        while (frags.hasNext()) {
//          ShippingOption frag = (ShippingOption) frags.next();
//          System.out.println("Shipping Option Id: "+frag.getId());   
//          System.out.println("Shipping Option Name: "+frag.getName()); 
//
//        }

        file = new File("C:/projects/ifaru/data/countries/countries.xml");        
        Countries countries = factory.getCountries(file);
        Iterator frags = countries.values().iterator();
        System.out.println("Number of countries: "+ countries.size());
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        System.out.println("");                

        while (frags.hasNext()) {
          Country frag = (Country) frags.next();
          System.out.println("Country Id: "+frag.getId());   
          System.out.println("country Name: "+frag.getName()); 

     
        }        
    } catch (IOException e) {
      e.printStackTrace();
    } catch (SAXException e) {
      e.printStackTrace();
    }
  }
}

