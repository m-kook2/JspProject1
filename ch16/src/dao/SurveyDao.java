package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import util.StringUtil;

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
    Date today = new Date();
    SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
    String sql = "SELECT rowSC.* " + "FROM (SELECT rownum r, surComm.* "
        + "      FROM (SELECT  s.s_idx, " + "                    s.s_sub, "
        + "                    to_char(s_sdate,'yyyy/mm/dd') as s_sdate, "
        + "                    to_char(s_edate,'YYYY/mm/dd') as s_edate, "
        + "                    s.s_content, " + "                    s.s_op1, "
        + "                    s.s_op2, " + "                    s.s_op3, "
        + "                    s.s_op4, " + "                    s.s_op5, "
        + "                    s.id, " + "                    nvl(sc.commCnt,0)  "
        + "            FROM sur s, ( SELECT s_idx, COUNT(*) commCnt "
        + "                          FROM s_comm " + "                          GROUP BY s_idx) sc "
        + "            WHERE s.s_idx = sc.s_idx(+) "
        + "            ORDER by s.s_idx desc) surComm) rowSC " + "WHERE r between ? and ?";
    System.out.println(sql);
    System.out.println("SQL 문 출력 완료");
    try {
      conn = getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, startRow);
      pstmt.setInt(2, endRow);
      rs = pstmt.executeQuery();


      while (rs.next()) {
        SurveyDto surveyDto = new SurveyDto();
        surveyDto.setS_idx(rs.getInt(2));
        surveyDto.setS_sub(rs.getString(3));
        System.out.println(StringUtil.NullToEmpty(rs.getString(4)));
        System.out.println(StringUtil.NullToEmpty(rs.getString(5)));
        surveyDto.setS_sdate(StringUtil.NullToEmpty(rs.getString(4)));
        surveyDto.setS_edate(StringUtil.NullToEmpty(rs.getString(5)));
        surveyDto.setS_content(rs.getString(6));
        surveyDto.setS_op1(rs.getString(7));
        surveyDto.setS_op2(rs.getString(8));
        surveyDto.setS_op3(rs.getString(9));
        surveyDto.setS_op4(rs.getString(10));
        surveyDto.setS_op5(rs.getString(11));
        surveyDto.setId(rs.getString(12));
        surveyDto.setCommCnt(rs.getInt(13));
        if (StringUtil.NullToEmpty(rs.getString(4)).equals("")
            || StringUtil.NullToEmpty(rs.getString(5)).equals("")) {
          surveyDto.setVotable(true);
        } else {
          surveyDto.setVotable(!format.parse(rs.getString(4)).after(today)
              && !format.parse(rs.getString(5)).before(today));
        }
        list.add(surveyDto);
      }
    } catch (Exception e) {
      System.out.println("ERROR!!");
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
    String sql = "INSERT INTO sur VALUES(?,?,?,?,?,?,?,?,?,?,?)";
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
      pstmt.setString(3, survey.getS_sdate());
      pstmt.setString(4, survey.getS_edate());
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

  public SurveyDto select(int s_idx) throws SQLException {
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    String sql =
        "select  s_idx, " + "        s_sub, " + "        to_char(s_sdate,'yyyy/mm/dd') as s_sdate, "
            + "        to_char(s_edate,'yyyy/mm/dd') as s_edate, " + "        s_content, "
            + "        s_op1, " + "        s_op2, " + "        s_op3, " + "        s_op4, "
            + "        s_op5, " + "        Id " + "from sur  " + "where s_idx = ?";
    SurveyDto surveyDto = new SurveyDto();;
    System.out.println(sql);
    Date today = new Date();
    SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
    String sqlCount = "SELECT COUNT(*) FROM S_COMM WHERE S_IDX = ?";
    String sqlOpCount =
        "SELECT count(id), r_op " + "FROM S_COMM " + "WHERE s_idx = ? " + "GROUP BY r_op ";
    try {
      conn = getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, s_idx);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        surveyDto.setS_idx(rs.getInt(1));
        surveyDto.setS_sub(rs.getString(2));
        surveyDto.setS_sdate(StringUtil.NullToEmpty(rs.getString(3)));
        surveyDto.setS_edate(StringUtil.NullToEmpty(rs.getString(4)));
        surveyDto.setS_content(rs.getString(5));
        surveyDto.setS_op1(rs.getString(6));
        surveyDto.setS_op2(rs.getString(7));
        surveyDto.setS_op3(rs.getString(8));
        surveyDto.setS_op4(rs.getString(9));
        surveyDto.setS_op5(rs.getString(10));
        surveyDto.setId(rs.getString(11));
        if (StringUtil.NullToEmpty(rs.getString(3)).equals("")
            || StringUtil.NullToEmpty(rs.getString(4)).equals("")) {
          surveyDto.setVotable(true);
        } else {
          System.out.println("투표 참여 가능 여부 체크");
          System.out.println("----------------------");
          System.out.println("오늘 : " + format.format(today));
          System.out.println("시작 : " + rs.getString(3));
          System.out.println("종료 : " + rs.getString(4));
          System.out.println("----------------------");

          surveyDto.setVotable(!format.parse(rs.getString(3)).after(today)
              && !format.parse(rs.getString(4)).before(today));
        }
      }
      rs.close();
      pstmt.close();
      pstmt = conn.prepareStatement(sqlCount);
      pstmt.setInt(1, s_idx);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        System.out.println("commCnt=> " + rs.getInt(1));
        surveyDto.setCommCnt(rs.getInt(1));
      }

      rs.close();
      pstmt.close();
      pstmt = conn.prepareStatement(sqlOpCount);
      pstmt.setInt(1, s_idx);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        switch (rs.getString(2)) { // R_OP
          case "1":
            surveyDto.setOp1Cnt(rs.getInt(1)); // Count(id) Group By R_OP
            break;
          case "2":
            surveyDto.setOp2Cnt(rs.getInt(1));
            break;
          case "3":
            surveyDto.setOp3Cnt(rs.getInt(1));
            break;
          case "4":
            surveyDto.setOp4Cnt(rs.getInt(1));
            break;
          case "5":
            surveyDto.setOp5Cnt(rs.getInt(1));
            break;
          default :
            System.out.println("비정상적인 투표 감지");
        }
        

      }

      System.out.println("Op1 Count => " + surveyDto.getOp1Cnt());
      System.out.println("Op2 Count => " + surveyDto.getOp2Cnt());
      System.out.println("Op3 Count => " + surveyDto.getOp3Cnt());
      System.out.println("Op4 Count => " + surveyDto.getOp4Cnt());
      System.out.println("Op5 Count => " + surveyDto.getOp5Cnt());
      
      
    } catch (Exception e) {
      System.out.println("SurveyDao select ERROR!!!");
      System.out.println(e.getMessage());
    } finally {
      if (rs != null)
        rs.close();
      if (pstmt != null)
        pstmt.close();
      if (conn != null)
        conn.close();
    }

    return surveyDto;
  }

  public int delete(int s_idx) throws SQLException {

    int result1 = 0;
    int result2 = 0;
    Connection conn = null;
    PreparedStatement pstmt = null;

    String sqlComm = "DELETE FROM s_comm WHERE s_idx = ?";
    String sqlSur = "DELETE FROM sur WHERE s_idx = ?";
    try {
      conn = getConnection();
      pstmt = conn.prepareStatement(sqlComm);
      System.out.println(sqlComm);
      pstmt.setInt(1, s_idx);
      result1 = pstmt.executeUpdate();
      System.out.println("result1=>" + result1);
      pstmt.close();
      pstmt = conn.prepareStatement(sqlSur);
      System.out.println(sqlSur);
      pstmt.setInt(1, s_idx);
      result2 = pstmt.executeUpdate();
      System.out.println("result1=>" + result2);
    } catch (Exception e) {
      System.out.println("surveyDao delete() ERROR!!!");
      System.out.println(e.getMessage());
    } finally {
      if (pstmt != null)
        pstmt.close();
      if (conn != null)
        conn.close();
    }
    return result2;
  }

}
