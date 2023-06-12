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
  String stdId = request.getParameter("std_id");
  String stdPw = request.getParameter("std_pw");

  // 입력값이 없는 경우
  if (stdId.isEmpty() || stdPw.isEmpty()) {
    String errorMessage = "아이디와 비밀번호의 값을 모두 입력해주세요!";
    %>
    <script>
      alert('<%= errorMessage %>');
      window.location.href = 'login.jsp'; // 확인 버튼을 누르면 login.jsp로 이동
    </script>
    <%
  } else {
    // 아이디와 패스워드 확인
    String query = "SELECT COUNT(*) FROM user_info WHERE std_id = ? AND std_pw = ?";
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setString(1, stdId);
    pstmt.setString(2, stdPw);
    ResultSet resultSet = pstmt.executeQuery();

    if (resultSet.next() && resultSet.getInt(1) > 0) {
      // 로그인 성공
      String successMessage = "로그인에 성공하였습니다!";
      String loggedInUserID = stdId; 
      session.setAttribute("loggedInUser", stdId); // 사용자 정보를 세션에 저장
      session.setAttribute("loggedInUserPassword", stdPw);

      %>
      <script>
        alert('<%= successMessage %>');
        window.location.href = 'userMain.jsp'; // 로그인 성공 시 userMain.jsp로 이동
      </script>
      <%
    } else {
      // 아이디 또는 패스워드가 일치하지 않는 경우
      String checkIdQuery = "SELECT COUNT(*) FROM user_info WHERE std_id = ?";
      PreparedStatement checkIdStmt = conn.prepareStatement(checkIdQuery);
      checkIdStmt.setString(1, stdId);
      ResultSet checkIdResult = checkIdStmt.executeQuery();

      if (checkIdResult.next() && checkIdResult.getInt(1) > 0) {
        // 아이디는 존재하지만 패스워드가 일치하지 않는 경우
        String passwordErrorMessage = "비밀번호를 확인해주세요!";
        %>
        <script>
          alert('<%= passwordErrorMessage %>');
          window.location.href = 'login.jsp'; // 확인 버튼을 누르면 login.jsp로 이동
        </script>
        <%
      } else {
        // 아이디가 존재하지 않는 경우
        String signupErrorMessage = "회원가입을 먼저 해주세요!";
        %>
        <script>
          alert('<%= signupErrorMessage %>');
          window.location.href = 'index.jsp'; // 확인 버튼을 누르면 index.jsp로 이동
        </script>
        <%
      }

      checkIdResult.close();
      checkIdStmt.close();
    }

    resultSet.close();
    pstmt.close();
  }

  // 연결 해제
  conn.close();
%>
