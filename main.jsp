<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  // 세션 무효화
  session.invalidate();
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COM-ON</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
    <div class="wrap">
        <div class="intro_bg">
            <div class="header">
                <div class="logo">
                    <a href="./main.jsp">
                        <img src="img/main_logo.png">
                    </a>
                </div>
                <ul class="nav">
                    <li><a href="./login.jsp">
                            <h4>LOGIN</h4>
                        </a></li>
                    <li><a href="./main.jsp">
                            <h4>MyPage</h4>
                        </a></li>
                </ul>
            </div>
            <div class="intro_text">
                <h2>오직 컴퓨터공학부만의</h2>
                <h2>커뮤니티를 모은</h2>
                <h1>COM-ON</h1>
                <br><br><br><br><br><br>
                <h4>내가 아는 개발 이슈부터 정보 공유까지, 학우들과 함께해요.</h4>
            </div>

            <div class="main">
                <div class="board1">
                    <div class="content1">
                        <h2>컴공 학우들과 나누는<br>개발 이야기</h2>
                        <br>
                        <h4>여러분이 알고 있는 개발 이슈를 남겨 주세요.<br>
                            오로지 컴퓨터공학부만을 위한 통합 게시판에서<br>
                            서로의 정보를 나눠 줄게요<br>
                            함께 개발 이야기할까요?</h4><br>
                        <a href="boardList.jsp"><button class="board_button">게시판</button></a>
                    </div>
                    <div class="board1_img">
                        <img src="img/board1.jpg">
                    </div>
                </div>
                <div class="board2">
                    <div class="board2_img">
                        <img src="img/board2.jpg">
                    </div>
                    <div class="content2">
                        <h2>취업 도움 게시판 둘러보기</h2>
                        <br>
                        <h4>여러분이 알고 있는 개발 이슈를 남겨 주세요.<br>
                            오로지 컴퓨터공학부만을 위한 통합 게시판에서<br>
                            서로의 정보를 나눠 줄게요<br>
                            함께 개발 이야기할까요?</h4><br>
                        <a href="career.html"><button class="board_button">게시판</button></a>
                    </div>

                </div>
                <div class="board1">
                    <div class="content1">
                        <h2>컴공 학우들과 나누는<br>개발 이야기</h2>
                        <br>
                        <h4>여러분이 알고 있는 개발 이슈를 남겨 주세요.<br>
                            오로지 컴퓨터공학부만을 위한 통합 게시판에서<br>
                            서로의 정보를 나눠 줄게요<br>
                            함께 개발 이야기할까요?</h4><br>
                        <a href="#"><button class="board_button">게시판</button></a>
                    </div>
                    <div class="board1_img">
                        <img src="img/board1.jpg">
                    </div>
                </div>
                <div class="board2">
                    <div class="board2_img">
                        <img src="img/board2.jpg">
                    </div>
                    <div class="content2">
                        <h2>컴퓨터공학부 공지사항</h2>
                        <br>
                        <h4>여러분이 알고 있는 개발 이슈를 남겨 주세요.<br>
                            오로지 컴퓨터공학부만을 위한 통합 게시판에서<br>
                            서로의 정보를 나눠 줄게요<br>
                            함께 개발 이야기할까요?</h4><br>
                        <a href="#"><button class="board_button">게시판</button></a>
                    </div>

                </div>
            </div>
            <div class="footer">
                <div>COM-ON</div>
                <div>
                    (주)컴뮤니티 천안시 동남구 백석대학로 1 7층 716호<br>
                    Made by 2023 BAEKSEOK UNIVERSITY.
                </div>
            </div>
        </div>

    </div>
</body>

</html>