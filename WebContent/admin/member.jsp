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
	  var Cheight = $(window).height() - 300;
	  $("#datas").css({"height":Cheight+'px'});
	});
	
	
	function allData() {
		$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "${memberRoot}/adminmember",
		    data: { act : "dataMember"},
		    success:function(data) {
		    	getdatas = data;
		    	showMembers(data);
		    },
		    error: function(e) {
		    	alert("member data 가져오기 실패");
		    }
	    });
	}
	
	
    function idDelete(delID){
        //alert(delID);
        location.href = "delete.jsp?id=" + delID;   //get방식으로 삭제할아이디를 넘김
    }
   
    
    //검색
    function goSearch(form) {
    	$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "${memberRoot}/adminmember",
		    data: { act : "search", key : form.selectmenu.value, word : form.keyWord.value},
		    success:function(data) {
		    	showMembers(data);
		    },
		    error: function(e) {
		    	//alert("search data 가져오기 실패");
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
		    result += "<td style=\"width:8%\"> <input type=\"text\" value='"+data.members[i].m_birth+"' id=\"m_birth"+(i+1)+"\" name=\"m_birth"+(i+1)+"\" style=\"background-color:transparent;border:0px;width:100%;\"/> </td>";
		    result += "<td style=\"width:5%\"> <input type=\"button\" onclick=\"changeGender("+(i+1)+")\" value="+data.members[i].m_gender+" id=\"m_gender"+(i+1)+"\" name=\"m_gender"+(i+1)+"\" style=\"background-color:transparent;border:0px;width:100%;\"/> </td>";

		    result += "<td style=\"width:15%\"> <select style=\"background-color:transparent;border:0px;width:100%;\">";
		    result += "<option>아이디</option>";
			for(var j=0; j<flen; j++) {
				result += "<option style=\"background-color:#ccffcc;border:0px;width:100%;\">"+ data.members[i].friends[j].f_id + "</option>";
			}
			result += "</select> </td>";
		    
		    result += "<td style=\"width:15%\"> <select style=\"background-color:transparent;border:0px;width:100%;\">";
		    result += "<option># : 플래너 명 : 좋아요</option>";
			for(var j=0; j<plen; j++) {
				result += "<option style=\"background-color:#ccffcc;border:0px;width:100%;\">"+data.members[i].plans[j].p_id + " | " +data.members[i].plans[j].p_subject+ " | " + data.members[i].plans[j].likes + "</option>";
			}
			result += "</select> </td>";
		    
		    result += "<td style=\"width:5%\">";
		    result += "	<input id=\"modifyBtn\" type=\"button\" value=\"수정\" onclick=\"modifyMember( "+(i+1)+",'"+data.members[i].m_id+"','"+data.members[i].m_pass+"' )\" style=\"background-color:#ccccff\">";
		    result += "</td> </tr>";
		    result += "</form>";
    	}
	    result += "</table>";
	    result += "<input type=\"hidden\" id=\"memberNum\" name=\"memberNum\" value=\""+len+"\">";
    	document.getElementById("datas").innerHTML = result;
    }
    
    //회원단에서 수정버튼을 누를 시에 데이터를 변경 시킨다
    function modifyMember(num, m_id, m_pass) { //m_id와  m_pass는 변경 전 원래 아이디 비번
    	$.ajax({
		    type: "POST",
		    dataType: 'json',
		    url: "${memberRoot}/adminmember",
		    data: { act : "modify", originId : m_id, originPass : m_pass, id : $("#m_id"+num).val(), 
		    		name : $("#m_name"+num).val(), pass : $("#m_pass"+num).val(), birth : $("#m_birth"+num).val(), gender : $("#m_gender"+num).val()},
		    success:function(data) {
		    	alert("저장 성공O");
		    },
		    error: function(e) {
		    	alert("저장 실패X");
		    }
	    });
    }
    
    function changeGender(num) {
    	var getGender = $("#m_gender"+num).val();
    	
    	if(getGender == "여자" || getGender == "여") {
    		$("#m_gender"+num).val("남자")
    	
    	} else if(getGender == "남자" || getGender == "남") {
    		$("#m_gender"+num).val("여자");
    	}
    }
    
    function reload() {
    	allData()
    }
    
    function deleteChecked() {
    	var m_ids = []; //삭제할 멤버들의 아이디
    	var sendList = "";
    	
    	$("input:checkbox[name=Check]:checked").each(function() {
			var num = $(this).val();
			m_ids.push($("#m_id" + num).val());
	    	alert("아이디\n" + $("#m_id" + num).val() + " 님을 정말로 탈퇴시키겠습니까?");
		});
    	
    	var len = m_ids.length;
    	for(var i = 0; i < len; i ++) {
    		sendList += m_ids[i];
    		if(i != len -1)
    			sendList += ",";
    	}
    	
    	if(m_ids.length > 0) {
	    	$.ajax({
			    type: "POST",
			    dataType: 'json',
			    url: "${memberRoot}/adminmember",
			    data: { act : "delete", namelist : sendList},
			    success:function(data) {
			    	allData();
			    },
			    error: function(e) {
			    	alert("저장 실패X");
			    }
		    });
    	}
    }
    
</script>


</head>
<body>
<center>
       	
		<div class="row">
 		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
	       	<input type="button" onclick="reload()" value="전체목록" style="background-color:transparent;border:0px;">&nbsp;&nbsp;&nbsp;
	       	<input type="button" onclick="deleteChecked()" value="선택삭제" style="background-color:transparent;border:0px;">&nbsp;&nbsp;&nbsp;
        </div>
        <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" align="right">
        <form name="serach" method ="post">
        	 <select id="selectmenu"  style="width:100px;">
	           <option value="m_id">아이디</option>
	           <option value="m_name">이름</option>
	           <option value="m_birth">생년월일</option>
			</select>
	        <input type="text" id="keyWord" name="keyWord" onkeyup="goSearch(form)"/>
        </form>
       </div>
       </div></br>
		
		<div style="overflow-y:scroll;" >
		<table style="width:95%">
			<tr bgcolor="#90c3f6">
		    <th style="width:7%">No</th>
		    <th style="width:15%">아이디</th>
		    <th style="width:7%">이름</th>
		    <th style="width:18%">비밀번호</th>
		    <th style="width:8%">생년월일</th>
		    <th style="width:5%">성별</th>
		    <th style="width:15%">친구리스트</th>
		    <th style="width:15%">플래너리스트</th>
		    <th style="width:5%">수정</th>
		    </tr>
		</table>
		</div>
		   
		<div id="datas" style="overflow-y:scroll;">
		</div>
		
</body>
</center>
</html>
