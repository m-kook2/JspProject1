package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.*;
import javax.naming.*;
public class ReviewDao {
	private static ReviewDao instance;
	private ReviewDao() {}
	public static ReviewDao getInstance() {
		if (instance == null) {	instance = new ReviewDao();		}
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
	
	public List<ReviewDto> list(int startRow, int endRow) throws SQLException {
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		Connection conn = null;	PreparedStatement pstmt= null;
		ResultSet rs = null;
		// String sql = "select * from board order by num desc";
	    // mysql select * from board order by num desc limit startPage-1,10;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			" (select * from review order by p_idx desc) a ) "+
			" where rn between ? and ?";
		 
		 
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewDto review = new ReviewDto();
				review.setP_idx(rs.getInt("P_idx"));
				review.setP_title(rs.getString("p_title"));
				review.setP_content(rs.getString("p_content"));
				review.setP_date(rs.getDate("p_date"));
				review.setId(rs.getString("id"));
				review.setM_idx(rs.getInt("m_idx"));
			
				list.add(review);
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
		String sql = "select count(*) from review";
		System.out.println("test select2");
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
	
	public ReviewDto select(int p_idx) throws SQLException {
		Connection conn = null;	Statement stmt= null; ResultSet rs = null;
		String sql = "select * from review where p_idx="+p_idx;
		System.out.println("test select");
		ReviewDto review = new ReviewDto();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println(sql);
			if (rs.next()) {				
				review.setP_idx(rs.getInt("p_idx"));
				review.setP_title(rs.getString("p_title"));
				review.setP_content(rs.getString("p_content"));
				review.setP_date(rs.getDate("p_date"));
				review.setId(rs.getString("id"));
				review.setM_idx(rs.getInt("m_idx"));
				
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
			if (rs !=null) rs.close();
		}
		return review;
	}
	
	
	public int delete(int p_idx) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;		   
		String sql="delete from review where p_idx=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_idx);
			result= pstmt.executeUpdate();
				
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public int update(ReviewDto review) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update review set p_title=?,p_content=?,p_date=sysdate where p_idx=?";
		System.out.println("update");
		System.out.println(sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getP_title());
			pstmt.setString(2, review.getP_content());
			pstmt.setInt(3, review.getP_idx());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	
	}
	
	
	public int insert(ReviewDto review) throws SQLException {
		int p_idx = review.getP_idx();		
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			ResultSet rs = null;
		String sql1 = "select nvl(max(p_idx),0) from review";
		String sql="insert into review values(?,?,?,sysdate,?,?)";
		try {			
			conn = getConnection();

			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			// key인 num 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?...)
			int number = rs.getInt(1) + 1;  
			rs.close();   pstmt.close();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, review.getP_title());
			pstmt.setString(3, review.getP_content());
			pstmt.setString(4, review.getId());
			pstmt.setInt(5, review.getM_idx());
			result = pstmt.executeUpdate(); 
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
}
