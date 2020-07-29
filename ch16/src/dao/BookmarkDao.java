package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookmarkDao {
	private static BookmarkDao instance;
	
	private BookmarkDao() {
	}
	
	public static BookmarkDao getInstance() {
		if(instance == null) { instance = new BookmarkDao();  }
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { System.out.println(e.getMessage());	}
		return conn;
	}
	
	public List<BookmarkDto> list(int startRow, int endRow, String id) throws SQLException {
		List<BookmarkDto> list = new ArrayList<BookmarkDto>();
		Connection conn = null;	PreparedStatement pstmt= null;
		ResultSet rs = null;
		// String sql = "select * from board order by num desc";
	    // mysql select * from board order by num desc limit startPage-1,10;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			" (select * from book_mind where id=? order by idx desc) a ) "+
			" where rn between ? and ?";
		 
		 
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookmarkDto book = new BookmarkDto();
				book.setId(rs.getString("id"));
				book.setMind(rs.getString("mind"));
				book.setM_idx(rs.getInt("m_idx"));
				book.setIdx(rs.getInt("idx"));
				book.setReg_date(rs.getDate("reg_date"));
			
				list.add(book);
			}
			
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}
	
	public int getTotalCnt() throws SQLException {
		Connection conn = null;	Statement stmt= null; 
		ResultSet rs = null;    int tot = 0;
		String sql = "select count(*) from book_mind";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}

	public int getIdCnt(String id) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from book_mind where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}

	
	public int delete(String id, int m_idx) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
	    int result = 0;
		String sql = "delete from book_mind where id=? and m_idx=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, m_idx);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}
		return result;
	}
}
