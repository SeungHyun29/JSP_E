<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
    <title>취업도우미게시판-자격증</title>
    <link rel="stylesheet" type="text/css" href="competitions.css" >
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
            </div>
            <div class="job-board">
                <h1>취업 도우미 게시판</h1>
                <nav>
                    <ul class="menu-bar">
                        <li class= "menu1"><a href="career.html">취업 관련 사이트</a></li>
                        <li class= "menu2"><a href="certifications.html">자격증</a></li>
                        <li class= "menu3"><a href="competitions.html">공모전 사이트</a></li>
                    </ul>
                </nav>

                <p>*사이트 이름을 클릭시, 관련 링크로 이동합니다.</p>

                <table>
                    <tr>
                      <th>공모전 사이트</th>
                      <th>사이트 명</th>
                    </tr>
                    <tr>
                      <td><img src="img/link.png" alt="이미지 설명"></td>
                      <td><a href="https://linkareer.com/" target="_blank">링커리어</a></td>
                    </tr>
                    <tr>
                        <td><img src="img/think.png" alt="이미지 설명"></td>
                        <td><a href="https://www.thinkcontest.com/thinkgood/index.do#PxyyoRLHIcgvNg6HiHNz_mp_cuclMrohRDGEjn6hvDsggetrTQxNWBBQR1mPnaRxjI93xVlR_kFjCl9g5hFBO1N6UGMkDhLA2ecFAf6UhFU" target="_blank">씽굿</a></td>
                      </tr>
                      <tr>
                        <td><img src="img/wevity.png" alt="이미지 설명"></td>
                        <td><a href="https://www.wevity.com/" target="_blank">위비티</a></td>
                      </tr>
                      <tr>
                        <td><img src="img/campus.png" alt="이미지 설명"></td>
                        <td><a href="https://www.campuspick.com/" target="_blank">캠퍼스픽</a></td>
                      </tr>
                
                  </table>

                
            </div> 
        </div>
    </div>
</body>
</html>
