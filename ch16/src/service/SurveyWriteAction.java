package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.CommandProcess;

public class SurveyWriteAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) pageNum = "1";
    int status = (int) session.getAttribute("status");
    if (status != 2) {
      return "inc/adminChk.jsp";
    }
    request.setAttribute("pageNum", pageNum);

    return "s_writeForm.jsp";
  }

}
