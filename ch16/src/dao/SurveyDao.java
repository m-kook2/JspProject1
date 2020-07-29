package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SurveyDao {
  private static SurveyDao instance;

  private SurveyDao() {}

  public static SurveyDao getInstance() {
    if (instance == null) {
      instance = new SurveyDao();
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

  public List<SurveyDto> list(int startRow, int endRow) throws SQLException {
    List<SurveyDto> list = new ArrayList<SurveyDto>();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
    String sql = "SELECT s.*, sc.commCnt " + "FROM sur s, ( SELECT s_IDX, count(*) commCnt "
        + "              FROM s_comm " + "              GROUP BY s_IDX " + "              ) sc "
        + "WHERE s.S_IDX = sc.s_IDX(+) " + "AND  s.S_IDX between ? and ? ORDER BY s.S_IDX DESC";
    try {
      conn = getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, startRow);
      pstmt.setInt(2, endRow);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        SurveyDto surveyDto = new SurveyDto();
        surveyDto.setS_idx(rs.getInt(1));
        surveyDto.setS_sub(rs.getString(2));
        surveyDto.setS_sdate(rs.getDate(3));
        surveyDto.setS_edate(rs.getDate(4));
        surveyDto.setS_content(rs.getString(5));
        surveyDto.setS_op1(rs.getString(6));
        surveyDto.setS_op2(rs.getString(7));
        surveyDto.setS_op3(rs.getString(8));
        surveyDto.setS_op4(rs.getString(9));
        surveyDto.setS_op5(rs.getString(10));
        surveyDto.setId(rs.getString(11));
        surveyDto.setCommCnt(rs.getInt(12));
        surveyDto.setVotable(!rs.getDate(3).after(sqlDate) && !rs.getDate(4).before(sqlDate));
        list.add(surveyDto);
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
    String sql = "select count(*) from sur";
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

  public int insert(SurveyDto survey) throws SQLException {
    int result = 0;
    int s_idx = 0;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql1 = "select nvl(max(s_idx),1) from sur";
    String sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?)";
    try {
      conn = getConnection();
      pstmt = conn.prepareStatement(sql1);
      rs = pstmt.executeQuery();
      rs.next();
      s_idx = rs.getInt(1) + 1;
      rs.close();
      pstmt.close();
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, s_idx);
      pstmt.setString(2, survey.getS_sub());
      pstmt.setDate(3, survey.getS_sdate());
      pstmt.setDate(4, survey.getS_edate());
      pstmt.setString(5, survey.getS_content());
      pstmt.setString(6, survey.getS_op1());
      pstmt.setString(7, survey.getS_op2());
      pstmt.setString(8, survey.getS_op3());
      pstmt.setString(9, survey.getS_op4());
      pstmt.setString(10, survey.getS_op5());
      pstmt.setString(11, survey.getId());
      result = pstmt.executeUpdate();
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
    return result;
  }

}
