<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   
   
<%@include file="/common/public.jsp" %>
<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('${root}/image/joinbg.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>
<script type = "text/javascript">
function gologin() {
	document.gologinform.action="${root}/user?act=mvlogin";
}


</script>  

<br>
<div class="container wrapper">
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 
col-md-offset-1 col-lg-offset-1 bg1" align="center">
<img src="<%=root %>/image/Welcome-Banner.png" style="width: 100%;">
<h2>회원가입을 축하합니다~!</h2><br>
<b>모든 서비스는 로인후 이용가능합니다.</b><br>
&nbsp;<br>

<div class="col-xs-8 col-sm-8 col-md-6 col-lg-6 
col-xs-offset-2 col-sm-offset-2 col-md-offset-3 col-lg-offset-3 bg1" align="center">
<form name="gologinform" method="post" action="">
<input type="hidden" name="act" value="mvlogin">
<button class="btn btn-lg btn-primary btn-block" onclick="javascript:gologin();">로그인하기</button>
</form>
</div>
<br>&nbsp;
<br>&nbsp;
</div>
</div>




<%@ include file="/common/footer.jsp" %>

</body>
</html>