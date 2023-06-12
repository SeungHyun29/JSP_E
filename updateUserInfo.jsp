<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.net.URLEncoder" %>

<%
  request.setCharacterEncoding("UTF-8"); // 요청의 문자 인코딩 설정

  // 데이터베이스 연결
  Context initContext = new InitialContext();
  Context envContext = (Context) initContext.lookup("java:/comp/env");
  DataSource ds = (DataSource) envContext.lookup("jdbc/comon");
  Connection conn = ds.getConnection();

  // 세션에서 로그인된 사용자 ID 가져오기
  HttpSession sessionObj = request.getSession();
  String loggedInUserID = (String) sessionObj.getAttribute("loggedInUser");

  // 파라미터 가져오기
  String studentID = request.getParameter("studentID");
  String username = request.getParameter("username");
  String phoneNumber = request.getParameter("phoneNumber");
  String devField = request.getParameter("devField");
  String email = request.getParameter("email");
  String password = request.getParameter("password");

  if (loggedInUserID.equals(studentID)) {
    // 학번이 일치하는 경우, 회원정보 수정
    String updateUserInfoQuery = "UPDATE user_info SET std_name = ?, std_tel = ?, field = ?, std_email = ?, std_pw = ? WHERE std_id = ?";
    PreparedStatement updateUserInfoStmt = conn.prepareStatement(updateUserInfoQuery);
    updateUserInfoStmt.setString(1, username);
    updateUserInfoStmt.setString(2, phoneNumber);
    updateUserInfoStmt.setString(3, devField);
    updateUserInfoStmt.setString(4, email);     
    updateUserInfoStmt.setString(5, password);
    updateUserInfoStmt.setString(6, studentID);
    updateUserInfoStmt.executeUpdate();

    // 회원정보 수정 완료 메시지 출력
    out.println("<script>alert('회원정보가 수정되었습니다.'); window.location.href = 'userMain.jsp';</script>");

    updateUserInfoStmt.close();
  } else {
    // 학번이 일치하지 않는 경우
    String encodedURL = URLEncoder.encode("modifyUserInfo.jsp", "UTF-8");
    out.println("<script>alert('학번이 일치하지 않습니다.'); window.location.href = '"
            + encodedURL + "';</script>");
  }

  // 연결 해제
  conn.close();
%>
