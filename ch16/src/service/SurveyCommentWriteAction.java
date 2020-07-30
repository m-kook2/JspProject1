package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.SCommDao;
import dao.SCommDto;

public class SurveyCommentWriteAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {

      System.out.println("SurveyCommentWriteAction Start");
      request.setCharacterEncoding("utf-8");
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      String s_idx = request.getParameter("s_idx");
      if (id == null || id.equals("")) {
        return "inc/memberChk.jsp";
      }
      SCommDao scd = SCommDao.getInstance();
      SCommDto comment = new SCommDto();
      comment.setId(id);
      comment.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
      comment.setR_op(request.getParameter("r_op"));
      comment.setR_content(request.getParameter("r_content"));
      String pageNum = (String) request.getParameter("pageNum");
      int result = scd.insert(comment);
      request.setAttribute("s_idx", s_idx);
      request.setAttribute("result", result);
      if (pageNum == null)
        pageNum = "1";
      request.setAttribute("pageNum", pageNum);
    } catch (Exception e) {
     System.out.println("SurveyCommentWriteAction ERROR!!");
     System.out.println(e.getMessage());
    }

    return "sur/s_commentWrite.jsp";
  }

}
