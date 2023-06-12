const OpenModal = () => {
  let ModalBackground = document.getElementById('ModalContainer')
  let Modal = document.getElementById('SignupModalWrapper')
  ModalBackground.style.display = 'flex'
  Modal.style.display = 'flex'
}
const CloseModal = () => {
  let ModalBackground = document.getElementById('ModalContainer')
  let Modal = document.getElementById('SignupModalWrapper')
  Modal.style.display = 'none'
  ModalBackground.style.display = 'none'
}

const submitSignup = () => {
  // 입력된 값을 가져옵니다.
  const std_id = document.getElementById('SignupPersonal1').value;
  const std_name = document.getElementById('SignupName').value;
  const std_tel = document.getElementById('PhoneNumber01').value + document.getElementById('PhoneNumber02').value + document.getElementById('PhoneNumber03').value;
  const field = document.getElementById('SignupPrefer').value;
  const std_email = document.getElementById('SignupEmail').value;
  const std_pw = document.getElementById('SignupPwd').value;

  // 데이터를 서버로 전송합니다.
  axios.post('signup.jsp', {
    std_id: std_id,
    std_name: std_name,
    std_tel: std_tel,
    field: field,
    std_email: std_email,
    std_pw: std_pw
  })
  .then(function (response) {
    // 성공적으로 회원가입이 완료된 경우
    console.log(response.data);
    alert('회원가입이 완료되었습니다.');
  })
  .catch(function (error) {
    // 회원가입 실패한 경우
    console.log(error);
    alert('회원가입에 실패했습니다.');
  });
};

