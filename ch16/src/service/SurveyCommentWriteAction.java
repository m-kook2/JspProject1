package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.SCommDao;
import dao.SCommDto;
import dao.SurveyDao;
import dao.SurveyDto;

public class SurveyCommentWriteAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      int result = 0;
      System.out.println("SurveyCommentWriteAction Start");
      request.setCharacterEncoding("utf-8");
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      String s_idx = request.getParameter("s_idx");
      String pageNum = request.getParameter("pageNum");
      
      // 페이지 널처리
      if (pageNum == null)
        pageNum = "1";

      // 로그인 체크
      System.out.println("login check");
      if (id == null || id.equals("")) {
        result= -1;
        System.out.println("login chk Failed");
        System.out.println("Result=> " + result);
        return "inc/memberChk.jsp";
      }

      System.out.println("vote null chk");
      // 투표 null 체크
      if (request.getParameter("r_op") == null || request.getParameter("r_op").equals("")) {
      
        // result를 경우의 수를 나눠 어떤 문제인지를 전달하려 한다.
        result = -3;
        System.out.println("SurveyCommentWriteAction : Null R_OP");
        System.out.println("s_idx=> " + s_idx);
        System.out.println("result=> " + result);
        System.out.println("pageNum=> " + pageNum);
        request.setAttribute("s_idx", s_idx);
        request.setAttribute("result", result);
        request.setAttribute("pageNum", pageNum);

        return "sur/s_commentWrite.jsp";
      }

      // 투표 가능 여부 체크
      System.out.println("surveyDao isVotable Chk");
      SurveyDao sd = SurveyDao.getInstance();
      SurveyDto survey = new SurveyDto();
      survey = sd.select(Integer.parseInt(s_idx));
      if (!survey.isVotable()) {
        result = -2;
        System.out.println("Votable chk Failed");
        System.out.println("Result=> " +result);
        // 투표 기간이 지났을 경우에는 insert를 진행시키지 않음. 
        
      } else {

        // Insert 시작
        SCommDao scd = SCommDao.getInstance();
        SCommDto comment = new SCommDto();
        comment.setId(id);
        comment.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
        comment.setR_op(request.getParameter("r_op"));
        comment.setR_content(request.getParameter("r_content"));
        result = scd.insert(comment);
      }

      // Attribute Setters

      request.setAttribute("s_idx", s_idx);
      request.setAttribute("result", result);
      request.setAttribute("pageNum", pageNum);
      System.out.println("SurveyCommentWriteAction : ");
      System.out.println("s_idx=> " + s_idx);
      System.out.println("result=> " + result);
      System.out.println("pageNum=> " + pageNum);


    } catch (Exception e) {
      System.out.println("SurveyCommentWriteAction ERROR!!");
      System.out.println(e.getMessage());
    }

    return "sur/s_commentWrite.jsp";
  }


}
