package com.ifaru.actions.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.ifaru.catalog.Brand;
import com.ifaru.catalog.CatalogItem;
import com.ifaru.catalog.CatalogItems;
import com.ifaru.catalog.Category;
import com.ifaru.catalog.Information;
import com.ifaru.catalog.Size;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.gallery.Image;
import com.ifaru.measurement.MeasurementUnitFactory;
import com.ifaru.util.Logger;
import org.apache.commons.digester.Digester;
import org.xml.sax.SAXException;

public class CatalogItemFactory {

  private static CatalogItemFactory factory;
  private static Logger logger = Logger.getInstance();
  private MeasurementUnitFactory muFactory;
  private CatalogItemFactory(){}
  
  public static CatalogItemFactory getInstance() {
    if (factory == null) {
      factory = new CatalogItemFactory();
    }
    return factory;
  }
  
  public void init(FrameworkFacade facade) {
    if (factory == null) {
      factory = new CatalogItemFactory();
    }
    logger = facade.getLogger();
    muFactory = MeasurementUnitFactory.getInstance(facade);
  }
  
  public CatalogItems getItems(File data) throws IOException, SAXException, IFaruException {
    return getItems(data, false);
  }
  public CatalogItems getItems(File data, boolean ignoreDisabled) throws IOException, SAXException, IFaruException {
    CatalogItems catalogItems = createFromXML(data, ignoreDisabled);
    
    return catalogItems;
  }
  
  private CatalogItems createFromXML(File data, boolean ignoreDisabled) throws IOException, SAXException, IFaruException {
    Digester digester = new Digester();
    digester.setValidating( false );

    digester.addObjectCreate( "catalog", CatalogItems.class);

    digester.addObjectCreate( "catalog/items/item", CatalogItem.class);
    digester.addSetProperties( "catalog/items/item");
    digester.addSetNext("catalog/items/item", "addItem");
   
    digester.addObjectCreate( "catalog/items/item/size", Size.class);
    digester.addSetProperties( "catalog/items/item/size");
    digester.addSetNext("catalog/items/item/size", "addSize");

    digester.addObjectCreate("catalog/items/item/information", Information.class);
    digester.addSetProperties("catalog/items/item/information");
    digester.addSetNext("catalog/items/item/information", "setInformation");             

    digester.addObjectCreate("catalog/items/item/image", Image.class);
    digester.addSetProperties( "catalog/items/item/image");
    digester.addSetNext("catalog/items/item/image", "setImage");        
     
    digester.addObjectCreate( "catalog/categories/category", Category.class);
    digester.addSetProperties( "catalog/categories/category");
    digester.addSetProperties( "catalog/categories/category/keywords");
    digester.addSetNext("catalog/categories/category", "addCategory");
       
    digester.addObjectCreate( "catalog/brands/brand", Brand.class);
    digester.addSetProperties( "catalog/brands/brand");
    digester.addSetProperties( "catalog/brands/brand/keywords");
    digester.addSetNext("catalog/brands/brand", "addBrand");
           
    CatalogItems catalogItems = (CatalogItems)digester.parse( data );
//    if (!ignoreDisabled)
//    {
//        catalogItems = removeDisabledItems(catalogItems);
//    }
    setIds(catalogItems);
    setMeasurementUnits(catalogItems);
    return catalogItems;
  }
  
  private void setMeasurementUnits(CatalogItems catalogItems) throws IFaruException {
    String mn = "setMeasurementUnits";
    List items = catalogItems.getItems();    
    for (int i=0; i<items.size(); i++) {
      CatalogItem item = (CatalogItem)items.get(i); 
      if (item.getMeasurementUnit() != null)
      {
        Iterator sizes = item.getSizes().iterator();
        while(sizes.hasNext())
        {
          Size size = (Size)sizes.next();
          size.setMeasurementUnit(item.getMeasurementUnit());
        }
      }
//      if (item.getMeasurementUnit() == null) {
//        continue;
//      } else if (item.getMeasurementUnit().trim().equalsIgnoreCase(CatalogItem.MEASUREMENT_UNIT_NAME_UNITS)) {
//        setMeasurementUnitUnits(item);
//      } else if (item.getMeasurementUnit().trim().equalsIgnoreCase(CatalogItem.MEASUREMENT_UNIT_NAME_MLS)) {
//        setMeasurementUnitMls(item);
//      } else if (item.getMeasurementUnit().trim().equalsIgnoreCase(CatalogItem.MEASUREMENT_UNIT_NAME_GRAMS)) {
//        setMeasurementUnitGrams(item);
//      }
      
    }    
  }

  private void setMeasurementUnitGrams(CatalogItem item) throws IFaruException {
    Iterator prices = item.getSizes().iterator();
    while (prices.hasNext()) {
      Size size = (Size) prices.next();
      size.setMu(muFactory.getMeasurementUnitInGrams(Integer.parseInt(size.getSize())));
    }
  }

  private void setMeasurementUnitUnits(CatalogItem item) {
    Iterator prices = item.getSizes().iterator();
    while (prices.hasNext()) {
      Size size = (Size) prices.next();
      size.setMu(muFactory.getMeasurementUnitInUnits());
    }
  }

  private void setMeasurementUnitMls(CatalogItem item) throws IFaruException {
    Iterator prices = item.getSizes().iterator();
    while (prices.hasNext()) {
      Size size = (Size) prices.next();
      size.setMu(muFactory.getMeasurementUnitInMls(size.getSize()));
    }
  }  
  private CatalogItems removeDisabledItems(CatalogItems catalogItems) {
    String mn = "removeDisabledItems";
    List items = catalogItems.getItems();
    List toRemove = new ArrayList();
    for (int i=0; i<items.size(); i++) {
      CatalogItem item = (CatalogItem)items.get(i);      
      if (!item.isAvailable()) {
        msg(mn, new String[] {"Disabled item marked for removal: [", item.toString(), "]"});
        toRemove.add(item);
      }
    }
    for (int i=0; i<toRemove.size(); i++) {
      msg(mn, new Object[] {"Disabled item is being removed: [", toRemove.get(i), "]"});      
      boolean itemRemoved = items.remove(toRemove.get(i));
      msg(mn, new Object[] {"Item removal status: ", new Boolean(itemRemoved)});
      
    }
    msg(mn, new Object[] {"Adding ", items.size(), " items to catalog"});
    catalogItems.setItems(items);
    return catalogItems;
  }

  /**
   * This creates an id for the salePrice (Prices) objet of each frangrance
   * This id is used when creating the the SELECT html element for the sale 
   * prices of each fragrance.
   * @param catalogItems
   */
  private synchronized void setIds(CatalogItems catalogItems) {
    Iterator allItems = catalogItems.getItems().iterator();

    while(allItems.hasNext()) {
      CatalogItem catalogItem = (CatalogItem)allItems.next();
      String id = catalogItem.getId();
      List prices = catalogItem.getSizes();
      int priceCount=0;  

      Iterator allPrices = prices.iterator();
      while (allPrices.hasNext()) {
        Size size = (Size) allPrices.next();
        // create and id line salePrice_<frangranceId>
        StringBuffer priceIdBuff = new StringBuffer(id);
        priceIdBuff.append("salePrice");
        priceIdBuff.append(priceCount);;        
        size.setSalePriceId(priceIdBuff.toString());

        ++priceCount;
      }
    }
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
}

