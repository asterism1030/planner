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
	  
	  //������ �ε�
	  $("#loadpage").load("${root}/admin/member.jsp");
	});	

//�� Ŭ����
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
    <h2>���� ����</h2>

    <div id="tabs">
       <ul>
			<li><a href="#tag-1" onclick="dataUser()">�Ϲ�ȸ��</a></li>
			<li><a href="#tag-2" onclick="dataAdmin()">������</a></li>
		</ul>
		
		<div id="tag-1"></div>
		<div id="tag-2"></div>
		
		<div id="loadpage">
		</div>
		
	</div>
</body>
</center>
</html>