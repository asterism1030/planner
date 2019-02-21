<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/public.jsp" %>

<link href="${root}/css/pink_blue_theme/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${root}/css/pink_blue_theme/jquery-ui.js"></script>
<script>

$(function(){
	  $("#tabs").tabs();
	  $("#searchBtn").button();
	  $("#selectmenu").selectmenu();
	  $("#control").controlgroup();
	  
	  //페이지 로드
	  $("#loadpage").load("${root}/admin/member.jsp");
	});	

//탭 클릭시
function dataUser() {
	$("#loadpage").empty();
	$("#loadpage").load("${root}/admin/member.jsp");
}

function dataAdmin() {
	$("#loadpage").empty();
	$("#loadpage").load("${root}/admin/admin.jsp");
}

</script>
</head>
<body>
<center>
    <h2>계정 관리</h2>

    <div id="tabs">
       <ul>
			<li><a href="#tag-1" onclick="dataUser()">일반회원</a></li>
			<li><a href="#tag-2" onclick="dataAdmin()">관리자</a></li>
		</ul>
		
		<div id="tag-1"></div>
		<div id="tag-2"></div>
		
		<div id="loadpage">
		</div>
		
	</div>
</body>
</center>
</html>