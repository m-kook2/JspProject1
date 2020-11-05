package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CSDao;
import dao.CSDto;

public class CSWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//csWriteForm에서 c_idx,pageNum, writer, ref, re_level, re_step, writer, content 정보를 받아옴
		try {
			System.out.println("writeProAction");
			System.out.println("pageNum ->" + request.getParameter("pageNum"));
			request.setCharacterEncoding("utf-8");
			//csWriteForm의 정보를 받아온다
			String pageNum = request.getParameter("pageNum");
			String c_idx_s = request.getParameter("c_idx");
			
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
			System.out.println("pageNum==>" + pageNum);
			System.out.println("c_idx==>" + c_idx);
			System.out.println("subject ->" + request.getParameter("subject"));
			System.out.println("writer ->" + request.getParameter("writer"));
			System.out.println("content ->" + request.getParameter("content"));
			
			//dto 변수명에 값 집어넣기
			CSDto cs = new CSDto();
			cs.setC_idx(c_idx);
			cs.setSubject(request.getParameter("subject"));
			cs.setWriter(request.getParameter("writer"));
			cs.setContent(request.getParameter("content"));
			System.out.println("ref=>" + cs.getRef());
			cs.setRef(Integer.parseInt(request.getParameter("ref")));
			
			//re_step이 null이거나 공백일 경우 생기는 오류를 잡기 위한 것
			String re_step_s = request.getParameter("re_step");
			int re_step;
			if (re_step_s == null || re_step_s == "") {
				re_step = 0;
			} else {
				re_step = Integer.parseInt(request.getParameter("re_step"));
			}
			
			cs.setRe_step(re_step);
			
			//re_level이 null이거나 공백일 경우 생기는 오류를 잡기 위한 것
			String re_level_s = request.getParameter("re_level");
			int re_level;
			if (re_level_s == null || re_level_s == "") {
				re_level = 0;
			} else {
				re_level = Integer.parseInt(request.getParameter("re_level"));
			}
			
			cs.setRe_level(re_level);

			System.out.println(cs.getWriter());
			System.out.println(cs.getContent());
			
			// service에서 직접 객체생성해 변수에 저장하지 않고, 싱글톤 패턴에 따라 의존관계가 있는 클래스의 메소드를 호출해 인스턴스를 가져오기만 하면 된다
			// 생성횟수를 1회로 한정시킨 것
			CSDao cd = CSDao.getInstance();
			int result = cd.insert(cs);
			
			// 다른 곳으로 정보를 넘겨주기 위한 것
			request.setAttribute("c_idx", cs.getC_idx());
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "cs/csWritePro.jsp";
	}

}
