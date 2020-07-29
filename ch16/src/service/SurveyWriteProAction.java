package service;

import java.io.IOException;
import java.sql.Date;
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
      String s_sdate = request.getParameter("s_sdate");
      String s_edate = request.getParameter("s_edate");
      System.out.println(s_sdate);
      System.out.println(s_edate);
      String pageNum = request.getParameter("pageNum");
      SurveyDao sd = SurveyDao.getInstance();
      SurveyDto survey = new SurveyDto();
      // survey.setS_idx(sd.getTotalCnt()+1);
      survey.setS_sub(request.getParameter("s_sub"));
      //
      //
      survey.setS_content(request.getParameter("content"));
      survey.setS_op1(request.getParameter("s_op1"));
      survey.setS_op2(request.getParameter("s_op2"));
      survey.setS_op3(request.getParameter("s_op3"));
      survey.setS_op4(request.getParameter("s_op4"));
      survey.setS_op5(request.getParameter("s_op5"));
      survey.setId(session.getAttribute("id").toString());
      int result = sd.insert(survey);
      request.setAttribute("s_idx", survey.getS_idx());
      request.setAttribute("result", result);
      request.setAttribute("pageNum", pageNum);
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    return "sur/s_writePro.jsp";
  }
}

