<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.project.util.*"%>
<%@ include file = "/common/public.jsp" %>
<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('${root}/image/loginbg.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>
<%@ include file = "/facebook/facebook.jsp" %>
<%
	//String folder = "/member";

	//쿠키가 클라이언트에 저장되었는데 그 저장된 클라이언트의 쿠키를 가져온다
	Cookie cookie[] = request.getCookies(); //다른 브라우저를 가는등의 동작을 해도 로그인 되 있도록.
	
	String id = "";
	String ck = "";
	if (cookie != null) {
		int len = cookie.length;
		for (int i = 0; i < len; i++) {
			if("loginid".equals(cookie[i].getName())) {
				id = cookie[i].getValue();
				ck = " checked='checked'"; //체크박스에 체크유무를 나타내는 String
				break;
			}
		}
	}
%>

<script type = "text/javascript">
function login(){
	 if(document.getElementById("inputUsernameEmail").value == "") {
		 alert("이메일을 입력해주세요!");
	 }
	 else if(document.getElementById("inputPassword").value == "") {
		 alert("비밀번호를 입력해주세요!");
	 } else {
		document.loginform.action="${root}/user";
		document.loginform.submit();
		
	 }
}


</script>  
<br>
<br>
	<div class="container wrapper">
		<div class="col-md-1 col-lg-2"></div>
		<div class="col-sm-12 col-md-10 col-lg-8 bg1" style="border-top-left-radius: 20px; border-bottom-right-radius: 20px;">
			<div class="main">
			<br>
				<h3>
					로그인
				</h3>
				<br>

				<form name="loginform" role="form" method="post" action="">
				<input type="hidden" name="act" value="login">
					<div class="form-group">
						<label class="pull-right"><input type="checkbox" id="idsv" name="idsv" value="ok"<%=ck %>>아이디
							저장</label> <label for="inputUsernameEmail">아이디(이메일)</label> <input
							type="text" class="form-control" id="inputUsernameEmail" name="inputUsernameEmail" value="<%= id%>">
					</div>
					<div class="form-group">
						<a class="pull-right" href="${root}/user?act=mvfindPass">비밀번호 찾기</a> <label
							for="inputPassword">비밀번호</label> <input type="password"
							class="form-control" id="inputPassword" name="inputPassword" onkeypress="javascript:if(event.keyCode == 13) {login();}">
					</div>
				<div class="col-xs-6 col-sm-6 col-md-6">
					<button type="button" class="btn btn-lg btn-info btn-block" onclick="javascript:login();">로그인</button>
				</div>
				</form>
				<div class="col-xs-6 col-sm-6 col-md-6">
					<!-- 페이스북 로그인. 직접적으로 함수 호출 -->
					<button onclick="javascript:facebooklogin()" class="btn btn-lg btn-primary btn-block">Facebook</a>
				</div>
				 <br>
				<div class="row"></div>
				<br>
				<div class="or-box row-block">
						<a a href="${root}/user?act=mvjoin" class="btn btn-lg btn-primary btn-block">회원가입</a>
					<div class="col-xs-3 col-sm-3 col-md-3"></div>
					<br>
					<br>
				</div>
			</div>
		</div>
		<div class="col-md-1 col-lg-2"></div>
	</div>


<%@ include file = "/common/footer.jsp" %>

</body>
</html>