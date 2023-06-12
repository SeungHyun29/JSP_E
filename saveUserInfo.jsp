<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.net.URLEncoder" %>

<%
  request.setCharacterEncoding("UTF-8"); // 요청의 문자 인코딩 설정

  // 데이터베이스 연결
  Context initContext = new InitialContext();
  Context envContext = (Context) initContext.lookup("java:/comp/env");
  DataSource ds = (DataSource) envContext.lookup("jdbc/comon");
  Connection conn = ds.getConnection();

  // 파라미터 가져오기
  String stdId = request.getParameter("SignupPersonal1");
  String stdName = request.getParameter("SignupName");
  String stdTel = request.getParameter("PhoneNumber01") + "-" + request.getParameter("PhoneNumber02") + "-" + request.getParameter("PhoneNumber03");
  String field = request.getParameter("SignupPrefer");
  String stdEmail = request.getParameter("SignupEmail");
  String stdPw = request.getParameter("SignupPwd");

  // 현재 날짜 및 시간 가져오기
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

  // 중복 확인
  String checkQuery = "SELECT COUNT(*) FROM user_info WHERE std_id = ?";
  PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
  checkStmt.setString(1, stdId);
  ResultSet resultSet = checkStmt.executeQuery();

  if (resultSet.next() && resultSet.getInt(1) > 0) {
    // 이미 가입된 학번인 경우
    String errorMessage = "이미bvhnh 가입되어 있는 학번입니다!";
    %>
    <script>
      alert('<%= errorMessage %>');
      window.location.href = 'index.jsp'; // 확인 버튼을 누르면 바로 index.jsp로 이동
    </script>
    <%
  } else {
    // 가입 처리
    // SQL 쿼리 실행
    String query = "INSERT INTO user_info (std_id, std_name, std_tel, field, std_email, std_pw) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setString(1, stdId);
    pstmt.setString(2, stdName);
    pstmt.setString(3, stdTel);
    pstmt.setString(4, field);
    pstmt.setString(5, stdEmail);
    pstmt.setString(6, stdPw);
    pstmt.executeUpdate();
    pstmt.close();

    String successMessage = "회원가입에 성공하였습니다!";
    %>
    <script>
      alert('<%= successMessage %>');
      window.location.href = 'index.jsp';
    </script>
    <%
  }

  // 연결 해제
  resultSet.close();
  checkStmt.close();
  conn.close();
%>
