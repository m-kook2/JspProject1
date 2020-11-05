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
    System.out.println("SurveyWriteAction Start");
    
    //세션을 받아와 관리자 확인을 한다.
    
    HttpSession session = request.getSession();
    String pageNum = (String) request.getParameter("pageNum");
    if (pageNum == null) pageNum = "1";
    
    // 관리자가 아니면 adminChk로 보내 메인으로 되돌린다.
    int status = Integer.parseInt((String)session.getAttribute("status"));
    if (status != 2) {
      return "inc/adminChk.jsp";
    }
    request.setAttribute("pageNum", pageNum);

    return "sur/s_writeForm.jsp";
  }

}
