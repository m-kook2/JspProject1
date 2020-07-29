package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;

public class MovieDao {
	private static MovieDao instance;
	private MovieDao() {}
	public static MovieDao getInstance() {
		if (instance == null) {	instance = new MovieDao();		}
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
	
	
		public List<MovieDto> list(int startRow, int endRow) throws SQLException {
		List<MovieDto> list = new ArrayList<MovieDto>();
		Connection conn = null;	PreparedStatement pstmt= null;
		ResultSet rs = null;
		// String sql = "select * from movie_info order by num desc";
	// mysql select * from movie_info order by num desc limit startPage-1,10;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			" (select * from movie_info) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MovieDto movieDto = new MovieDto();
				movieDto.setM_idx(rs.getString("m_idx"));
				movieDto.setM_name(rs.getString("m_name"));
				movieDto.setM_genre(rs.getString("m_genre"));
				movieDto.setM_date(rs.getString("m_date"));
				movieDto.setM_nation(rs.getString("m_nation"));
				movieDto.setM_time(rs.getString("m_time"));
				movieDto.setM_rate(rs.getString("m_rate"));
				movieDto.setM_story(rs.getString("m_story"));
				movieDto.setM_cast(rs.getString("m_cast"));
				movieDto.setM_director(rs.getString("m_director"));
				movieDto.setM_photo(rs.getString("m_photo"));
				movieDto.setM_video(rs.getString("m_video"));
				movieDto.setM_poster(rs.getString("m_poster"));
				movieDto.setId(rs.getString("id"));
				list.add(movieDto);
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
			String sql = "select count(*) from movie_info";
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
		

	public MovieDto select(String m_idx) throws SQLException {
		Connection conn = null;	Statement stmt= null; ResultSet rs = null;
		String sql = "select * from movie_info where m_idx=" + m_idx;
		System.out.println("test select->" + sql);
		MovieDto mt = new MovieDto();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("rs.sql->" + sql);
			if (rs.next()) {				
				mt.setM_idx(rs.getString("m_idx"));
				mt.setM_name(rs.getString("m_name"));
				mt.setM_genre(rs.getString("m_genre"));
				mt.setM_date(rs.getString("m_date"));
				mt.setM_nation(rs.getString("m_nation"));
				mt.setM_time(rs.getString("m_time"));
				mt.setM_rate(rs.getString("m_rate"));
				mt.setM_story(rs.getString("m_story"));
				mt.setM_cast(rs.getString("m_cast"));
				mt.setM_director(rs.getString("m_director"));
				mt.setM_photo(rs.getString("m_photo"));
			}	
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return mt;
	}
	
	/*	
	public int insert(MovieDto movieDto) throws SQLException {
		int num = movieDto.getM_idx();		
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			ResultSet rs = null;
		String sql1 = "select nvl(max(num),0) from movieDto";
		String sql="insert into movieDto values(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		String sql2="update movieDto set re_step = re_step+1 where " +
			" ref=? and re_step > ?";
		try {			
			conn = getConnection();
			if (num != 0) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, movieDto.getRef());
				pstmt.setInt(2, movieDto.getRe_step());
				pstmt.executeUpdate();
				pstmt.close();
				movieDto.setRe_step(movieDto.getRe_step()+1);
				movieDto.setRe_level(movieDto.getRe_level()+1);
			}
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			// key인 num 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?...)
			int number = rs.getInt(1) + 1;  
			rs.close();   pstmt.close();
			if (num == 0) movieDto.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, movieDto.getWriter());
			pstmt.setString(3, movieDto.getSubject());
			pstmt.setString(4, movieDto.getContent());
			pstmt.setString(5, movieDto.getEmail());
			pstmt.setInt(6, movieDto.getReadcount());
			pstmt.setString(7, movieDto.getPasswd());
			pstmt.setInt(8, movieDto.getRef());
			pstmt.setInt(9, movieDto.getRe_step());
			pstmt.setInt(10, movieDto.getRe_level());
			pstmt.setString(11, movieDto.getIp());
			result = pstmt.executeUpdate(); 
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	public void readCount(int num) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		String sql="update movieDto set readcount=readcount+1 where num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);			
			pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
	}
	public int update(MovieDto movieDto) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update movieDto set subject=?,writer=?,email=?,"+
		                	"passwd=?,content=?,ip=? where num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieDto.getSubject());
			pstmt.setString(2, movieDto.getWriter());
			pstmt.setString(3, movieDto.getEmail());
			pstmt.setString(4, movieDto.getPasswd());
			pstmt.setString(5, movieDto.getContent());
			pstmt.setString(6, movieDto.getIp());
			pstmt.setInt(7, movieDto.getNum());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	public int delete(int num, String passwd) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;		    ResultSet rs = null;
		String sql1 = "select passwd from movieDto where num=?";
		String sql="delete from movieDto where num=?";
		try {
			String dbPasswd = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPasswd = rs.getString(1); 
				if (dbPasswd.equals(passwd)) {
					rs.close();  pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					result = pstmt.executeUpdate();
				} else result = 0;
			} else result = -1;
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
*/	

	
}