<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "com.project.member.model.*"%>
<%
	String root = request.getContextPath();
	MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
	String loginmethod = "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 

<title>Bootstrap Example</title>
<link rel="stylesheet" href="<%=root%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=root %>/css/tabmenu.css">
<script type="text/javascript" src="<%=root %>/js/httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="<%=root%>/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=root %>/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=root %>/css/material.min.css" />
<link rel="stylesheet" href="<%=root %>/css/bootstrap-material-datetimepicker.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script type="text/javascript" src="<%=root %>/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=root %>/js/material.min.js"></script>
<script type="text/javascript" src="<%=root %>/js/bootstrap-material-datetimepicker.js"></script>
<%@include file = "/facebook/facebook_utf.jsp" %>


<script type="text/javascript">
$(document).ready(function()
{
	$('#startdate').bootstrapMaterialDatePicker
	({
		time: false
	});
	
	$('#enddate').bootstrapMaterialDatePicker
	({
		time: false
	});

	$('#time').bootstrapMaterialDatePicker
	({
		date: false,
		shortTime: true,
		format: 'HH:mm'
	});

	$('#date-format').bootstrapMaterialDatePicker
	({
		format: 'dddd DD MMMM YYYY - HH:mm'
	});
	$('#date-fr').bootstrapMaterialDatePicker
	({
		format: 'DD/MM/YYYY HH:mm',
		lang: 'fr',
		weekStart: 1, 
		cancelText : 'ANNULER'
	});

	$('#date-end').bootstrapMaterialDatePicker
	({
		weekStart: 0, format: 'DD/MM/YYYY HH:mm'
	});
	$('#date-start').bootstrapMaterialDatePicker
	({
		weekStart: 0, format: 'DD/MM/YYYY HH:mm'
	}).on('change', function(e, date)
	{
		$('#date-end').bootstrapMaterialDatePicker('setMinDate', date);
	});

	$('#min-date').bootstrapMaterialDatePicker({ format : 'DD/MM/YYYY HH:mm', minDate : new Date() });

	$.material.init()
});
</script>
<style>
	body 
	{
		font-family: 'Roboto', sans-serif;
	}
	h2 
	{
		padding: 0 20px 10px 20px;
		font-size: 20px;
		font-weight: 400;
	}
	.form-control-wrapper 
	{
		margin: 10px 20px;
	}
	code 
	{
		padding: 10px;
		background: #eee!important;
		display: block;
		color: #000;
	}
	code > p 
	{
		font-weight: bold;
		color: #000;
		font-size: 1.5em;
	}
	@media(max-width: 300px)
	{
		.well { margin : 0}
	}


</style> 

<style type="text/css">
#back-color1 { 
background-color: #D9E5FF;
color: black;
opacity: 0.95;
z-index: 1;
}

