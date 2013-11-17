package com.ifaru.util;

import java.util.*;
import java.io.*;

public class XMLMaker {

  private final static String SEP = System.getProperty("line.separator");

  public XMLMaker() {}
  
  
  private void go(File inFile, File outFile) throws Exception {

    List lines = getXML(inFile);
    
    writeXML(lines, outFile);
    
  }

  private List getXML(File csvFile) throws Exception {

    BufferedReader reader = new BufferedReader(new FileReader(csvFile));
    List lines =  new ArrayList(60);
    lines.add("<items>"+SEP);
    String line = "";
    
    while ((line = reader.readLine()) != null) {
      if (!line.trim().equals("")) {
         String xmlLine = convertToXML(line);         
         lines.add(xmlLine);
      }   
    }
    lines.add("</items>");
    reader.close();
    return lines;
  }


  private void writeXML(List lines, File outFile) throws Exception {
      
     BufferedWriter writer = new BufferedWriter(new FileWriter(outFile));
     Iterator iter = lines.iterator();

     while(iter.hasNext()) {
        String line = iter.next().toString();
        System.out.println("writing line: "+ line);
        writer.write(line);
        System.out.println("Finished line.");
     }
     
     System.out.println("Created XML File: "+outFile.getAbsolutePath()); 
     writer.flush();    
     writer.close();
  }


  public static void main(String args[]) throws Exception {

    String csvFileName = "catalog.csv";
    String xmlFileName = "catalog.xml";
 
    if (args.length > 0) {
       csvFileName = args[0];
       xmlFileName = args[1];
    }

    File csvFile = new File(csvFileName);
    File xmlFile = new File(xmlFileName);

    if (!csvFile.exists()) {
       System.out.println("The CSV file: "+csvFile.getAbsolutePath() +" does not exist.");
       System.exit(1); 
    }

    if (args.length > 0 && !xmlFile.exists()) {
       System.out.println("The CSV file: "+xmlFile.getAbsolutePath() +" does not exist.");
       System.exit(1); 
    }
    
    (new XMLMaker()).go(csvFile, xmlFile);

  }

   private static String convertToXML(String line) {
     String xmlLine = "  <item ";
     StringTokenizer st = new StringTokenizer(line, ",");
     int i=0;
     while(st.hasMoreTokens()) {
       String attrValue = st.nextToken();
       log("Value of next token is: "+attrValue+" Value of i is: "+i);
       // 0=id 1=name, 2=description, 3=categoryCode 4=categoryName, 5=gender, 6=tester, 7=3ml, 8=6ml, 9=12ml, 10=24ml, 11=url, 12=imgSrc, 13=imgThumb

         switch (i) {
           case 0: xmlLine = xmlLine + "id=\""+attrValue+"\" ";
             log("writing: "+xmlLine);
             break;
           case 1: xmlLine = xmlLine + "name=\""+attrValue+"\" ";
             log("writing: "+xmlLine);
             break;
           case 2: xmlLine = xmlLine + "description=\""+attrValue+"\" ";
             log("writing: "+xmlLine);
             break;
           case 3: xmlLine = xmlLine + "categoryCode=\""+attrValue+"\" ";
             log("writing: "+xmlLine);
             break;
           case 4: xmlLine = xmlLine + "categoryName=\""+attrValue+"\" ";
             log("writing: "+xmlLine);
             break;
           case 5: xmlLine = xmlLine + "gender=\""+attrValue+"\" >" + SEP;
              log("writing: "+xmlLine);
             break;
           case 6: 
             if (attrValue != null && !attrValue.trim().equals("")) {
               xmlLine = xmlLine + "    <price size=\"Tester\" stock=\"10\" salePrice=\""+attrValue+"\" />" + SEP;
               log("writing: "+xmlLine);
             }
             break;
           case 7: 
             if (attrValue != null && !attrValue.trim().equals("")) {
               xmlLine = xmlLine + "    <price size=\"3ml\" stock=\"5\" salePrice=\""+attrValue+"\" />" + SEP;
               log("writing: "+xmlLine);
             }
             break;
           case 8: 
             if (attrValue != null && !attrValue.trim().equals("")) {
               xmlLine = xmlLine + "    <price size=\"6ml\" stock=\"3\" salePrice=\""+attrValue+"\" />" + SEP;
               log("writing: "+xmlLine);
             }
             break;
           case 9: 
             if (attrValue != null && !attrValue.trim().equals("")) {
               xmlLine = xmlLine + "    <price size=\"12ml\" stock=\"2\" salePrice=\""+attrValue+"\" />" + SEP;
               log("writing: "+xmlLine);
             }
             break;
           case 10: 
             if (attrValue != null && !attrValue.trim().equals("")) {
               xmlLine = xmlLine + "    <price size=\"24ml\" stock=\"1\" salePrice=\""+attrValue+"\" />" + SEP;
               log("writing: "+xmlLine);
             }
             break;
           case 11: 
               xmlLine = xmlLine + "    <information url=\""+attrValue+"\" />" + SEP;
                log("writing: "+xmlLine);
             break;
           case 12: xmlLine = xmlLine + "    <image src=\""+attrValue+"\" ";
             log("writing: "+xmlLine);
             break;
           case 13: xmlLine = xmlLine + "thumbnail=\""+attrValue+"\" />" + SEP;
             log("writing: "+xmlLine);
             break;
         }


       i++;
     }
     xmlLine = xmlLine + "  </item>" + SEP;
     //System.out.println(xmlLine);
     return xmlLine;
   }

   private static void log(String msg) {
     System.out.println(msg);
   }
}