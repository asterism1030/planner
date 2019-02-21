<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "/common/public.jsp" %>
<style type="text/css">
body {
    background: url('${root}/image/loginbg.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>

<script type="text/javascript">
function login() {
	document.location.href = "${root}/user?act=mvlogin";
}

</script>

<body>
	<br><br><br><br>
	<div class="container">
		<div class="col-md-1 col-lg-2"></div>
		<div class="col-sm-12 col-md-10 col-lg-8 bg1">
			<div class="main">
				<h3>
					인증메일 전송 완료
				</h3>
				<br>

				<form name="loginform" role="form" method="post" action="">
				<input type="hidden" name="act" value="login">
					<div class="form-group">
						<label>변경된 비밀번호가 해당 이메일로 전송되었습니다.<br><br>
						변경된 비밀번호로 로그인해 주세요</label> 
					</div>

					<button type="button" class="btn btn-lg btn-info btn-block" onclick="javascript:login();">로그인 하기</button>
				</form> <br>
				
			</div>
	</div>

</body>
</html>