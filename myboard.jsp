<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>
<%@ page import="java.sql.*, javax.naming.InitialContext, javax.naming.Context, javax.sql.DataSource" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  String loggedInUser = (String) session.getAttribute("loggedInUser");
  if (loggedInUser == null) {
    // 로그인되지 않은 상태로 접근한 경우, 메인 페이지로 리디렉션
    response.sendRedirect("main.jsp");
  }
%>
<%
    request.setCharacterEncoding("UTF-8"); // 요청의 문자 인코딩 설정

    // 데이터베이스 연결
    Context initContext = new InitialContext();
    Context envContext = (Context) initContext.lookup("java:/comp/env");
    DataSource ds = (DataSource) envContext.lookup("jdbc/comon");
    Connection conn = ds.getConnection();

    // SQL 쿼리 실행
    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM board1 WHERE std_id = ?");
    stmt.setString(1, loggedInUser); // 로그인된 사용자의 ID 값으로 설정
    ResultSet rs = stmt.executeQuery();

    // 게시글 목록을 담을 ArrayList 생성
    ArrayList<HashMap<String, Object>> boardList = new ArrayList<>();

    // 결과 처리
    while (rs.next()) {
        HashMap<String, Object> board = new HashMap<>();
        board.put("boardNum", rs.getInt("board_num"));
        board.put("boardTitle", rs.getString("board_title"));
        board.put("stdId", rs.getString("std_id"));
        board.put("postUpdate", rs.getString("createdAt"));
        boardList.add(board);
    }

    // 자원 해제
    rs.close();
    stmt.close();
    conn.close();

    // 게시글 목록을 request 속성에 저장
    request.setAttribute("boardList", boardList);
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
    <link rel="stylesheet" href="./css/css.css">
</head>
<body>
    <div class="header">
        <div class="logo">
          <a href="./userMain.jsp">
                <img src="./img/main_logo.png">
            </a>
        </div>
        <ul class="nav">
            <li><a href="./boardList.jsp">
                    <h4>게시글 목록</h4>
                </a></li>
            <li><a href="./boardWrite.jsp">
                    <h4>게시글 작성</h4>
                </a></li>

        </ul>
    </div>
    <div class="board_wrap">
      <div class="board_list_wrap">
          <div class="board_list">
              <div class="top">
                  <div class="num">번호</div>
                  <div class="title">제목</div>
                  <div class="writer">글쓴이</div>
                  <div class="date">작성일</div>
              </div>

              <!-- 게시글 목록을 반복해서 표시 -->
              <% 
              if (boardList != null && !boardList.isEmpty()) {
                  for (HashMap<String, Object> board : boardList) {
              %>
                <div>
                  <div class="num"><%= board.get("boardNum") %></div>
                  <div class="title"><a href="boardView.jsp?boardNum=<%= board.get("boardNum") %>"><%= board.get("boardTitle") %></a></div>
                  <div class="writer"><%= board.get("stdId") %></div>
                  <div class="date"><%= board.get("postUpdate") %></div>
                </div>
              <% 
                  }
              } else {
              %>
              <div class="no-data">게시글이 없습니다.</div>
              <% 
              }
              %>
          </div>
      </div>
  </div>
</body>
</html>
