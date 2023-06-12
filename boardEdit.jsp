<%@ page import="java.sql.*, javax.naming.InitialContext, javax.naming.Context, javax.sql.DataSource, java.sql.Timestamp" %>

<%
    request.setCharacterEncoding("UTF-8"); // 요청의 문자 인코딩 설정   
  if (request.getMethod().equalsIgnoreCase("post")) {
    // 게시물 번호 파라미터 받기
    String boardNumParam = request.getParameter("boardNum");
    int boardNum = Integer.parseInt(boardNumParam);

    // 수정한 제목과 내용 받기
    String updatedTitle = request.getParameter("title");
    String updatedContent = request.getParameter("contents");

    // 데이터베이스 연결
    Context initContext = new InitialContext();
    Context envContext = (Context) initContext.lookup("java:/comp/env");
    DataSource ds = (DataSource) envContext.lookup("jdbc/comon");
    Connection conn = ds.getConnection();

    try {
      // 게시물 수정 쿼리 실행
      String sql = "UPDATE board1 SET board_title = ?, content = ?, createdAt = ? WHERE board_num = ?";
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setString(1, updatedTitle);
      stmt.setString(2, updatedContent);

      // 현재 시간을 java.sql.Timestamp 객체로 생성
      Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
      stmt.setTimestamp(3, currentTimestamp);

      stmt.setInt(4, boardNum);
      int rowsAffected = stmt.executeUpdate();

      if (rowsAffected > 0) {
        // 수정 성공
        response.sendRedirect("boardView.jsp?boardNum=" + boardNum);
      } else {
        // 수정 실패
        response.sendRedirect("boardList.jsp");
      }

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
  } else {
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
      String sql = "SELECT board_title, content FROM board1 WHERE board_num = ?";
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setInt(1, boardNum);
      ResultSet rs = stmt.executeQuery();

      // 결과 처리
      if (rs.next()) {
        String boardTitle = rs.getString("board_title");
        String content = rs.getString("content");

        // JSP 변수에 데이터 저장
        request.setAttribute("boardNum", boardNum);
        request.setAttribute("boardTitle", boardTitle);
        request.setAttribute("content", content);
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
    <title>통합 사담 게시판 - 컴퓨터공학부만을 위한 커뮤니티, 컴-온</title>
    <link rel="stylesheet" href="css/css.css">
</head>
<body>
    <div class="header">
        <div class="logo">
            <a href="./userMain.jsp">
                <img src="img/main_logo.png">
            </a>
        </div>
        <ul class="nav">
            <li><a href="./boardList.jsp">
                    <h4>게시글 목록</h4>
                </a></li>
            <li><a href="./boardWrite.jsp">
                    <h4>게시글 작성</h4>
                </a></li>
            <li><a href="./boardEdit.jsp">
                    <h4>게시글 수정</h4>
                </a></li>
        </ul>
    </div>
    <div class="board_wrap">
        <div class="board_write_wrap">
            <div class="board_write">
                <h2>통합 사담 게시판</h2>
                <form method="post" action="">
                  <div class="title">
                      <dl>
                          <dt>제목</dt>
                          <dd><input type="text" placeholder="제목 입력" name="title" value="<%= request.getAttribute("boardTitle") %>"></dd>
                      </dl>
                  </div>
                  <div class="cont">
                      <textarea placeholder="내용 입력" name="contents"><%= request.getAttribute("content") %></textarea>
                  </div>
                  <div class="bt_wrap">
                      <button type="submit">수정</button>
                      <button type="button" onclick="window.location.href='boardView.jsp?boardNum=<%= request.getAttribute("boardNum") %>'">취소</button>
                  </div>
                  <input type="hidden" name="boardNum" value="<%= request.getAttribute("boardNum") %>">
                </form>
            </div>
        </div>
    </div>

</body>
</html>
