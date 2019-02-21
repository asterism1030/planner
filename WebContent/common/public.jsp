<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "com.project.member.model.*"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<%
	String root = request.getContextPath();
	MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
	String loginmethod = "";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Bootstrap Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${root}/css/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/tabmenu.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<script type="text/javascript" src="${root}/js/httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- <script src="${root}/js/bootstrap.min.js"></script> -->
<%@include file = "/facebook/facebook.jsp" %>


<style type="text/css">

#back-color1 { 
	background-color: #D9E5FF;
	opacity: 0.95;
	z-index: 1;
}

.navcol {
	background-color: #D9E5FF;
	opacity: 0.95;
	z-index: 1;
}


#footer {
	background-color: #8C8C8C;
	color: white;
	opacity: 0.95;
}

.border {
	border: thin;
	border-color: gray;
	border-style: solid;
}

.wrapper{
	min-height: 88%;
	position: relative;
	padding-bottom: 226px;
	margin-bottom: -226px;
}

.bg1 {
	background-color: #D9E5FF;
	opacity: 0.9;
	
}

.bg3 {
	background-color: #FFFFFF;
	opacity: 0.95;
}

.slider {
	background-color: #FFFFFF;
	opacity: 0.95;
}


@import url(http://fonts.googleapis.com/css?family=Roboto:300,400);
/* Tabbed Styles */
			.tabbed {
				width: 100%;
				min-width: 300px;
				margin: 0 auto;
				margin-bottom: 25px;/*68*/
				border-bottom: 4px solid #000;
				overflow: hidden;
				transition: border 250ms ease;
			}
			.tabbed ul {
				margin: 0px;
				padding: 0px;
				overflow: hidden;
				float: left;
				padding-left: 35px;/*48*/
				list-style-type: none;
			}
			.tabbed ul * {
				margin: 0px;
				padding: 0px;
			}
			.tabbed ul li {
				display: block;
				float: right;
				padding: 10px 12px 8px;/*10 24 8*/
				background-color: #FFF;
				margin-right: 35px;/*46*/
				z-index: 2;
				position: relative;
				cursor: pointer;
				color: #777;
				
				text-transform: uppercase;
				font: 600 13px/20px roboto, "Open Sans", Helvetica, sans-serif;

				transition: all 250ms ease;
			}
			.tabbed ul li:before,
			.tabbed ul li:after {
				display: block;
				content: " ";
				position: absolute;
				top: 0;
				height: 100%;
				width: 35px;/*44*/ 	
				background-color: #FFF;
				transition: all 250ms ease;
			}
			.tabbed ul li:before {
				right: -24px;
				transform: skew(30deg, 0deg);
				box-shadow: rgba(0,0,0,.1) 3px 2px 5px, inset rgba(255,255,255,.09) -1px 0;
			}
			.tabbed ul li:after {
				left: -24px;
				transform: skew(-30deg, 0deg);
				box-shadow: rgba(0,0,0,.1) -3px 2px 5px, inset rgba(255,255,255,.09) 1px 0;
			}
			.tabbed ul li:hover,
			.tabbed ul li:hover:before,
			.tabbed ul li:hover:after {
				background-color: #F4F7F9;
				color: #444;
			}
			.tabbed ul li.active {
				z-index: 3;
			}
			.tabbed ul li.active,
			.tabbed ul li.active:before,
			.tabbed ul li.active:after {
				background-color: #000;
				color: #fff;
			}
/* Round Tabs */
			.tabbed.round ul li {
				border-radius: 8px 8px 0 0;
			}
			.tabbed.round ul li:before {
				border-radius: 0 8px 0 0;
			}
			.tabbed.round ul li:after {
				border-radius: 8px 0 0 0;
			}



/* WRENCHING */
@keyframes wrench {
    0%{transform:rotate(-12deg)}
	8%{transform:rotate(12deg)}
	10%{transform:rotate(24deg)}
	18%{transform:rotate(-24deg)}
	20%{transform:rotate(-24deg)}
	28%{transform:rotate(24deg)}
	30%{transform:rotate(24deg)}
	38%{transform:rotate(-24deg)}
	40%{transform:rotate(-24deg)}
	48%{transform:rotate(24deg)}
	50%{transform:rotate(24deg)}
	58%{transform:rotate(-24deg)}
	60%{transform:rotate(-24deg)}
	68%{transform:rotate(24deg)}
	75%,100%{transform:rotate(0deg)}
}
.faa-wrench.animated,
.faa-wrench.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-wrench {
	animation: wrench 2.5s ease infinite;
	transform-origin-x: 90%;
	transform-origin-y: 35%;
	transform-origin-z: initial;
}
.faa-wrench.animated.faa-fast,
.faa-wrench.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-wrench.faa-fast {
	animation: wrench 1.2s ease infinite;
}
.faa-wrench.animated.faa-slow,
.faa-wrench.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-wrench.faa-slow {
	animation: wrench 3.7s ease infinite;
}

/* BELL */
@keyframes ring {
	0%{transform:rotate(-15deg)}
	2%{transform:rotate(15deg)}
	4%{transform:rotate(-18deg)}
	6%{transform:rotate(18deg)}
	8%{transform:rotate(-22deg)}
	10%{transform:rotate(22deg)}
	12%{transform:rotate(-18deg)}
	14%{transform:rotate(18deg)}
	16%{transform:rotate(-12deg)}
	18%{transform:rotate(12deg)}
	20%,100%{transform:rotate(0deg)}
}
.faa-ring.animated,
.faa-ring.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-ring {
	animation: ring 2s ease infinite;
	transform-origin-x: 50%;
	transform-origin-y: 0px;
	transform-origin-z: initial;
}
.faa-ring.animated.faa-fast,
.faa-ring.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-ring.faa-fast {
	animation: ring 1s ease infinite;
}
.faa-ring.animated.faa-slow,
.faa-ring.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-ring.faa-slow {
	animation: ring 3s ease infinite;
}

/* VERTICAL */
@keyframes vertical {
	0%{transform:translate(0,-3px)}
	4%{transform:translate(0,3px)}
	8%{transform:translate(0,-3px)}
	12%{transform:translate(0,3px)}
	16%{transform:translate(0,-3px)}
	20%{transform:translate(0,3px)}
	22%,100%{transform:translate(0,0)}
}
.faa-vertical.animated,
.faa-vertical.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-vertical {
	animation: vertical 2s ease infinite;
}
.faa-vertical.animated.faa-fast,
.faa-vertical.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-vertical.faa-fast {
	animation: vertical 1s ease infinite;
}
.faa-vertical.animated.faa-slow,
.faa-vertical.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-vertical.faa-slow {
	animation: vertical 4s ease infinite;
}

/* HORIZONTAL */
@keyframes horizontal {
	0%{transform:translate(0,0)}
	6%{transform:translate(5px,0)}
	12%{transform:translate(0,0)}
	18%{transform:translate(5px,0)}
	24%{transform:translate(0,0)}
	30%{transform:translate(5px,0)}
	36%,100%{transform:translate(0,0)}
}
.faa-horizontal.animated,
.faa-horizontal.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-horizontal {
	animation: horizontal 2s ease infinite;
}
.faa-horizontal.animated.faa-fast,
.faa-horizontal.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-horizontal.faa-fast {
	animation: horizontal 1s ease infinite;
}
.faa-horizontal.animated.faa-slow,
.faa-horizontal.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-horizontal.faa-slow {
	animation: horizontal 3s ease infinite;
}

/* FLASHING */
@keyframes flash {
	0%,100%,50%{opacity:1}
	25%,75%{opacity:0}
}
.faa-flash.animated,
.faa-flash.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-flash {
	animation: flash 2s ease infinite;
}
.faa-flash.animated.faa-fast,
.faa-flash.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-flash.faa-fast {
	animation: flash 1s ease infinite;
}
.faa-flash.animated.faa-slow,
.faa-flash.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-flash.faa-slow {
	animation: flash 3s ease infinite;
}

/* BOUNCE */
@keyframes bounce {
	0%,10%,20%,50%,80%,100%{transform:translateY(0)}
	40%{transform:translateY(-15px)}
	60%{transform:translateY(-15px)}
}
.faa-bounce.animated,
.faa-bounce.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-bounce {
	animation: bounce 2s ease infinite;
}
.faa-bounce.animated.faa-fast,
.faa-bounce.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-bounce.faa-fast {
	animation: bounce 1s ease infinite;
}
.faa-bounce.animated.faa-slow,
.faa-bounce.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-bounce.faa-slow {
	animation: bounce 3s ease infinite;
}

/* SPIN */
@keyframes spin{
	0%{transform:rotate(0deg)}
	100%{transform:rotate(359deg)}
}
.faa-spin.animated,
.faa-spin.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-spin {
	animation: spin 1.5s linear infinite;
}
.faa-spin.animated.faa-fast,
.faa-spin.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-spin.faa-fast {
	animation: spin 0.7s linear infinite;
}
.faa-spin.animated.faa-slow,
.faa-spin.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-spin.faa-slow {
	animation: spin 2.2s linear infinite;
}

/* FLOAT */
@keyframes float{
	0%{transform: translateY(0)}
	50%{transform: translateY(-6px)}
	100%{transform: translateY(0)}
}
.faa-float.animated,
.faa-float.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-float {
	animation: float 2s linear infinite;
}
.faa-float.animated.faa-fast,
.faa-float.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-float.faa-fast {
	animation: float 1s linear infinite;
}
.faa-float.animated.faa-slow,
.faa-float.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-float.faa-slow {
	animation: float 3s linear infinite;
}

/* PULSE */
@keyframes pulse {
	0% {transform: scale(1.1)}
 	50% {transform: scale(0.8)}
 	100% {transform: scale(1.1)}
}
.faa-pulse.animated,
.faa-pulse.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-pulse {
	animation: pulse 2s linear infinite;
}
.faa-pulse.animated.faa-fast,
.faa-pulse.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-pulse.faa-fast {
	animation: pulse 1s linear infinite;
}
.faa-pulse.animated.faa-slow,
.faa-pulse.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-pulse.faa-slow {
	animation: pulse 3s linear infinite;
}

/* SHAKE */
.faa-shake.animated,
.faa-shake.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-shake {
	animation: wrench 2.5s ease infinite;
}
.faa-shake.animated.faa-fast,
.faa-shake.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-shake.faa-fast {
	animation: wrench 1.2s ease infinite;
}
.faa-shake.animated.faa-slow,
.faa-shake.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-shake.faa-slow {
	animation: wrench 3.7s ease infinite;
}

/* TADA */
@keyframes tada {
	0% {transform: scale(1)}
	10%,20% {transform:scale(.9) rotate(-8deg);}
	30%,50%,70% {transform:scale(1.3) rotate(8deg)}
	40%,60% {transform:scale(1.3) rotate(-8deg)}
	80%,100% {transform:scale(1) rotate(0)}
}

.faa-tada.animated,
.faa-tada.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-tada {
	animation: tada 2s linear infinite;
}
.faa-tada.animated.faa-fast,
.faa-tada.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-tada.faa-fast {
	animation: tada 1s linear infinite;
}
.faa-tada.animated.faa-slow,
.faa-tada.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-tada.faa-slow {
	animation: tada 3s linear infinite;
}

/* PASSING */
@keyframes passing {
	0% {transform:translateX(-50%); opacity:0}
	50% {transform:translateX(0%); opacity:1}
	100% {transform:translateX(50%); opacity:0}
}

.faa-passing.animated,
.faa-passing.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-passing {
	animation: passing 2s linear infinite;
}
.faa-passing.animated.faa-fast,
.faa-passing.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-passing.faa-fast {
	animation: passing 1s linear infinite;
}
.faa-passing.animated.faa-slow,
.faa-passing.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-passing.faa-slow {
	animation: passing 3s linear infinite;
}

/* PASSING REVERSE */

@keyframes passing-reverse {
	0% {transform:translateX(50%); opacity:0}
	50% {transform:translateX(0%); opacity:1}
	100% {transform:translateX(-50%); opacity:0}
}

.faa-passing-reverse.animated,
.faa-passing-reverse.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-passing-reverse {
	animation: passing-reverse 2s linear infinite;
}
.faa-passing-reverse.animated.faa-fast,
.faa-passing-reverse.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-passing-reverse.faa-fast {
	animation: passing-reverse 1s linear infinite;
}
.faa-passing-reverse.animated.faa-slow,
.faa-passing-reverse.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-passing-reverse.faa-slow {
	animation: passing-reverse 3s linear infinite;
}

/* WAVE */
@keyframes burst {
	0% {opacity:.6}
	50% {transform:scale(1.8);opacity:0}
	100%{opacity:0}
}
.faa-burst.animated,
.faa-burst.animated-hover:hover,
.faa-parent.animated-hover:hover > .faa-burst {
	animation: burst 2s infinite linear
}
.faa-burst.animated.faa-fast,
.faa-burst.animated-hover.faa-fast:hover,
.faa-parent.animated-hover:hover > .faa-burst.faa-fast {
	animation: burst 1s infinite linear
}
.faa-burst.animated.faa-slow,
.faa-burst.animated-hover.faa-slow:hover,
.faa-parent.animated-hover:hover > .faa-burst.faa-slow {
	animation: burst 3s infinite linear
}


</style>
<script type = "text/javascript">
function logout() {
	if(confirm("로그아웃 하시겠습니까?")) {
		facebooklogout();
		document.location.href = "${root}/user?act=logout";
	} else {
		
	}
 }
 
function mvPlanner(){
	var login = "<%=memberDto%>"; 
	if(login != "null") {
		document.location.href = "${root}/planner?act=mvplanner";
	} else {
		alert("로그인 후 이용 가능합니다.");
	}
}

function mvSquare() {
	document.location.href = "${root}/planner?act=plannersquare";
}

function mvMemberManage() {
	document.location.href = "${root}/adminmember?act=mvmember";
}

function mvPlannerManage() {
	document.location.href = "${root}/adminstatics?act=mvPlannerManage";
}

function mvStatistics() {
	document.location.href = "${root}/adminstatics?act=mvStatistics";
}
</script>
</head>


<body>
<nav class="navbar navbar-default navcol" id="back-color1">
  <div class="container navcol">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-menu-bar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="logo" href="${root}/main.jsp" ><img src="${root}/logo/logo.png"></a>
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
      
      	  <ul class="nav navbar-nav">
      	  	<li><a href="javascript:mvPlanner();">플래너</a></li>
      	  </ul>
      	  <%} %>
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=memberDto.getM_name()%><span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="${root}/planner?act=myplanner&select=1">마이 플래너</a></li>
	            <li><a href="${root}/friend?act=mvfriendlist">친구목록</a></li>
	            <li><a href="${root}/message?act=mvmessage">쪽지함</a></li>
	            <li class="divider"></li>
	            <li><a href="${root}/member/mypage.jsp">마이페이지</a></li>
	          </ul>
	        </li>
	        <li><a href="javascript:logout();">로그아웃</a></li>
	      </ul>
      <%}else{%>
      	<ul class="nav navbar-nav navbar-right">
        	<li><a href="${root}/user?act=mvlogin">로그인</a></li>
        	<li><a href="${root}/user?act=mvjoin">회원가입</a></li>
      	</ul>
      <%}%>
    </div>
  </div>
</nav>










