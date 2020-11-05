package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.SCommDao;

public class SurveyCommentDeleteAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      System.out.println("SurveyCommentDeleteAction int");
      HttpSession session = request.getSession();
      int result = 0;
      int s_idx = Integer.parseInt(request.getParameter("s_idx"));
      String pageNum = request.getParameter("pageNum");
      String id = request.getParameter("writerid");
      String commPageNum = request.getParameter("commPageNum");
      String loginId = (String) session.getAttribute("id");
      int status = Integer.parseInt((String)session.getAttribute("status"));
      
      System.out.println("s_idx=>" + s_idx);
      System.out.println("pageNum=>" + pageNum);
      System.out.println("id=>" + id);
      System.out.println("commPageNum=>" + commPageNum);
      System.out.println("loginId=>" + loginId);
      System.out.println("status=>" + status);
      
      // 회원 아이디 로그인 여부 확인 및 관리자 여부 확인
      if (!id.equals(loginId) && status != 2) {
        System.out.println("SurveyCommentDeleteAction : ID Chk failed");
        result = -1;
        
      } else {
        System.out.println("SurveyCommentDeleteAction : ID Chk done");

        System.out.println("SCommDao init");
        SCommDao scd = SCommDao.getInstance();
        System.out.println("SCommDao delete init");
        result = scd.delete(s_idx, id);
      }

      request.setAttribute("result", result);
      request.setAttribute("s_idx", s_idx);
      request.setAttribute("pageNum", pageNum);
      request.setAttribute("commPageNum", commPageNum);

    } catch (Exception e) {

      System.out.println("SurveyCommentDeleteAction ERROR!!!");
      System.out.println(e.getMessage());

    }

    return "sur/s_commDelete.jsp";
  }

}
