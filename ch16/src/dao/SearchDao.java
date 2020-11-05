package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SearchDao {
	private static SearchDao instance;

	private SearchDao() {
	}

	public static SearchDao getInstance() {
		if (instance == null) {
			instance = new SearchDao();
		}
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public List<SearchDto> search(String str) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<SearchDto> list = new ArrayList<SearchDto>();
		ResultSet rs = null;
		String sql = "SELECT M_NAME FROM MOVIE_INFO WHERE M_NAME LIKE '%"+str+"%' OR M_GENRE LIKE '%"+str+"%' OR M_DIRECTOR LIKE '%"+str+"%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SearchDto vo=new SearchDto();
				vo.setName(rs.getString("M_NAME"));
				list.add(vo);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}
	
}
