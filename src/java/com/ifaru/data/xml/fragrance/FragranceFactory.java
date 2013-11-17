package com.ifaru.data.xml.fragrance;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.ifaru.framework.FrameworkFacade;
import com.ifaru.gallery.Image;
import com.ifaru.util.Logger;
import org.apache.commons.digester.Digester;
import org.xml.sax.SAXException;

public class FragranceFactory {

  private static FragranceFactory factory;
  private static Logger logger;
  
  private FragranceFactory(){}
  
  public static FragranceFactory getInstance() {
    if (factory == null) {
      factory = new FragranceFactory();
    }
    return factory;
  }
  
  public static void init(FrameworkFacade facade) {
    if (factory == null) {
      factory = new FragranceFactory();
    }
    logger = facade.getLogger();
  }
  
  public Fragrances getFragrances(File data) throws IOException, SAXException {
    Fragrances fragrances = createFromXML(data);
    
    return fragrances;
  }
  
  private Fragrances createFromXML(File data) throws IOException, SAXException {
    Digester digester = new Digester();
    digester.setValidating( false );

    digester.addObjectCreate( "fragrances", Fragrances.class);

    digester.addObjectCreate( "fragrances/fragrance", Fragrance.class);
    digester.addSetProperties( "fragrances/fragrance", "name", "name");
    digester.addSetProperties( "fragrances/fragrance", "category", "category");
    digester.addSetProperties( "fragrances/fragrance", "gender", "gender");    
    digester.addSetNext("fragrances/fragrance", "addFragrance");
    
    
    digester.addObjectCreate( "fragrances/fragrance/grade", Grade.class);
    digester.addSetProperties( "fragrances/fragrance/grade", "id", "id");
    digester.addSetProperties( "fragrances/fragrance/grade", "name", "name");
    digester.addSetProperties( "fragrances/fragrance/grade","rateQuantity", "rateQuantity");
    digester.addSetProperties( "fragrances/fragrance/grade","rateUnit", "rateUnit");
    digester.addSetProperties( "fragrances/fragrance/grade","currency", "currency");
    digester.addSetProperties( "fragrances/fragrance/grade","rate", "rate");
    digester.addSetNext("fragrances/fragrance/grade", "addGrade");

    digester.addObjectCreate("fragrances/fragrance/information", Information.class);
    digester.addSetNext("fragrances/fragrance/information", "setInformation");        
    
    digester.addObjectCreate("fragrances/fragrance/information/line", InfoLine.class);    
    digester.addSetProperties( "fragrances/fragrance/information/line", "style", "style");
    digester.addSetProperties( "fragrances/fragrance/information/line", "text", "text");  
    digester.addSetNext("fragrances/fragrance/information/line", "addLine");        

    digester.addObjectCreate("fragrances/fragrance/image", Image.class);
    digester.addSetProperties( "fragrances/fragrance/image", "src", "src");
    digester.addSetProperties( "fragrances/fragrance/image", "thumbnail", "thumbnail");      
    digester.addSetNext("fragrances/fragrance/image", "setImage");        
     
    
    Fragrances fragrances = (Fragrances)digester.parse( data );
    
    return fragrances;
  }
  
  public static void main(String args[]) {
    File file = new File("C:/projects/ifaru/data/fragrances/fragrances.xml");
    FragranceFactory factory = FragranceFactory.getInstance();
    try {
      Fragrances fragrances = factory.getFragrances(file);
        List frags = fragrances.getFragrances();
        System.out.println("Number of Items: "+ frags.size());
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        System.out.println("");                

        for (int j=0; j<frags.size(); j++) {
          Fragrance frag = (Fragrance) frags.get(j);
          System.out.println("Fragance Name: "+frag.getName());   
          System.out.println("Fragance Category: "+frag.getCategory());
          System.out.println("Fragance Gender: "+frag.getGender());           
          System.out.println("===================================");
          System.out.println("");          
          List grades = frag.getGrades();
          
          for (int k=0; k<grades.size(); k++) {
            Grade grade = (Grade)grades.get(k);
            System.out.println("Grade id: "+grade.getId());
            System.out.println("Grade name: "+grade.getName()); 
            System.out.println("Grade quantity: "+grade.getRateQuantity());
            System.out.println("Grade rate: "+grade.getRate());   
            System.out.println("Grade unit: "+grade.getRateUnit());  
            System.out.println("Grade currency: "+grade.getCurrency());
            System.out.println("-----------------------------------");
            System.out.println("");
          }
          
          Information info = frag.getInformation();
          if (info != null) {
            List infoLines = info.getInfoLines();
            if (infoLines != null) {
              for (int l=0; l<infoLines.size(); l++) {
                InfoLine line = (InfoLine) infoLines.get(l);
                System.out.println("Style: " +line.getStyle());
                System.out.println("Text: "+line.getText());
                System.out.println(".........................");
              }
            } else {
              System.out.println("No information lines available");
            }
          } else {
            System.out.println("No information available");
          }
          
          Image image = frag.getImage();
          if (image != null) {
            System.out.println("Image Source: "+image.getSrc());
            System.out.println("Image Thumb: "+image.getThumbnail());
          }
          System.out.println("**********************************");
        }

    } catch (IOException e) {
      e.printStackTrace();
    } catch (SAXException e) {
      e.printStackTrace();
    }
  }
}

