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

public class SearchDAO {
	private static SearchDAO instance;

	private SearchDAO() {
	}

	public static SearchDAO getInstance() {
		if (instance == null) {
			instance = new SearchDAO();
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

	public List<SearchVO> search(String str) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<SearchVO> list = new ArrayList<SearchVO>();
		ResultSet rs = null;
		String sql = "SELECT M_NAME FROM MOVIE_BOARD WHERE M_NAME LIKE '%"+str+"%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SearchVO vo=new SearchVO();
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
