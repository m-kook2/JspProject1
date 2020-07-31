package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import service.StringUtil;

public class SCommDao {
  private static SCommDao instance;

  private SCommDao() {}

  public static SCommDao getInstance() {
    if (instance == null) {
      instance = new SCommDao();
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

  public int getSurCnt(int s_idx) throws SQLException {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    int sCnt = 0;
    String sql = "select count(*) from s_comm where s_idx = " + s_idx;
    try {
      conn = getConnection();
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      if (rs.next())
        sCnt = rs.getInt(1);
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

    return sCnt;
  }

  public List<SCommDto> list(int startRow, int endRow, int s_idx) throws SQLException {
    List<SCommDto> list = new ArrayList<SCommDto>();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
    String sql =    "SELECT a.*  " + 
                    "FROM (     SELECT rownum rn, sc.* " + 
                    "           FROM (  SELECT sc.*, m.nickname " + 
                    "                   FROM s_comm sc, member m " + 
        "                               WHERE sc.id = m.id) sc " + 
        "                       WHERE S_IDX = ?         " + 
        "                       ORDER BY R_IDX) a" + 
        "            WHERE RN BETWEEN ? AND ?";
    
    System.out.println("SCommDao List SQL =>" + sql);
    try {
      conn = getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, s_idx);
      pstmt.setInt(2, startRow);
      pstmt.setInt(3, endRow);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        SCommDto comment = new SCommDto();
        comment.setS_idx(s_idx);
        comment.setId(rs.getString(3));
        comment.setR_idx(rs.getInt(4));
        comment.setR_op(rs.getString(5));
        comment.setR_content(rs.getString(6));
        String dateString = format.format(rs.getDate(7));
        comment.setR_regdate(StringUtil.NullToEmpty(dateString));
        comment.setNickname(rs.getString(8));
        list.add(comment);
      }
    } catch (Exception e) {
      System.out.println("SCommDao list ERROR!!!");
      System.out.println(e.getMessage());
    } finally {
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close();
      if(conn != null) conn.close();
    }
    return list;
  }

  public int insert(SCommDto comment) throws SQLException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = 
        "INSERT INTO S_COMM VALUES("
                                  + "?,"
                                  + "?,"
                                  + "(select max(r_idx)+1 from s_comm),"
                                  + "?,"
                                  + "?,"
                                  + "SYSDATE"
                                  + ")";
    System.out.println("SCommDao INSERT SQL => " + sql);
    int result = 0;
    
    int s_idx = comment.getS_idx();
    String id = comment.getId();
    String r_op = comment.getR_op();
    String r_content = comment.getR_content();
    
    try {
      conn = getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, s_idx);
      pstmt.setString(2, id);
      pstmt.setString(3, r_op);
      pstmt.setString(4, r_content);
      result = pstmt.executeUpdate();
      
      
    } catch (Exception e) {
      System.out.println("SCommDao Insert ERROR!!");
      System.out.println(e.getMessage());
    } finally {

      if (pstmt != null)
        pstmt.close();
      if (conn != null)
        conn.close();
    }
    return result;
  }
}


