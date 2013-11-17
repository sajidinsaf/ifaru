package com.ifaru.gallery;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.ifaru.framework.FrameworkFacade;
import com.ifaru.util.Logger;
import org.apache.commons.digester.Digester;
import org.xml.sax.SAXException;

public class GalleryFactory {

  private static GalleryFactory factory;
  private static Logger logger;
  
  private GalleryFactory(){}
  
  public static GalleryFactory getInstance() {
    if (factory == null) {
      factory = new GalleryFactory();
    }
    return factory;
  }
  
  public static void init(FrameworkFacade facade) {
    if (factory == null) {
      factory = new GalleryFactory();
    }
    logger = facade.getLogger();
  }
  
  public Gallery getXMLGallery(File galleryDescriptor) throws IOException, SAXException {
    Gallery gallery = createFromXML(galleryDescriptor);
    
    return gallery;
  }
  
  private Gallery createFromXML(File galleryDescriptor) throws IOException, SAXException {
    Digester digester = new Digester();
    digester.setValidating( false );

    digester.addObjectCreate( "gallery", Gallery.class);

    digester.addObjectCreate( "gallery/picture", Picture.class);
    digester.addObjectCreate( "gallery/picture/image", Image.class);
    digester.addSetProperties( "gallery/picture/image", "src", "src");
    digester.addSetProperties( "gallery/picture/image", "thumbnail", "thumbnail" );
    digester.addSetNext("gallery/picture/image", "setImage");
    
    digester.addBeanPropertySetter( "gallery/picture/title", "title");
    digester.addBeanPropertySetter( "gallery/picture/description", "description" );
    digester.addSetNext( "gallery/picture", "addPicture");


    digester.addBeanPropertySetter( "addresses/person/detail/education" );
    digester.addSetNext( "addresses/person/Detail", "addDetail" );

    digester.addSetNext( "addresses/person", "addPerson" );

    Gallery gallery = (Gallery)digester.parse( galleryDescriptor );
    
    return gallery;
  }
  
  public static void main(String args[]) {
    File file = new File("C:/projects/gallery/data/bindi-samples.xml");
    GalleryFactory factory = GalleryFactory.getInstance();
    try {
      Gallery gallery = factory.getXMLGallery(file);
      List list = gallery.getPictures();
      
      for (int i=0; i<list.size(); i++) {
        System.out.println(list.get(i));
      }
    } catch (IOException e) {
      e.printStackTrace();
    } catch (SAXException e) {
      e.printStackTrace();
    }
  }
}
