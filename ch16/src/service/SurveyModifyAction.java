package service;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.SurveyDao;
import dao.SurveyDto;
import util.StringUtil;

public class SurveyModifyAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    System.out.println("Survey Modify Action : ");
    
    try {
      // 세션을 받아와 관리자 확인을 한다.
      HttpSession session = request.getSession();
      String pageNum = (String) request.getParameter("pageNum");
      int s_idx = StringUtil.StringToInt(request.getParameter("s_idx"));
      if (pageNum == null) {        
        pageNum = "1";
      }
      // 페이지 넘과 S_IDX의 널처리
      // 관리자가 아니면 adminChk로 보내 메인으로 되돌린다.
      int status = Integer.parseInt((String) session.getAttribute("status"));
      if (status != 2) {
        return "inc/adminChk.jsp";
      }
      SurveyDao sd = SurveyDao.getInstance();
      SurveyDto board = new SurveyDto();
      board = sd.select(s_idx);
      request.setAttribute("pageNum", pageNum);
      request.setAttribute("board", board);
      request.setAttribute("s_idx", s_idx);
    } catch (SQLException e) {
      System.out.println("SurveyModifyAction ERROR!!!");
      System.out.println(e.getMessage());
      e.printStackTrace();
    }

    return "sur/s_modifyForm.jsp";
  }

}
