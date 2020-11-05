package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.CSDao;
import dao.ReviewDao;

public class CSDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			//CSDeleteForm에서 c_idx, pageNum의 정보를 받아옴
		try {
			//CSDeleteForm의 정보를 받아온다
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			String pageNum = request.getParameter("pageNum");
			
			// service에서 직접 객체생성해 변수에 저장하지 않고, 싱글톤 패턴에 따라 의존관계가 있는 클래스의 메소드를 호출해 인스턴스를 가져오기만 하면 된다
			// 생성횟수를 1회로 한정시킨 것
			CSDao cd = CSDao.getInstance();
			int result = cd.delete(c_idx);
			
			// 다른 곳으로 정보를 넘겨주기 위한 것
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("c_idx", c_idx);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "cs/csDeletePro.jsp";
	}

}
