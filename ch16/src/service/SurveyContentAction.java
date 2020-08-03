package service;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.SCommDao;
import dao.SCommDto;
import dao.SurveyDao;
import dao.SurveyDto;

public class SurveyContentAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      // s_idx pagenum 받아옴

      int s_idx = Integer.parseInt(request.getParameter("s_idx"));
      String pageNum = request.getParameter("pageNum");

      // surveydao select 실행
      SurveyDao sd = SurveyDao.getInstance();
      SurveyDto survey = sd.select(s_idx);

      // attribute 전달
      request.setAttribute("s_idx", s_idx);
      request.setAttribute("pageNum", pageNum);
      request.setAttribute("survey", survey);

      System.out.println("surveyCommentListAction init");
      SCommDao scd = SCommDao.getInstance();
      int surCnt = scd.getSurCnt(s_idx);
      String commPageNum = request.getParameter("commPageNum");
      if (commPageNum == null || commPageNum.equals("")) {
        commPageNum = "1";
      }
      int currentPage = Integer.parseInt(commPageNum);
      int pageSize = 4, blockSize = 3;
      int startRow = (currentPage - 1) * pageSize + 1;
      int endRow = startRow + pageSize - 1;
      int startNum = surCnt - startRow + 1;
      System.out.println("SCommDao list 메소드 실행");
      List<SCommDto> list = scd.list(startRow, endRow, s_idx);
      System.out.println("SCommDao list 메소드 실행 완료");

      HttpSession session = request.getSession();
      String userid = (String) session.getAttribute("id");
      Boolean isVoted = false;
      for (SCommDto comment : list) {
        switch (comment.getR_op()) {
          case "1":
            comment.setR_op(survey.getS_op1());
            break;
          case "2":
            comment.setR_op(survey.getS_op2());

            break;
          case "3":
            comment.setR_op(survey.getS_op3());

            break;
          case "4":
            comment.setR_op(survey.getS_op4());

            break;
          case "5":
            comment.setR_op(survey.getS_op5());

            break;
        }
        if (comment.getId() != null && !comment.getId().equals("")
            && comment.getId().equals(userid)) {
          isVoted = true;
        }
      }
      request.setAttribute("isVoted", isVoted);

      int pageCnt = (int) Math.ceil((double) surCnt / pageSize);
      int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
      int endPage = startPage + blockSize - 1;
      if (endPage > pageCnt)
        endPage = pageCnt;

      request.setAttribute("surCnt", surCnt);
      request.setAttribute("commPageNum", commPageNum);
      request.setAttribute("currentPage", currentPage);
      request.setAttribute("startNum", startNum);
      request.setAttribute("list", list);
      request.setAttribute("blockSize", blockSize);
      request.setAttribute("pageCnt", pageCnt);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);

      int cnt = 1;
      System.out.println("list.size()=>" + list.size());
      for (SCommDto item : list) {

        System.out.println("item[" + cnt + "]=>" + item);
        cnt++;
      }

      System.out.println("-----------------------------------------------"); // /ch16/list.do
      System.out.println("surCnt-->" + surCnt); // /ch16/list.do
      System.out.println("startNum-->" + startNum); // /ch16/list.do
      System.out.println("commPageNum-->" + commPageNum); // /ch16/list.do
      System.out.println("currentPage-->" + currentPage); // /ch16/list.do
      System.out.println("blockSize-->" + blockSize); // /ch16/list.do
      System.out.println("pageSize-->" + pageSize); // /ch16/list.do
      System.out.println("pageCnt-->" + pageCnt); // /ch16/list.do
      System.out.println("startPage-->" + startPage); // /ch16/list.do
      System.out.println("endPage-->" + endPage); // /ch16/list.do

    } catch (Exception e) {
      System.out.println(e.getMessage());
    }

    return "sur/s_content.jsp";
  }

}
