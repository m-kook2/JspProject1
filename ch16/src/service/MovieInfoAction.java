package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import dao.BookmarkDto;
import dao.CommDao;
import dao.CommDto;
import dao.MovieDao;
import dao.MovieDto;

public class MovieInfoAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CommDao cd = CommDao.getInstance();
		try {
			System.out.println("MovieInfoAction 시작");
			String m_idx = request.getParameter("m_idx");
//			String pageNum = request.getParameter("pageNum");
			MovieDao md = MovieDao.getInstance();
			MovieDto mt = md.select(m_idx);
//			System.out.println(pageNum);
			System.out.println(m_idx);
			System.out.println(mt);

			request.setAttribute("m_idx", m_idx);
//			request.setAttribute("pageNum", pageNum);
			request.setAttribute("mt", mt);
			int totCnt = cd.getTotalCnt2(m_idx);
			int totCnt2 = cd.getTotalCnt3(m_idx);
			String pageNum2 = request.getParameter("pageNum2");
			if (pageNum2 == null || pageNum2.equals("")) {
				pageNum2 = "1";
			}
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			BookmarkDao bd = BookmarkDao.getInstance();
			Boolean isBookMark = bd.check(id, m_idx);
			request.setAttribute("isBookMark", isBookMark);
			
			String str = request.getParameter("str") == null ? "c_date" : request.getParameter("str");
			int currentPage = Integer.parseInt(pageNum2);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			List<CommDto> list = cd.list(startRow, endRow, m_idx, str);
			int pageCnt = (int) Math.ceil((double) totCnt / pageSize);
			int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if (endPage > pageCnt)
				endPage = pageCnt;
			CommDao cd2 = CommDao.getInstance();
			CommDto comm2 = cd2.select(m_idx);
			
			int currentPage2 = Integer.parseInt(pageNum2);
			int pageSize2 = 10, blockSize2 = 10;
			int startRow2 = (currentPage2 - 1) * pageSize2 + 1;
			int endRow2 = startRow2 + pageSize2 - 1;
			int startNum2 = totCnt2 - startRow2 + 1;
			List<CommDto> slist = cd2.list2(startRow2, endRow2, m_idx, str);
			int pageCnt2 = (int) Math.ceil((double) totCnt2 / pageSize2);
			int startPage2 = (int) (currentPage2 - 1) / blockSize2 * blockSize2 + 1;
			int endPage2 = startPage + blockSize2 - 1;
			if (endPage2 > pageCnt2)
				endPage2 = pageCnt2;
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum2", pageNum2);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("comm2", comm2);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("slist", slist);
			request.setAttribute("str", str);

			request.setAttribute("totCnt2", totCnt2);
			request.setAttribute("currentPage2", currentPage2);
			request.setAttribute("startNum2", startNum2);
			request.setAttribute("blockSize2", blockSize2);
			request.setAttribute("pageCnt2", pageCnt2);
			request.setAttribute("startPage2", startPage2);
			request.setAttribute("endPage2", endPage2);

			System.out.println("-----------------------------------------------"); // /ch16/list.do
			System.out.println("startNum-->" + startNum); // /ch16/list.do
			System.out.println("totCnt-->" + totCnt); // /ch16/list.do
			System.out.println("currentPage-->" + currentPage); // /ch16/list.do
			System.out.println("blockSize-->" + blockSize); // /ch16/list.do
			System.out.println("pageSize-->" + pageSize); // /ch16/list.do
			System.out.println("pageCnt-->" + pageCnt); // /ch16/list.do
			System.out.println("startPage-->" + startPage); // /ch16/list.do
			System.out.println("endPage-->" + endPage); // /ch16/list.do
						
			System.out.println("startNum2-->" + startNum2); // /ch16/list.do
			System.out.println("totCnt2-->" + totCnt2); // /ch16/list.do
			System.out.println("currentPage2-->" + currentPage2); // /ch16/list.do
			System.out.println("blockSize2-->" + blockSize2); // /ch16/list.do
			System.out.println("pageSize2-->" + pageSize2); // /ch16/list.do
			System.out.println("pageCnt2-->" + pageCnt2); // /ch16/list.do
			System.out.println("startPage2-->" + startPage2); // /ch16/list.do
			System.out.println("endPage2-->" + endPage2); // /ch16/list.do

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "movie/movieInfo.jsp";
	}
}
