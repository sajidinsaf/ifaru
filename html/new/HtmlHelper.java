import java.io.*;
import java.util.*;
public class HtmlHelper {
  private final static String ebp = "ebaypics/";
  /**
   * @param args
   * @throws IOException 
   */
  public static void main(String[] args) throws IOException {
    File dir = new File(".");
    File[] files = dir.listFiles();
    for (int i=0; i<files.length; i++) {
      File file = files[i];
      
      if (file.isFile() && file.getName().endsWith("html")) {
        
        BufferedReader reader = new BufferedReader(new FileReader(file));
        ArrayList lines = new ArrayList();
        String line ="";
        while ((line=reader.readLine()) != null) {
          if (line.indexOf(ebp) != -1) {
            String linePart1 = line.substring(0, line.indexOf(ebp)+ebp.length());
            String linePart2 = line.substring(line.indexOf(ebp)+ebp.length(), line.length());
            if (linePart2.indexOf(ebp) != -1) {
              String linePart3 = linePart2.substring(0, linePart2.indexOf(ebp)+ebp.length());
              String linePart4 = linePart2.substring(linePart2.indexOf(ebp)+ebp.length(), linePart2.length()); 
              linePart2 = linePart3+"ifarupics/"+linePart4;
            }
            line = linePart1+"ifarupics/"+linePart2;
          }
          lines.add(line);
        }
        reader.close();
        
        BufferedWriter writer = new BufferedWriter(new FileWriter(file));
        Iterator iter = lines.iterator();
        while(iter.hasNext()) {
          writer.write(iter.next().toString());
          writer.newLine();
        }
        writer.flush();
        writer.close();
        
      }
      
    }

  }

}
