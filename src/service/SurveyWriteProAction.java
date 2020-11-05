  package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.SurveyDao;
import dao.SurveyDto;

public class SurveyWriteProAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      HttpSession session = request.getSession();
      request.setCharacterEncoding("utf-8");
      String pageNum = request.getParameter("pageNum");
      SurveyDao sd = SurveyDao.getInstance();
      SurveyDto survey = new SurveyDto();
      survey.setS_sub(request.getParameter("s_sub"));
      survey.setS_sdate(request.getParameter("s_sdate"));
      survey.setS_edate(request.getParameter("s_edate"));
      survey.setS_content(request.getParameter("s_content"));
      survey.setS_op1(request.getParameter("s_op1"));
      survey.setS_op2(request.getParameter("s_op2"));
      survey.setS_op3(request.getParameter("s_op3"));
      survey.setS_op4(request.getParameter("s_op4"));
      survey.setS_op5(request.getParameter("s_op5"));
      survey.setId(session.getAttribute("id").toString());
      int[] result = sd.insert(survey);
      int result2 = sd.rearrange(result[1]);
      System.out.println("result2=>" + result2);
      request.setAttribute("s_idx", survey.getS_idx());
      request.setAttribute("result", result[0]);
      request.setAttribute("pageNum", pageNum);
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    return "sur/s_writePro.jsp";
  }
}

