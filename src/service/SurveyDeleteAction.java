package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.SurveyDao;

public class SurveyDeleteAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      System.out.println(request.getParameter("s_idx"));
      System.out.println(request.getParameter("pageNum"));
      int s_idx = Integer.parseInt(request.getParameter("s_idx"));
      String pageNum = request.getParameter("pageNum");
      SurveyDao sd = SurveyDao.getInstance();
      System.out.println("surveyDao 실행");
      int result = sd.delete(s_idx);
      
      request.setAttribute("result", result);
      request.setAttribute("pageNum", pageNum);
      
    } catch (Exception e) {
      System.out.println("SurveyDeleteAction ERROR");
      System.out.println(e.getMessage());
    }

    return "sur/s_delete.jsp";
  }

}
