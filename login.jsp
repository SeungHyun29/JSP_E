<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
                list-style: none;
                text-decoration: none;
                border-collapse: collapse;
                margin: 0px;
                padding: 0px;
                color: black;
            }

            .intro_bg {
                background: linear-gradient(90deg, #3359CC 0% 20%, #fff 0% 50%);
                width: 100%;
                height: 750px;
            }

            .header {
                display: flex;
                width: 100%;
                margin: auto;
                background: #143779;
                height: 86px;
            }

            .logo > a > img {
            float:left;
            width: 150px;
            height: 30px;
            margin-left: 290px;
            margin-top: 28px;
}

            .logo>h1 {
                color: white;
            }

            .nav {
                display: flex;
                justify-content: flex-end;
                width: 60%;
                line-height: 86px;
                margin-right: 250px;
            }

            .nav>li {
                margin-left: 84px;
            }

            .nav>li>a>h4 {
                color: #fff;
            }

            .main {
                width: 100%;
                height: 1840px;
                margin: auto;
            }

            .wrap {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .login-form {
                border-radius: 30px;
                width: 500px;
                margin: 200px auto;
                padding: 20px;
                background: #f0f0f0;
                text-align: center;
                padding-top: 100px;
                padding-bottom: 100px;
            }

            .login-form input[type="text"] ,
            .login-form input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                box-sizing: border-box;
            }

            .login-form input[type="submit"] {
                border-radius: 15px;
                background: #143779;
                color: white;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
            }

            .login-form input[type="submit"]:hover {
                background: #143779;
            }
        </style>
        <script>
            function validateForm() {
                var std_id = document.forms["loginForm"]["std_id"].value;
                var std_pw = document.forms["loginForm"]["std_pw"].value;
                if (std_id == "" || std_pw == "") {
                    alert("모든 필드를 입력해주세요.");
                    return false;
                }
            }
        </script>
    </head>

    <body>
        <div class="wrap">
            <div class="header">
                <div class="logo">
                    <a href="./main.html">
                        <img src="img/main_logo.png">
                    </a>
                </div>
                <ul class="nav">
                    <li><a href="./login.jsp">
                            <h4>LOGIN</h4>
                        </a></li>
                    <li><a href="./myPage.jsp">
                            <h4>MyPage</h4>
                        </a></li>
                </ul>
            </div>

           
            <div class="login-form">
                <h2>Login</h2>
                <form action="loginProcess.jsp" method="post">
                    <input type="text" name="std_id" placeholder="Username" required>
                    <input type="password" name="std_pw" placeholder="Password" required>
                    <input type="submit" value="Login">
                </form>
            </div>
       
        </div>
    </body>

    </html>