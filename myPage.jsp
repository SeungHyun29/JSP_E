<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String loggedInUser = (String) session.getAttribute("loggedInUser");
  
  // 데이터베이스 연결 및 사용자 이름 가져오기
  String userName = null;
  try {
    Context initContext = new InitialContext();
    Context envContext = (Context) initContext.lookup("java:/comp/env");
    DataSource ds = (DataSource) envContext.lookup("jdbc/comon");
    Connection conn = ds.getConnection();
    String query = "SELECT std_name FROM user_info WHERE std_id = ?";
    PreparedStatement statement = conn.prepareStatement(query);
    statement.setString(1, loggedInUser); // 로그인한 사용자의 아이디로 설정
    ResultSet resultSet = statement.executeQuery();
    if (resultSet.next()) {
      userName = resultSet.getString("std_name");
    }
    resultSet.close();
    statement.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
    <title>컴퓨터공학부만을 위한 커뮤니티, 컴-온</title>
    <link rel="stylesheet" type="text/css" href="myPage.css" >
</head>
<body>
    <div class="wrap">
        <div class="intro_bg">
            <div class="header">
                <div class="logo">
                    <a href="./userMain.jsp">
                        <img src="img/main_logo.png">
                    </a>
                </div>
                <ul class="nav">
                    <li><a href="./main.jsp">
                            <h4>LOGOUT</h4>
                        </a></li>
                    <li><a href="./myPage.jsp">
                            <h4>MyPage</h4>
                        </a></li>
                </ul>
            </div>
              <div class="intro_text1">
                <h2>백석대학교 컴퓨터공학부 커뮤니티 컴-온</h2>
              </div>
               <div class="intro_text">
                <h1>COM-ON</h1>
              </div>
    
              <div class="mypage">
                <h1><%= userName %></h1>
                <input type="button" id="mbtn" name="" value="회원정보 수정" onClick="location.href='modifyUserInfo.jsp'"><br>
                <input type="button" id="mbtn1" name="" value="스크랩 조회" onClick="location.href='scrap.html'"><br>
                <input type="button" id="mbtn2" name="" value="게시글 조회" onClick="location.href='myboard.jsp'"><br>      
              </div>
          
        </div>
    </div>
</body>
</html>
