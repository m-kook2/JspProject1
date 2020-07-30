package service;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.SurveyDto;
import dao.SurveyDao;

public class SurveyListAction implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    SurveyDao sd = SurveyDao.getInstance();
    try {
      int totCnt = sd.getTotalCnt();
      String pageNum = request.getParameter("pageNum");
      if (pageNum == null || pageNum.equals("")) {
        pageNum = "1";
      }
      int currentPage = Integer.parseInt(pageNum);
      int pageSize = 4, blockSize = 3;
      int startRow = (currentPage - 1) * pageSize + 1;
      int endRow = startRow + pageSize - 1;
      int startNum = totCnt - startRow + 1;
      System.out.println("SurveyDao list 메소드 실행");
      List<SurveyDto> list = sd.list(startRow, endRow);
      System.out.println("SurveyDao list 메소드 실행 완료");
      int pageCnt = (int) Math.ceil((double) totCnt / pageSize);
      int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
      int endPage = startPage + blockSize - 1;
      if (endPage > pageCnt)
        endPage = pageCnt;

      request.setAttribute("totCnt", totCnt);
      request.setAttribute("pageNum", pageNum);
      request.setAttribute("currentPage", currentPage);
      request.setAttribute("startNum", startNum);
      request.setAttribute("list", list);
      request.setAttribute("blockSize", blockSize);
      request.setAttribute("pageCnt", pageCnt);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);

      System.out.println("-----------------------------------------------"); // /ch16/list.do
      System.out.println("startNum-->" + startNum); // /ch16/list.do
      System.out.println("totCnt-->" + totCnt); // /ch16/list.do
      System.out.println("currentPage-->" + currentPage); // /ch16/list.do
      System.out.println("blockSize-->" + blockSize); // /ch16/list.do
      System.out.println("pageSize-->" + pageSize); // /ch16/list.do
      System.out.println("pageCnt-->" + pageCnt); // /ch16/list.do
      System.out.println("startPage-->" + startPage); // /ch16/list.do
      System.out.println("endPage-->" + endPage); // /ch16/list.do

    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    return "sur/s_list.jsp";
  }

}
