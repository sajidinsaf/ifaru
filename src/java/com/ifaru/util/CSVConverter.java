package com.ifaru.util;

import java.io.*;
import java.util.*;

public class CSVConverter {

   public static void main(String args[]) throws IOException {

     File csvFile = new File("WilyRolloutServers.txt");
     BufferedReader reader = new BufferedReader(new FileReader(csvFile));
     ArrayList lines = new ArrayList();
     String line = null;
     while ((line = reader.readLine()) != null) {
       lines.add(line);
     }
     reader.close();
     System.out.println("Read "+lines.size()+" lines");

     ArrayList xmlLines = new ArrayList();
     
     for (int i=0; i<lines.size(); i++) {
       line = lines.get(i).toString();
       xmlLines.add(convertToXML(line));
     }
     System.out.println("Converted "+xmlLines.size()+" lines to XML");

   }

   private static String convertToXML(String line) {
     String xmlLine = "    <server ";
     StringTokenizer st = new StringTokenizer(line, ",");
     int i=0;
     while(st.hasMoreTokens()) {
       String attrValue = st.nextToken();
       
       // 0=country, 1=servername, 2=envType, 3=serverType, 4=platform, 5=numberOfCPUs, 6=operatingSystem, 7=numberOfJVMs, 8=appServer (WebSphere/Weblogic)
 
       switch (i) {
         case 0: xmlLine = xmlLine + "country=\""+attrValue+"\" ";
         break;
         case 1: xmlLine = xmlLine + "hostName=\""+attrValue+"\" ";
         break;
         case 2: xmlLine = xmlLine + "envType=\""+attrValue+"\" ";
         break;
         case 3: xmlLine = xmlLine + "serverType=\""+attrValue+"\" ";
         break;
         case 4: xmlLine = xmlLine + "platform=\""+attrValue+"\" ";
         break;
         case 5: xmlLine = xmlLine + "numberOfCPUs=\""+attrValue+"\" ";
         break;
         case 6: xmlLine = xmlLine + "operatingSystem=\""+attrValue+"\" ";
         break;
         case 8: xmlLine = xmlLine + "appServer=\""+attrValue+"\" ";
       }

       i++;
     }
     xmlLine = xmlLine + "wilyBinaryRoot=\"/opt/wily\">"+System.getProperty("line.separator")+"    </server>";
     System.out.println(xmlLine);
     return xmlLine;
   }

}

