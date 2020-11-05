package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;
import dao.CSDao;
import dao.CSDto;

public class CSWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				//csView에서 c_idx와 pageNum을 받아온다
		try {
			int ref = 0, re_level = 0, re_step = 0;
			
			// httpsession은 복수 page에 걸쳐 request에 의해 web사이트에 접속한 user를 식별해 그 user에 대한 정보를 제어할 수 있는 법을 제공
			HttpSession session = request.getSession();
			String writer = (String) session.getAttribute("id");
			String pageNum = request.getParameter("pageNum");
			String c_idx_s = request.getParameter("c_idx");
			String ref_s = request.getParameter("ref");
			
			//ref가 null이거나 공백일 경우 생기는 오류를 잡기 위한 것
			if (ref_s == null || ref_s == "") {
				ref = 0;
			} else {
				ref = Integer.parseInt(request.getParameter("ref"));
			}

			System.out.println("pageNum1 =>" + pageNum);
			
			//c_idx가 null이거나 공백일 경우 생기는 오류를 잡기 위한 것
			int c_idx;
			if (c_idx_s == null || c_idx_s == "") {
				c_idx = 0;
			} else {
				c_idx = Integer.parseInt(request.getParameter("c_idx"));
			}
			
			//pageNum이 null이거나 공백일 경우 생기는 오류를 잡기 위한 것
			if (pageNum == null || pageNum == "")
				pageNum = "1";
			System.out.println("pageNum2 =>" + pageNum);

			System.out.println("ref 1 =>" + ref);
			
			// 댓글의 정보를 받아오기 위한 것
			if (request.getParameter("c_idx") != null) {
				c_idx = Integer.parseInt(request.getParameter("c_idx"));
				
				// service에서 직접 객체생성해 변수에 저장하지 않고, 싱글톤 패턴에 따라 의존관계가 있는 클래스의 메소드를 호출해 인스턴스를 가져오기만 하면 된다
				// 생성횟수를 1회로 한정시킨 것
				CSDao cd = CSDao.getInstance();
				CSDto cs = cd.select(c_idx);
				ref = cs.getRef();
				re_level = cs.getRe_level();
				re_step = cs.getRe_step();
			}

			System.out.println("ref 2 =>" + ref);

			// 다른 곳으로 정보를 넘겨주기 위한 것
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("c_idx", c_idx);
			request.setAttribute("writer", writer);
			request.setAttribute("ref", ref);
			request.setAttribute("re_level", re_level);
			request.setAttribute("re_step", re_step);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "cs/csWriteForm.jsp";

	}

}
