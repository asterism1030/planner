<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@include file = "/common/public.jsp" %>
<style type="text/css">
body {
    background: url('${root}/image/joinbg.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>

<div class="container">
	<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 
	col-md-offset-1 col-lg-offset-1 bg1" align="center">
		&nbsp;<br>
		<img src="${root}/image/loginfail.jpg" style="width: 100%;">
		<h2>��� ���񽺴� �α��� �� �̿밡���մϴ�.</h2><br>
		&nbsp;<br>
		
		<div class="col-xs-8 col-sm-8 col-md-6 col-lg-6 
		col-xs-offset-2 col-sm-offset-2 col-md-offset-3 col-lg-offset-3 bg1" align="center">
			
			<div class="col-xs-8 col-sm-8 col-md-6 col-lg-6" >
				<a a href="${root}/user?act=mvlogin" class="btn btn-lg btn-primary btn-block">�α���</a>
			</div >
			
			<div class="col-xs-8 col-sm-8 col-md-6 col-lg-6">
				<a a href="${root}/user?act=mvjoin" class="btn btn-lg btn-primary btn-block">ȸ������</a>
			</div>
			<br>&nbsp;<br>&nbsp;
		</div>
		<br>&nbsp;
		<br>&nbsp;
	</div>
</div>

<%@include file="/common/footer.jsp" %>