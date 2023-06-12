<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인/회원가입</title>
    <link rel="stylesheet" href="./index.css" />
    <script src="./index.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  </head>
  <body>
    <!-- 전체 컨테이너 -->
    <div class="Container">
      <!-- 여기서부터 회원가입 모달창 -->
      <div id="ModalContainer" onclick="CloseModal()"></div>
      <div id="SignupModalWrapper">
        <div class="SignupTitle">회원가입</div>
        <form action="saveUserInfo.jsp" method="post">
          <div class="SignupInputWrapper">
            <span class="SignupInputName">이름</span>
            <input
              id="SignupName"
              class="SignupInput"
              type="text"
              name="SignupName"
              placeholder="이름을 입력해 주세요"
            />
          </div>
          <div class="SignupInputWrapper">
            <span class="SignupInputName">학번</span>
            <input
              id="SignupPersonal1"
              class="SignupInput"
              type="text"
              name="SignupPersonal1"
              maxlength="8"
              placeholder="학번을 입력해 주세요"
            />
          </div>
          <div class="SignupInputWrapper">
            <span class="SignupInputName">핸드폰 번호</span>
            <div
              style="
                display: flex;
                justify-content: space-between;
                padding-bottom: 20px;
              "
            >
              <div style="display: felx">
                <input
                  id="PhoneNumber01"
                  class="SignupInput"
                  type="text"
                  name="PhoneNumber01"
                  maxlength="3"
                  value="010"
                  readonly
                /><span class="PhoneSlash">-</span
                ><input
                  id="PhoneNumber02"
                  class="SignupInput"
                  type="text"
                  name="PhoneNumber02"
                  maxlength="4"
                /><span class="PhoneSlash">-</span
                ><input
                  id="PhoneNumber03"
                  class="SignupInput"
                  type="text"
                  name="PhoneNumber03"
                  maxlength="4"
                />
              </div>
            </div>
          </div>
          <div class="SignupInputWrapper">
            <span class="SignupInputName">본인의 개발 분야</span>
            <input
              id="SignupPrefer"
              class="SignupInput"
              type="text"
              name="SignupPrefer"
              placeholder="백엔드 or 프론트엔드 등 희망 직무를 적어 주세요"
            />
          </div>
          <div class="SignupInputWrapper">
            <span class="SignupInputName">이메일</span>
            <input
              id="SignupEmail"
              class="SignupInput"
              type="text"
              name="SignupEmail"
              placeholder="이메일을 입력해 주세요"
            />
          </div>
          <div class="SignupInputWrapper">
            <span class="SignupInputName">비밀번호</span>
            <input
              id="SignupPwd"
              class="SignupInput"
              type="password"
              name="SignupPwd"
              placeholder="비밀번호를 입력해 주세요"
            />
          </div>
          <div class="ButtonWrapper">
            <button class="Signup" type="submit">회원 가입</button>
          </div>
        </form>
      </div>

      <!-- 여기까지가 회원가입 모달창 -->

      <!-- 본 컨텐츠 -->
      <div class="Wrapper">
        <div class="LogoWrapper">
          <!-- <img class="LogoImg" src="../img/starbucks.png" /> -->
          <div class="LogoTitle">COM-ON</div>
          <a href="./main.jsp" class="Menu_Button">
            커뮤니티 바로가기</a
          >
        </div>
        <div class="SignupWrapper">
          아직 회원이 아니신가요?
          <span class="SignupButton" onclick="OpenModal()">가입하기</span>
        </div>
      </div>
    </div>
  </body>
</html>
