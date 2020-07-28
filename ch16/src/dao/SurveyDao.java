package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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

  public List<Survey> list(int startRow, int endRow) throws SQLException {
    List<Survey> list = new ArrayList<Survey>();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM sur WHERE S_IDX between ? and ? ORDER BY S_IDX DESC";
    try {
      conn = getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, startRow);
      pstmt.setInt(2, endRow);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        Survey survey = new Survey();
        survey.setS_idx(rs.getString(1));
        survey.setS_sub(rs.getString(2));
        survey.setS_sdate(rs.getDate(3));
        survey.setS_edate(rs.getDate(4));
        survey.setS_content(rs.getString(5));
        survey.setS_op1(rs.getString(6));
        survey.setS_op2(rs.getString(7));
        survey.setS_op3(rs.getString(8));
        survey.setS_op4(rs.getString(9));
        survey.setS_op5(rs.getString(10));
        survey.setId(rs.getString(11));
        list.add(survey);
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

}
