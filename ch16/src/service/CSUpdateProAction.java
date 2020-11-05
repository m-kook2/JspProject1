package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CSDao;
import dao.CSDto;
import dao.ReviewDao;
import dao.ReviewDto;

public class CSUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			// csUpdateForm에서  c_idx, pageNum, subject, content 정보를 받아옴
			request.setCharacterEncoding("utf-8");
			//csUpdateForm의 정보를 받아온다
			String pageNum = request.getParameter("pageNum");
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");

			System.out.println(c_idx);
			System.out.println(subject);
			System.out.println(content);

			//dto 변수명에 값 집어넣기
			CSDto cs = new CSDto();
			cs.setC_idx(c_idx);
			cs.setSubject(subject);
			cs.setContent(content);

			// service에서 직접 객체생성해 변수에 저장하지 않고, 싱글톤 패턴에 따라 의존관계가 있는 클래스의 메소드를 호출해 인스턴스를 가져오기만 하면 된다
			// 생성횟수를 1회로 한정시킨 것
			CSDao cd = CSDao.getInstance();
			int result = cd.update(cs);
			System.out.println(result);
			
			// 다른 곳으로 정보를 넘겨주기 위한 것
			request.setAttribute("result", result);
			request.setAttribute("c_idx", cs.getC_idx());
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "cs/csUpdatePro.jsp";
	}
}
