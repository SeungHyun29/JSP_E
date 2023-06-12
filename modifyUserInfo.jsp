<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
    <title>회원정보 수정</title>
    <link rel="stylesheet" type="text/css" href="modifyUserInfo.css">
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div class="logo">
                <h1>COM-ON</h1>
            </div>
            <ul class="nav">
                <li><a href="./main.jsp">
                        <h4>HOME</h4>
                    </a></li>
                <li><a href="./login.jsp">
                        <h4>LOGIN</h4>
                    </a></li>
                <li><a href="./myPage.jsp">
                        <h4>MyPage</h4>
                    </a></li>
            </ul>
        </div>
        <div class="setting">
            <h2>회원정보 수정</h2>

            <form id="userInfoForm" action="updateUserInfo.jsp" method="post">
                <div class="form-group">
                    <label for="username">사용자 이름</label>
                    <input type="text" id="username" name="username" placeholder="사용자 이름을 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="studentID">학번</label>
                    <input type="text" id="studentID" name="studentID" placeholder="학번을 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="phoneNumber">핸드폰 번호</label>
                    <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="핸드폰 번호를 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="devField">개발 분야</label>
                    <input type="text" id="devField" name="devField" placeholder="본인의 개발 분야를 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
                </div>
                
                <%-- 세션의 사용자 ID 값을 숨은 필드로 전송 --%>
                <input type="hidden" id="userID" name="userID" value="<%= session.getAttribute("loggedInUser") %>">

                <div class="form-group">
                    <input type="submit" value="저장">
                </div>
            </form>
        </div>
    </div>
</body>
</html>
