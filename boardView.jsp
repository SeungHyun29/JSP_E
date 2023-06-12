<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.naming.InitialContext, javax.naming.Context, javax.sql.DataSource" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%

  request.setCharacterEncoding("UTF-8"); // 요청의 문자 인코딩 설정

  // 게시물 번호 파라미터 받기
  String boardNumParam = request.getParameter("boardNum");
  int boardNum = Integer.parseInt(boardNumParam);

  // 데이터베이스 연결
  Context initContext = new InitialContext();
  Context envContext = (Context) initContext.lookup("java:/comp/env");
  DataSource ds = (DataSource) envContext.lookup("jdbc/comon");
  Connection conn = ds.getConnection();

  try {
    // 게시물 조회 쿼리 실행
    String sql = "SELECT * FROM board1 WHERE board_num = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setInt(1, boardNum);
    ResultSet rs = stmt.executeQuery();

    // 결과 처리
    if (rs.next()) {
      String boardTitle = rs.getString("board_title");
      String content = rs.getString("content");
      Date createdAt = rs.getDate("createdAt");
      String stdId = rs.getString("std_id");

      // JSP 변수에 데이터 저장
      request.setAttribute("boardNum", boardNum);
      request.setAttribute("boardTitle", boardTitle);
      request.setAttribute("content", content);
      request.setAttribute("createdAt", createdAt);
      request.setAttribute("stdId", stdId);
    }

    rs.close();
    stmt.close();
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    // 연결 종료
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
  
  // 세션에서 로그인된 사용자 ID 가져오기
  HttpSession sessionObj = request.getSession();
  String loggedInUserID = (String) sessionObj.getAttribute("loggedInUser");
  
  // 댓글 작성 처리
  if (request.getMethod().equalsIgnoreCase("post")) {
    String commentContent = request.getParameter("comment");

    // 데이터베이스 연결
    conn = ds.getConnection();

    // 현재 시간을 가져오기
    LocalDateTime currentDateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String comment_create = currentDateTime.format(formatter);

    try {
      // 댓글 삽입 쿼리 실행
      String commentInsertSql = "INSERT INTO comment (std_id, board_num, comment, comment_create) VALUES (?, ?, ?, ?)";
      PreparedStatement commentInsertStmt = conn.prepareStatement(commentInsertSql);
      commentInsertStmt.setString(1, loggedInUserID);
      commentInsertStmt.setInt(2, boardNum);
      commentInsertStmt.setString(3, commentContent);
      commentInsertStmt.setString(4, comment_create);
      commentInsertStmt.executeUpdate();

      commentInsertStmt.close();
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      // 연결 종료
      if (conn != null) {
        try {
          conn.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
    }
    
    // 댓글 등록 후, 현재 페이지로 리다이렉트
    response.sendRedirect("boardView.jsp?boardNum=" + boardNum);
    return;
  }

  // 댓글 조회에 필요한 변수
  List<String> comments = new ArrayList<>();
  List<String> commentCreates = new ArrayList<>();
  List<String> commentWriters = new ArrayList<>();

  // 데이터베이스 연결
  conn = ds.getConnection();

  try {
    // 댓글 조회 쿼리 실행
    String commentSelectSql = "SELECT * FROM comment WHERE board_num = ?";
    PreparedStatement commentSelectStmt = conn.prepareStatement(commentSelectSql);
    commentSelectStmt.setInt(1, boardNum);
    ResultSet commentRs = commentSelectStmt.executeQuery();

    // 댓글 결과 처리
    while (commentRs.next()) {
      String commentContent = commentRs.getString("comment");
      String commentCreate = commentRs.getString("comment_create");
      String commentWriter = commentRs.getString("std_id");
      comments.add(commentContent);
      commentCreates.add(commentCreate);
      commentWriters.add(commentWriter);
    }

    commentRs.close();
    commentSelectStmt.close();
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    // 연결 종료
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }

%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
  <title>컴퓨터공학부만을 위한 커뮤니티, 컴-온</title>
  <link rel="stylesheet" href="./css/style.css">
</head>
<body>
  <div class="header">
    <div class="logo">
      <a href="./userMain.jsp">
        <img src="./img/main_logo.png">
      </a>
    </div>
    <ul class="nav">
      <li>
        <a href="./boardList.jsp">
          <h4>게시글 목록</h4>
        </a>
      </li>
      <li>
        <a href="./boardWrite.jsp">
          <h4>게시글 작성</h4>
        </a>
      </li>
    </ul>
  </div>
  <div class="board_wrap">
    <div class="board_view_wrap">
      <div class="board_view">
        <div class="title">
          <%= request.getAttribute("boardTitle") %>
        </div>
        <div class="info">
          <dl>
            <dt>번호</dt>
            <dd><%= request.getAttribute("boardNum") %></dd>
          </dl>
          <dl>
            <dt>글쓴이</dt>
            <dd><%= request.getAttribute("stdId") %></dd>
          </dl>
          <dl>
            <dt>작성일</dt>
            <dd><%= request.getAttribute("createdAt") %></dd>
          </dl>
        </div>
        <div class="cont">
          <%= request.getAttribute("content") %>
        </div>
        <div class="comment_wrap">
          <h2>댓글</h2>
          <!-- 댓글 작성 폼 -->
          <div class="comment_input">
            <form action="boardView.jsp?boardNum=<%= boardNum %>" method="post">
              <div class="comment_input_fields">
                <textarea class="comment" name="comment"></textarea>
                <button id="cmt_submit" type="submit">댓글 등록</button>
              </div>
            </form>
          </div>
          <!-- 댓글 목록 -->
          <div class="comment_list">
            <table class="comment_table">
              <thead>
                <tr>
                  <th>Num</th>
                  <th>comment</th>
                  <th>작성자</th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
                <% 
                // 댓글 목록을 반복하여 표시
                int commentNum = 1; // 댓글 번호 초기값 설정
                for (int i = 0; i < comments.size(); i++) {
                  String commentContent = comments.get(i);
                  String commentCreate = commentCreates.get(i);
                  String commentWriter = commentWriters.get(i);
                %>
                <tr>
                  <td><%= commentNum %></td>
                  <td><%= commentContent %></td>
                  <td><%= commentWriter %></td>
                  <td><%= commentCreate %></td>
                </tr>
                <% 
                commentNum++; // 댓글 번호 증가
                }
                %>
              </tbody>
            </table>
          </div>
          
        
        </div>
      </div>
      <div class="bt_wrap">
        <a href="./boardList.jsp" class="on">목록</a>
        <a href="boardEdit.jsp?boardNum=<%= boardNumParam %>">수정</a>
      </div>
    </div>
  </div>
</body>
</html>
