<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@include file = "../nav.jsp" %>

<link rel="stylesheet" type="text/css" href="assets/css/login_out/find_password.css">



<title>비밀번호 찾기 완료</title>




  <div class="col-lg-9 col-md-9 Findtab">
    <ul class="nav nav-pills Findtab" role="tablist">
      <li class="nav-item active">
        <a class="nav-link" href="starters?cmd=findId">아이디 찾기</a>
      </li>

      <li class="nav-item">
        <a class="nav-link active" href="starters?cmd=findpw">비밀번호 찾기</a>
      </li>
    </ul>
  </div>


<div class="password_container">
	<form class="form-horizontal" role="form" method="POST">
		<div class="form">
			<div class="row">
			<div class="col-md-12 h2m">
					<h2>비밀번호 찾기</h2>
					<h6>회원가입 시 사용한 비밀번호는 <strong>${fn:substring(pw, 0, 4)}
					<c:forEach begin="1" end="${fn:length(pw)-4}">
							*
							</c:forEach>
						</strong>입니다.</h6>
			</div>
		</div>

		</div>
		<div class="row">
			<div class="col-md-10 inputbb">
					<!-- <a type="submit" class="btn loginbtn" href="starters?cmd=login">로그인 화면으로 돌아가기</a> -->
		                    <button type="button" class="btn btn-outline-secondary loginbtn" onclick = "backToLogin()">로그인 화면으로 돌아가기</button>

			</div>
		</div>
	</form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	var backToLogin = function(){
		location.href = "starters?cmd=login";
	};
</script>