package service;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import dao.SearchDAO;
import dao.SearchVO;

public class AutocompleteAction{
	public void autucomplete(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		SearchDAO dao=SearchDAO.getInstance();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String str=request.getParameter("keyWord");
		System.out.println("str "+str);
		try {
			List<SearchVO> list = dao.search(str);
			if(list !=null){
				JSONArray ja = new JSONArray();
				for (int i = 0; i < list.size(); i++) {
					ja.add(list.get(i).getName());
				}
				PrintWriter out = response.getWriter();
				out.print(ja.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}