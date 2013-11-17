import java.io.*;
import java.util.*;
public class SandboxHelper {
  private final static String IFARU_ROOT = "/ifaru/";
  private final static String IFARU_SB_ROOT = "/ifarusb/";  
  private final static String[] IGNORE_EXT = new String[] {"jar", "jpg", "gif", "png", "doc", "war", "tld", "class", "db"};
  /**
   * @param args
   * @throws IOException 
   */
  public static void main(String[] args) throws IOException {
    
    File dir = new File(System.getProperty("sbFolder"));
    processDir(dir);
    processRecursive(dir);
  }

  private static void processRecursive(File dir) throws IOException {
    File[] pDirs = dir.listFiles();      
    for (int i=0; i<pDirs.length; i++) {
      File pDir = pDirs[i];
      if (pDir.isDirectory()) {
        processDir(pDir);    
        processRecursive(pDir);
      }
    }    
  }
  private static void processDir(File dir) throws IOException {
    File[] files = dir.listFiles();    
    for (int i=0; i<files.length; i++) {
      File file = files[i];
      boolean isPotentialCandidate = true;
      for (int j=0; j<IGNORE_EXT.length; j++) {
        if (file.getName().toLowerCase().endsWith(IGNORE_EXT[j])) {
          isPotentialCandidate = false;
          System.out.println("Ignoring file: "+file.getAbsolutePath());
          break;
        }
      }
      if (file.isFile() && isPotentialCandidate) {
        System.out.println("Canditate file: "+file.getAbsolutePath());
        BufferedReader reader = new BufferedReader(new FileReader(file));
        ArrayList lines = new ArrayList();
        String line ="";
        while ((line=reader.readLine()) != null) {
          if (line.indexOf(IFARU_ROOT) != -1) {
            System.out.println("===========================================================");
            System.out.println("Line: " + line + "of file: "+file.getAbsolutePath()+ " is a candidate");
            String linePart1 = line.substring(0, line.indexOf(IFARU_ROOT));
            String linePart2 = line.substring(line.indexOf(IFARU_ROOT)+IFARU_ROOT.length(), line.length());
            if (linePart2.indexOf(IFARU_ROOT) != -1) {
              String linePart3 = linePart2.substring(0, linePart2.indexOf(IFARU_ROOT));
              String linePart4 = linePart2.substring(linePart2.indexOf(IFARU_ROOT)+IFARU_ROOT.length(), linePart2.length()); 
              linePart2 = linePart3+IFARU_SB_ROOT+linePart4;
            }
            line = linePart1+IFARU_SB_ROOT+linePart2;
            System.out.println(" Line changed to: [  "+line+"  ]");
            System.out.println("===========================================================");            
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
