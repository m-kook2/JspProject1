package util;

public class StringUtil {
  
  public static String NullToEmpty (String string) {
    if(string == null) {
      return "";
    }
    return string;
  }
  
  
  public static int StringToInt (String string) { // 스트링을 인트로 파싱해서 널일 경우 0으로 파싱해준다.
    int result;
    if(string == null || string.equals("")) {
      result = 0;
      return result;
    }
    result = Integer.parseInt(string);
    return result;
  }
}
