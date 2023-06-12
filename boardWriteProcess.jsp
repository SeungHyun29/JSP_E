<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.time.LocalDateTime, java.time.format.DateTimeFormatter, javax.naming.*, javax.sql.DataSource, java.util.Enumeration" %>
<%
request.setCharacterEncoding("UTF-8"); // 요청의 문자 인코딩 설정

  // 데이터베이스 연결
  Context initContext = null;
  Context envContext = null;
  DataSource ds = null;
  Connection conn = null;

  // 게시글 작성 폼에서 전송된 데이터 가져오기
  String title = request.getParameter("title");
  String contents = request.getParameter("contents");

  // 현재 시간을 가져오기
  LocalDateTime currentDateTime = LocalDateTime.now();
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
  String createdAt = currentDateTime.format(formatter);

  // 세션에서 로그인된 사용자 ID 가져오기
  String loggedInUser = (String) session.getAttribute("loggedInUser");
  String stdId = null;

  // 데이터베이스 연결 및 사용자 ID 가져오기
  try {
    initContext = new InitialContext();
    envContext = (Context) initContext.lookup("java:/comp/env");
    ds = (DataSource) envContext.lookup("jdbc/comon");
    conn = ds.getConnection();
    String query = "SELECT std_id FROM user_info WHERE std_id = ?";
    PreparedStatement statement = conn.prepareStatement(query);
    statement.setString(1, loggedInUser); // 로그인한 사용자의 아이디로 설정
    ResultSet resultSet = statement.executeQuery();
    if (resultSet.next()) {
      stdId = resultSet.getString("std_id");
    }
    resultSet.close();
    statement.close();
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (conn != null) {
        conn.close();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  // DB 연결 및 게시글 데이터 삽입
  try {
    conn = ds.getConnection();
    String insertQuery = "INSERT INTO board1 (board_title, content, createdAt, std_id) VALUES (?, ?, ?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(insertQuery);
    pstmt.setString(1, title);
    pstmt.setString(2, contents);
    pstmt.setString(3, createdAt);
    pstmt.setString(4, stdId); // 수정된 부분
    pstmt.executeUpdate();
    pstmt.close();
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (conn != null) {
        conn.close();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
%>

<script>
  window.location.href = "boardList.jsp"; // 게시글 목록 페이지로 이동
</script>