html {
	height: 100%;
}
body {
	height: 100%;
    background: url('<%=root%>/image/mkplanbg.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}

.wrapper{
	min-height: 100%;
	position: relative;
	padding-bottom: 226px;
	margin-bottom: -226px;
}

#footer {
	background-color: #8C8C8C;
	color: white;
	opacity: 0.95;
	height: 226px;
	font-size: 12pt;
}

.bg3 {
	background-color: #FFFFFF;
	opacity: 0.95;
}

</style>


<script type = "text/javascript">
function logout() {
	facebooklogout();
	document.location.href = "<%=root%>/user?act=logout";
 }
 
function mvPlanner(){
	
	document.location.href = "<%=root%>/planner?act=mvplanner";
}
</script>


<script type="text/javascript">
function makePlanner() {
	  
	  
	  	if(document.getElementById("plannername").value=="") {
		  	alert("플래너 이름을 입력하세요");
			return;
			
		}

	  	if(document.getElementById("startdate").value == ""){
			alert("출발날짜를 선택하세요");
			return;
			
		}
	  	
	  	if(document.getElementById("enddate").value == "") {
			alert("도착날짜를 선택하세요");
			return;
			
		}else {
			
			document.plannerForm.action = "<%=root%>/planner";
			document.plannerForm.submit();
		}
	  
}  

function logout() {
	facebooklogout();
	document.location.href = "<%=root%>/user?act=logout";
 }
 
function mvPlanner(){
	
	document.location.href = "<%=root%>/planner?act=mvplanner";
}

function mvSquare() {
	document.location.href = "<%=root%>/planner?act=plannersquare";
}
</script>
</head>



<%if(memberDto != null){ %>

<body>
<nav class="navbar navbar-default"  id="back-color1">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-menu-bar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="logo" href="<%= root%>/main.jsp" ><img src="<%= root%>/logo/logo.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="main-menu-bar">
      
      <ul class="nav navbar-nav">
	        
	        <li><a href="javascript:mvSquare();">플래너 광장</a></li>
	        <!-- <li><a href="#">고객센터</a></li>  -->
	        <%if(memberDto != null && memberDto.getM_id().equals("admin@naver.com")){%>
	      	<li><a href="javascript:mvMemberManage();">회원관리</a></li>
	        <!-- <li><a href="javascript:mvPlannerManage();">플래너 관리</a></li> -->
	        <li><a href="javascript:mvStatistics();">통계</a></li>
	      <%}%>	
	  </ul>
      <%if(memberDto != null){
      		if(!memberDto.getM_id().equals("admin@naver.com")){%>
      
      	  <%} %>
      	  <ul class="nav navbar-nav">
      	  	<li><a href="javascript:mvPlanner();">플래너</a></li>
      	  </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=memberDto.getM_name()%><span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="<%=root%>/planner?act=myplanner&select=1">마이 플래너</a></li>
	            <li><a href="<%= root %>/friend?act=mvfriendlist">친구목록</a></li>
	            <li><a href="<%= root %>/message?act=mvmessage">쪽지함</a></li>
	            <li class="divider"></li>
	            <li><a href="<%= root %>/member/mypage.jsp">마이페이지</a></li>
	          </ul>
	        </li>
	        <!-- <li><a href="<%= root %>/main.jsp">로그아웃</a></li> -->
	        <li><a href="javascript:logout();">로그아웃</a></li>
	      </ul>
      <%}else{%>
      	<ul class="nav navbar-nav navbar-right">
        	<li><a href="<%= root%>/user?act=mvlogin">로그인</a></li>
        	<li><a href="<%= root %>/user?act=mvjoin">회원가입</a></li>
      	</ul>
      <%}%>
      
    </div>
  </div>
</nav>




<!-- 아래부터 볼 것. -->
	<div class="container wrapper">
		<div class="col-sm-2 col-md-3 col-lg-3"></div>
		<div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 bg3">
		<br>
			<legend>
				<i class="glyphicon glyphicon-calendar"></i> 플래너 만들기
			</legend>
			<form id="plannerForm" name = "plannerForm" action="" method="get" >
			<input type="hidden" name="act" value="makeplanner">
				<div col-md-6 col-lg-6>
				<label for=""> 플래너명</label>
				<input class="form-control" type = "text" id="plannername" name="plannername" placeholder="플래너명" maxlength="30"/>
				</div>
				&nbsp;
				<div col-md-6 col-lg-6>
					<label for="">여행 출발 날짜</label>
					<input type="text" name="startdate" id="startdate" class="form-control" placeholder="출발 날짜">
				</div>
				&nbsp;
				
				<div col-md-6 col-lg-6>
					<label for=""> 여행 도착 날짜</label>
					<input type="text" name="enddate" id="enddate" class="form-control" placeholder="도착 날짜">
				</div>
				&nbsp;
				<input type ="button" class="btn btn-lg btn-primary btn-block" value = "플래너 만들기" onclick="javascript:makePlanner();">
			</form>
		</div>
		<div class="col-md-3 col-lg-3"></div>
	</div>

<br>
<br>

<%}else{ %>

document.location.href="<%=root %>/loginfail.jsp";

<%} %>

<footer class="text-center">
        <div class="footer-above" id="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h3 class="section-heading">Let's Get In Touch!</h3>
                    <hr class="primary">
                    <p>서울특별시 구로구 디지털로34길 43 코오롱싸이언스밸리1차</p>
                    <p>4층 Kitri MyPlanner 개발팀</p>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-md-offset-2 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x sr-contact"></i>
                    <p><span class="glyphicon glyphicon-phone"></span> : 010-1234-5678</p>
                </div>
                <div class="col-xs-12 col-sm-6 col-lg-6 col-md-4 text-center">
                    <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                    <p><span class="glyphicon glyphicon-envelope"></span><a href="mailto:your-email@your-domain.com"> : myplanner@naver.com</a></p>
                </div>
            </div>
        </div>
	</div>
</footer>
</body>
</html>