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
	
	public List<BookmarkDto> list(int startRow, int endRow, String id, String str) throws SQLException {
		List<BookmarkDto> list = new ArrayList<BookmarkDto>();
		Connection conn = null;	PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		 String sql = "select * from (select *" + 
		 		"		 from (select rownum rn, a.*" + 
		 		"		       from (select bk.id, bk.m_idx, bk.idx, bk.reg_date, mi.m_name, mi.m_photo, mi.m_genre, mi.m_date" + 
		 		"		             from book_mind bk, movie_info mi" + 
		 		"		             where bk.m_idx = mi.m_idx" + 
		 		"		             AND bk.id = ?) a )" + 
		 		"		 where rn between ? and ?) where 1=1 ";
		 StringBuffer buf=new StringBuffer();
		 System.out.println("sql : "+sql);
		 buf.append(sql);
		 if(str!=null && !str.equals("")) {
			 if(str.equals("1")) {
				 buf.append("	order by m_date desc");	 
			 }else if(str.equals("2")) {
				 buf.append("	order by m_genre desc");
			 }
			 
		 }
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(buf.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookmarkDto book = new BookmarkDto();
				book.setId(rs.getString("id"));
				book.setM_idx(rs.getInt("m_idx"));
				book.setIdx(rs.getInt("idx"));
				book.setM_genre(rs.getString("m_genre"));
				book.setM_name(rs.getString("m_name"));
				book.setM_photo(rs.getString("m_photo"));
				book.setM_date(rs.getDate("m_date"));
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
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}
		return result;
	}
}
