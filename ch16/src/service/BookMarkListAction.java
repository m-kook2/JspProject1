package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import dao.BookmarkDto;
import dao.ReviewDao;
import dao.ReviewDto;

public class BookMarkListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// httpsession은 복수 page에 걸쳐 request에 의해 web사이트에 접속한 user를 식별해 그 user에 대한 정보를 제어할
		// 수 있는 법을 제공
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		// service에서 직접 객체생성해 변수에 저장하지 않고, 싱글톤 패턴에 따라 의존관계가 있는 클래스의 메소드를 호출해 인스턴스를 가져오기만
		// 하면 된다
		// 생성횟수를 1회로 한정시킨 것
		BookmarkDao bd = BookmarkDao.getInstance();

		try {
			int totIdCnt = bd.getIdCnt(id);

			// 정보를 받아오기 위한 것
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			// 정렬
			String str = request.getParameter("str") == null ? "" : request.getParameter("str");

			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totIdCnt - startRow + 1;
			List<BookmarkDto> list = bd.list(startRow, endRow, id, str);
			int pageCnt = (int) Math.ceil((double) totIdCnt / pageSize);
			int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if (endPage > pageCnt)
				endPage = pageCnt;

			// 다른 곳으로 정보를 넘겨주기 위한 것
			request.setAttribute("totIdCnt", totIdCnt);
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
			System.out.println("totIdCnt-->" + totIdCnt); // /ch16/list.do
			System.out.println("currentPage-->" + currentPage); // /ch16/list.do
			System.out.println("blockSize-->" + blockSize); // /ch16/list.do
			System.out.println("pageSize-->" + pageSize); // /ch16/list.do
			System.out.println("pageCnt-->" + pageCnt); // /ch16/list.do
			System.out.println("startPage-->" + startPage); // /ch16/list.do
			System.out.println("endPage-->" + endPage); // /ch16/list.do

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bookmark/bookMarkList.jsp";
	}

}
