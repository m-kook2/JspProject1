package service;

public class StringUtil {
  
  public static String NullToEmpty (String string) {
    if(string == null) {
      return "";
    }
    return string;
  }

}
