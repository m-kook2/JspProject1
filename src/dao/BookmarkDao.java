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
		if (instance == null) {
			instance = new BookmarkDao();
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

	public List<BookmarkDto> list(int startRow, int endRow, String id, String str) throws SQLException {
		// arraylist란 list 인터페이스를 상속받은 클래스로 크기가 가변적으로 변하는 선형리스트이다
		// 일반적인 배열과 같은 순차리스트이며 인덱스로 내부의 객체를 관리한다는점등이 유사하지만 한번 생성되면 크기가 변하지 않는 배열과는 달리
		// arraylist는 객체들이 추가되어 저장용량을 초과한다면 자동으로 부족한 크기만큼 저장 용량이 늘어난다는 특징을 가지고 있다
		List<BookmarkDto> list = new ArrayList<BookmarkDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// rownum은 의사 컬럼으로 참조만 될 뿐 데이터베이스에 저장되지 않는다
		// select절에 추출되는 데이터(row)에 붙는 순번이다
		// 다시 말해 where절까지 만족시킨 자료에 1부터 붙는 순번이다
		String sql = "select * from (select rownum rn, a.*"
				+ "		       from (select bk.id, bk.m_idx, bk.idx, bk.reg_date, mi.m_name, mi.m_poster, mi.m_genre, mi.m_date"
				+ "		             from book_mind bk, movie_info mi where bk.m_idx = mi.m_idx"
				+ "		             AND bk.id = ? ";
		// where 1=1은 참을 의미하고 where 1=2는 거짓을 의미한다
		// where 1=1을 붙이지 않으면 조건이 성립되지않는다고 오류가 뜰 수 있기 때문에 일반적으로 붙여준다
		// string 클래스의 인스턴스는 한 번 생성되면 그 값을 읽기만 할 수 있고 변경할 수는 없다
		// 하지만 StringBuffer 클래스의 인스턴스는 그 값을 변경할 수도 있고 추가할 수도 있다
		StringBuffer buf = new StringBuffer();
		System.out.println("sql : " + sql);
		// append는 선택된 요소의 마지막에 새로운 요소나 콘텐츠를 추가할 수 있다
		buf.append(sql);
		if (str != null && !str.equals("")) {
			if (str.equals("1")) {
				buf.append("	order by m_date) a ) where rn between ? and ?");
			} else if (str.equals("2")) {
				buf.append("	order by m_genre) a ) where rn between ? and ?");
			} else if (str.equals("3")) {
				buf.append("    order by idx) a ) where rn between ? and ?");
			} else if (str.equals("4")) {
				buf.append("    order by idx desc) a ) where rn between ? and ?");
			} 
		} else {
			buf.append("    order by idx desc) a ) where rn between ? and ?");
		}
		System.out.println("SQL=>" + buf.toString());
		try {
			conn = getConnection();
			// buf.append가 쿼리문 뒤에 붙어서 가기 때문에 그것을 연결해주기 위해서 buf.tostring을 써준다
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
				book.setM_poster(rs.getString("m_poster"));
				book.setM_date(rs.getDate("m_date"));
				book.setReg_date(rs.getDate("reg_date"));

				list.add(book);
			}

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

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from book_mind";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return tot;
	}

	public int getIdCnt(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from book_mind where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				tot = rs.getInt(1);
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
		return tot;
	}

	public int delete(String id, int m_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		int idx= 0;
		String sql1 = "select idx from book_mind where id=? and m_idx=?";
		String sql2 = "delete from book_mind where id=? and m_idx=?";
		String sql3 = "update book_mind set idx = idx-1 where idx > ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, id);
			pstmt.setInt(2, m_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idx = rs.getInt(1);
			}
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, id);
			pstmt.setInt(2, m_idx);
			result = pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	public List<BookmarkDto> bdExcelDown(String id) throws SQLException {
		List<BookmarkDto> list = new ArrayList<BookmarkDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select bm.id, mi.m_name, mi.m_genre, mi.m_date from book_mind bm, movie_info mi where bm.m_idx = mi.m_idx and bm.id=?";
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookmarkDto bd = new BookmarkDto();
				bd.setId(rs.getString("id"));
				bd.setM_name(rs.getString("m_name"));
				bd.setM_genre(rs.getString("m_genre"));
				bd.setM_date(rs.getDate("m_date"));
				list.add(bd);
			}
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
	
	public int insert(int m_idx, String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select max(idx) from book_mind where id=?";
		String sql = "insert into book_mind values(?,?,?,sysdate)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, m_idx);
			pstmt.setInt(3, number);
			result = pstmt.executeUpdate();
					
	}	catch (Exception e) {
		System.out.println(e.getMessage());
	} finally {
		if (conn != null)
			conn.close();
		if (pstmt != null)
			pstmt.close();
		if (rs != null)
			rs.close();
	}
	return result;
	}

	public boolean check(String id, String m_idx) throws SQLException {
		boolean isbook = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from book_mind where m_idx = ? and id =?";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_idx);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isbook = true;
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		}
		return isbook;
		
	}	
}
