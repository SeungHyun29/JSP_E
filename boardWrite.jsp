<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  String loggedInUser = (String) session.getAttribute("loggedInUser");
  if (loggedInUser == null) {
    // 로그인되지 않은 상태로 접근한 경우, 메인 페이지로 리디렉션
    response.sendRedirect("main.jsp");
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
            
        </ul>
    </div>
    <div class="board_wrap">
        <div class="board_write_wrap">
            <div class="board_write">
                <h2>통합 사담 게시판</h2>
                <form action="boardWriteProcess.jsp" method="POST">
                    <div class="title">
                        <dl>
                            <dt>제목</dt>
                            <dd><input type="text" placeholder="제목 입력" name="title"></dd>
                        </dl>
                    </div>
                    <div class="cont">
                        <textarea placeholder="내용 입력" name="contents"></textarea>
                    </div>
                    <div class="bt_wrap">
                        <button type="submit">등록</button>
                        <button type="button" onclick="cancel()">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
