package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			String pageNum = request.getParameter("pageNum");
			MovieDao md = MovieDao.getInstance();
			MovieDto mt = md.select(m_idx);
			System.out.println(pageNum);
			System.out.println(m_idx);
			System.out.println(mt);

			request.setAttribute("m_idx", m_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("mt", mt);
			int totCnt = cd.getTotalCnt();
			String pageNum2 = request.getParameter("pageNum2");
			if (pageNum2 == null || pageNum2.equals("")) {
				pageNum2 = "1";
			}
			String str = request.getParameter("str") == null ? "" : request.getParameter("str");
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
			List<CommDto> slist = cd2.list2(startRow, endRow, m_idx, str);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum2", pageNum2);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("slist", slist);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("comm2", comm2);
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
		return "movie/movieInfo.jsp";
	}
}
