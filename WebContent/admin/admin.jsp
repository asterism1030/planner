<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="memberRoot" value="${pageContext.request.contextPath}"></c:set>

<!-- datamanage.jsp 실행 시 함께 실행됨 -->

<link rel="stylesheet" href="${memberRoot}/css/bootstrap.min.css">

<script type="text/javascript" src="${memberRoot}/js/httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${memberRoot}/js/bootstrap.min.js"></script>

<link href="${memberRoot}/css/pink_blue_theme/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${memberRoot}/css/pink_blue_theme/jquery-ui.js"></script>

<style>
  table {border: 2px double pink; width:666px}
  td,th{border:1px pink solid ; text-align: center; padding:5px}
</style>


<script>
	$(document).ready(function(){
		allData();
	});

	$(function(){
	  $("#tabs").tabs();
	  $("#searchBtn").button();
	  $("#selectmenu").selectmenu();
	  $("#control").controlgroup();
	  
	});
	
	
	function allData() {
		$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "${memberRoot}/adminmember",
		    data: { act : "dataAdmin"},
		    success:function(data) {
		    	showMembers(data);
		    },
		    error: function(e) {
		    	alert("member data 가져오기 실패");
		    }
	    });
	}
	
	
    //데이터 나타내기
    function showMembers(data) {
    	$("#datas").empty;
    	
    	var len = data.members.length;
    	
    	var result = "<table style=\"width:95%\">";
    	
    	for(var i = 0; i < len; i ++) {
    		var plen = data.members[i].plans.length;
    		var flen = data.members[i].friends.length;
    		
    		result += "<form name=\"modifyForm\" method =\"post\">";
	    	result += "<tr bgcolor=\"#c3e7fa\">";
	    	result += " <td style=\"width:7%\">";
	    	result += "  <div id=\"control\">";
	    	result += "   	  <input type=\"checkbox\" name=\"Check\" id=\"Check\" value=\""+(i+1)+"\">";
	    	result += "&nbsp; " + (i+1);
	    	result += "  </div>";
	    	result += "	</td>";
		    result += "<td style=\"width:15%\"> <input type=\"text\" value="+data.members[i].m_id+" id=\"m_id"+(i+1)+"\" name=\"m_id"+(i+1)+"\" style=\"background-color:transparent;border:0px;width:100%;\"/> </td>";
		    result += "<td style=\"width:7%\"> <input type=\"text\" value="+data.members[i].m_name+" id=\"m_name"+(i+1)+"\" name=\"m_name"+(i+1)+"\" style=\"background-color:transparent;border:0px;width:100%;\"/> </td>";
		    result += "<td style=\"width:18%\"> <input type=\"text\" value="+data.members[i].m_pass+" id=\"m_pass"+(i+1)+"\" name=\"m_pass"+(i+1)+"\" style=\"background-color:transparent;border:0px;width:100%;\"/> </td>";
		    result += "<td style=\"width:13%\"> <input type=\"text\" value='"+data.members[i].m_birth+"' id=\"m_birth"+(i+1)+"\" name=\"m_birth"+(i+1)+"\" style=\"background-color:transparent;border:0px;width:100%;\"/> </td>";
		    result += "<td style=\"width:10%\"> <input type=\"text\" value="+data.members[i].m_gender+" id=\"m_gender"+(i+1)+"\" name=\"m_gender"+(i+1)+"\" style=\"background-color:transparent;border:0px;width:100%;\"/> </td>";

		    result += "<td style=\"width:15%\"> <select style=\"background-color:transparent;border:0px;width:100%;\">";
		    result += "<option>아이디</option>";
			for(var j=0; j<flen; j++) {
				result += "<option style=\"background-color:#ccffcc;border:0px;width:100%;\">"+ data.members[i].friends[j].f_id + "</option>";
			}
			result += "</select> </td>";
		    
		    result += "<td style=\"width:15%\"> <select style=\"background-color:transparent;border:0px;width:100%;\">";
		    result += "<option>pid : 플래너 명 : 좋아요</option>";
			for(var j=0; j<plen; j++) {
				result += "<option style=\"background-color:#ccffcc;border:0px;width:100%;\">"+data.members[i].plans[j].p_id + " | " +data.members[i].plans[j].p_subject+ " | " + data.members[i].plans[j].likes + "</option>";
			}
			result += "</select> </td>";
		    
		    result += "</form>";
    	}
	    result += "</table>";
	    result += "<input type=\"hidden\" id=\"memberNum\" name=\"memberNum\" value=\""+len+"\">";
    	document.getElementById("datas").innerHTML = result;
    }
    
    function reload() {
    	allData()
    }
    
</script>

</head>
<body>
<center>
		
		<div style="overflow-y:scroll;" >
		<table style="width:95%">
			<tr bgcolor="#90c3f6">
		    <th style="width:7%">No</th>
		    <th style="width:15%">아이디</th>
		    <th style="width:7%">이름</th>
		    <th style="width:18%">비밀번호</th>
		    <th style="width:13%">생년월일</th>
		    <th style="width:10%">성별</th>
		    <th style="width:15%">친구리스트</th>
		    <th style="width:15%">플래너리스트</th>
		    </tr>
		</table>
		</div>
		   
		<div id="datas" style="overflow-y:scroll; height:300px;">
		</div>
		
</body>
</center>
</html>