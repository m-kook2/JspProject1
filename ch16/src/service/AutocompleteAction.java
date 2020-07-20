package service;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import dao.TestVO;

public class AutocompleteAction{
	public void autucomplete(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		List<TestVO> list=new ArrayList<TestVO>(); 
		TestVO vo=new TestVO();
		vo.setName("장산범");
		list.add(vo);
		TestVO vo2=new TestVO();
		vo2.setName("인터스텔라");
		list.add(vo2);
		TestVO vo3=new TestVO();
		vo3.setName("극한직업");
		list.add(vo3);
		JSONArray ja = new JSONArray();
		 for (int i = 0; i < list.size(); i++) {
			 ja.add(list.get(i).getName());
		 }
		 response.setCharacterEncoding("UTF-8");
		 PrintWriter out = response.getWriter();
		 
		 out.print(ja.toString());
	}
}