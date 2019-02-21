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

	//��Ű�� Ŭ���̾�Ʈ�� ����Ǿ��µ� �� ����� Ŭ���̾�Ʈ�� ��Ű�� �����´�
	Cookie cookie[] = request.getCookies(); //�ٸ� �������� ���µ��� ������ �ص� �α��� �� �ֵ���.
	
	String id = "";
	String ck = "";
	if (cookie != null) {
		int len = cookie.length;
		for (int i = 0; i < len; i++) {
			if("loginid".equals(cookie[i].getName())) {
				id = cookie[i].getValue();
				ck = " checked='checked'"; //üũ�ڽ��� üũ������ ��Ÿ���� String
				break;
			}
		}
	}
%>

<script type = "text/javascript">
function login(){
	 if(document.getElementById("inputUsernameEmail").value == "") {
		 alert("�̸����� �Է����ּ���!");
	 }
	 else if(document.getElementById("inputPassword").value == "") {
		 alert("��й�ȣ�� �Է����ּ���!");
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
					�α���
				</h3>
				<br>

				<form name="loginform" role="form" method="post" action="">
				<input type="hidden" name="act" value="login">
					<div class="form-group">
						<label class="pull-right"><input type="checkbox" id="idsv" name="idsv" value="ok"<%=ck %>>���̵�
							����</label> <label for="inputUsernameEmail">���̵�(�̸���)</label> <input
							type="text" class="form-control" id="inputUsernameEmail" name="inputUsernameEmail" value="<%= id%>">
					</div>
					<div class="form-group">
						<a class="pull-right" href="${root}/user?act=mvfindPass">��й�ȣ ã��</a> <label
							for="inputPassword">��й�ȣ</label> <input type="password"
							class="form-control" id="inputPassword" name="inputPassword" onkeypress="javascript:if(event.keyCode == 13) {login();}">
					</div>
				<div class="col-xs-6 col-sm-6 col-md-6">
					<button type="button" class="btn btn-lg btn-info btn-block" onclick="javascript:login();">�α���</button>
				</div>
				</form>
				<div class="col-xs-6 col-sm-6 col-md-6">
					<!-- ���̽��� �α���. ���������� �Լ� ȣ�� -->
					<button onclick="javascript:facebooklogin()" class="btn btn-lg btn-primary btn-block">Facebook</a>
				</div>
				 <br>
				<div class="row"></div>
				<br>
				<div class="or-box row-block">
						<a a href="${root}/user?act=mvjoin" class="btn btn-lg btn-primary btn-block">ȸ������</a>
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