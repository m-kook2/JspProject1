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
	
	
		public List<MovieDto> list(int startRow, int endRow, String str) throws SQLException {
			List<MovieDto> list = new ArrayList<MovieDto>();
			Connection conn = null;	PreparedStatement pstmt= null;
			ResultSet rs = null;
			// String sql = "select * from movie_info order by num desc";
			// mysql select * from movie_info order by num desc limit startPage-1,10;
			String sql = "select * from (select rownum rn ,a.* from (select * from movie_info) a )  where 1=1";
			StringBuffer strBuffer=new StringBuffer();
			strBuffer.append(sql);
			if(str != null && !str.equals("")){
				strBuffer.append("	AND M_NAME LIKE '%"+str+"%' OR M_GENRE LIKE '%"+str+"%' OR M_DIRECTOR LIKE '%"+str+"%'");
			}
			strBuffer.append("and rn between ? and ?");
			System.out.println(strBuffer.toString());
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(strBuffer.toString());
//				pstmt = conn.prepareStatement(sql);
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

		public int getTotalCnt(String str) throws SQLException {
			Connection conn = null;	Statement stmt= null; 
			ResultSet rs = null;    int tot = 0;
			String sql = "select count(*) from movie_info where 1=1";
			StringBuffer strBuffer=new StringBuffer();
			strBuffer.append(sql);
			if(str != null && !str.equals("")){
				strBuffer.append("	AND M_NAME LIKE '%"+str+"%' OR M_GENRE LIKE '%"+str+"%' OR M_DIRECTOR LIKE '%"+str+"%'");
			}
			try {
				conn = getConnection();
				stmt = conn.createStatement();
//				rs = stmt.executeQuery(strBuffer.toString());
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
				mt.setM_photo(rs.getString("m_photo"));
				mt.setM_director(rs.getString("m_director"));
				mt.setM_video(rs.getString("m_video"));
				mt.setM_poster(rs.getString("m_poster"));
			}	
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return mt;
	}

	public int insert(MovieDto movieDto) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		int number = 0;
		int result = 0;			
		String sql1 = "select nvl(max(m_idx),0) from movie_info";
		String sql= "insert into movie_info values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1) + 1;			
			} else {
				if (number == 0) {
					number = 1;
				}
			}
			rs.close();
			pstmt.close();
			
			if (number != 0) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, number);
				pstmt.setString(2, movieDto.getM_name());
				pstmt.setString(3, movieDto.getM_genre());
				pstmt.setString(4, movieDto.getM_date());
				pstmt.setString(5, movieDto.getM_nation());
				pstmt.setString(6, movieDto.getM_time());
				pstmt.setString(7, movieDto.getM_rate());
				pstmt.setString(8, movieDto.getM_story());
				pstmt.setString(9, movieDto.getM_cast());
				pstmt.setString(10, movieDto.getM_director());
				pstmt.setString(11, movieDto.getM_photo());
				pstmt.setString(12, movieDto.getM_video());
				pstmt.setString(13, movieDto.getM_poster());
				pstmt.setString(14, movieDto.getId());
				result=pstmt.executeUpdate();
				pstmt.close();

			}

			} catch(Exception e) {System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	public int update(MovieDto movieDto) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;
		String sql="update movie_info set m_name=?,m_genre=?,m_date=to_date(?),m_nation=?,m_time=?,m_rate=?,"+
				"m_story=?,m_cast=?,m_director=?," + "m_photo=?,m_video=?,m_poster=?,"
				+ "id=? where m_idx=?";
		
		System.out.println("update movie_info set m_name="+movieDto.getM_name()+",m_genre="+movieDto.getM_genre()+",m_date=to_date("+movieDto.getM_date()+",m_nation="+movieDto.getM_nation()+",m_time="+movieDto.getM_time()+",m_rate="+movieDto.getM_rate()+",m_story="+movieDto.getM_story()+",m_cast="+movieDto.getM_cast()+",m_director="+movieDto.getM_director()+",m_photo="+movieDto.getM_photo()+",m_video="+movieDto.getM_video()+",m_poster="+movieDto.getM_poster()+", id="+movieDto.getId()+" where m_idx="+movieDto.getM_idx());
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieDto.getM_name());
			pstmt.setString(2, movieDto.getM_genre());
			pstmt.setString(3, movieDto.getM_date());
			pstmt.setString(4, movieDto.getM_nation());
			pstmt.setString(5, movieDto.getM_time());
			pstmt.setString(6, movieDto.getM_rate());
			pstmt.setString(7, movieDto.getM_story());
			pstmt.setString(8, movieDto.getM_cast());
			pstmt.setString(9, movieDto.getM_director());
			pstmt.setString(10, movieDto.getM_photo());
			pstmt.setString(11, movieDto.getM_video());
			pstmt.setString(12, movieDto.getM_poster());
			pstmt.setString(13, movieDto.getId());
			pstmt.setString(14, movieDto.getM_idx());
			result = pstmt.executeUpdate();
			System.out.println(movieDto.getId());
			System.out.println(movieDto.getM_nation());
			System.out.println(movieDto.getM_photo());
			System.out.println(movieDto.getM_nation());
			System.out.println(movieDto.getM_poster());
			System.out.println("update result : " + result);
		} catch (Exception e) {
			System.out.println("MovieDao update ERROR!!");
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}

	
	
	public int delete(String m_idx) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;		    
		String sql="delete from movie_info where m_idx=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_idx);
			result = pstmt.executeUpdate();
		
		} catch(Exception e) {
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}


	
}