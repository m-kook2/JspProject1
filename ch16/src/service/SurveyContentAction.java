package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Board;
import dao.BoardDao;
import dao.SurveyDao;
import dao.SurveyDto;

public class SurveyContentAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      int s_idx = Integer.parseInt(request.getParameter("s_idx"));
      String pageNum = request.getParameter("pageNum");
      SurveyDao sd = SurveyDao.getInstance();
      SurveyDto survey = sd.select(s_idx);
      
      request.setAttribute("s_idx", s_idx);
      request.setAttribute("pageNum", pageNum);
      request.setAttribute("survey", survey);
  } catch(Exception e) { System.out.println(e.getMessage()); }
    return "sur/s_content.jsp";
  }

}
