package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.SurveyDao;
import dao.SurveyDto;

public class SurveyModifyProAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      request.setCharacterEncoding("utf-8");
      String pageNum = request.getParameter("pageNum");
      SurveyDto survey = new SurveyDto();
      survey.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
      survey.setS_sub(request.getParameter("s_sub"));
      survey.setS_sdate(request.getParameter("s_sdate"));
      survey.setS_edate(request.getParameter("s_edate"));
      survey.setS_content(request.getParameter("s_content"));
      survey.setS_op1(request.getParameter("s_op1"));
      survey.setS_op2(request.getParameter("s_op2"));
      survey.setS_op3(request.getParameter("s_op3"));
      survey.setS_op4(request.getParameter("s_op4"));
      survey.setS_op5(request.getParameter("s_op5"));
      survey.setId(request.getParameter("id"));
      SurveyDao sd = SurveyDao.getInstance();
      int result = sd.update(survey);
      int result2 = sd.rearrange(Integer.parseInt(request.getParameter("s_idx")));
      System.out.println("SurveyModifyPro Result2=>"+ result2);
      request.setAttribute("result", result);
      request.setAttribute("s_idx", survey.getS_idx());
      request.setAttribute("pageNum", pageNum);
    } catch (Exception e) {
      System.out.println("SurveyModifyProAction ERROR");
      System.out.println(e.getMessage());
    }

    return "sur/s_modifyPro.jsp";
  }

}
