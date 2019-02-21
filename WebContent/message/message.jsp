<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file = "/common/public.jsp" %>
<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('<%=root%>/image/invitebg.jpg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>
<script type="text/javascript" src="<%=root%>/js/message.js"></script>


<script type="text/javascript">

var friendList;
var groupList;

$(document).ready(function(){
	
	friendRequest();
	
});
function acceptGroupRequest(gi_id, g_id){
	
	$.ajax({
	    type: "GET",
	    dataType: 'json',
	    url: "<%= root %>/message",
	    data: { act : "acceptGroupRequest", gi_id : gi_id, g_id : g_id },
	    success:function(data) {
	    	//alert("성공!!! : " + data.mlist[0].name);
	    	groupRequestList(data);
	    },
	    error: function(e) {
	    	alert("에러!!");
	    }
    });
	
}

function denyGroupRequest(gi_id){
	
	if (confirm("정말 거절하시겠습니까??") == true){ 
		
		$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "<%= root %>/message",
		    data: { act : "denyGroupRequest", gi_id : gi_id },
		    success:function(data) {
		    	//alert("성공!!! : " + data.mlist[0].name);
		    	groupRequestList(data);
		    },
		    error: function(e) {
		    	alert("에러!!");
		    }
	    });
		
	}
}


function acceptFriendRequest(fr_id, from_name, from_id){
	$.ajax({
	    type: "GET",
	    dataType: 'json',
	    url: "<%= root %>/message",
	    data: { act: "acceptFriendRequest", fr_id : fr_id, from_name : from_name, from_id : from_id },
	    success:function(data) {
	    	friendRequestList(data);
	    },
	    error: function(e) {
	    	alert("에러!!");
	    }
    });
}

function denyFriendRequest(fr_id){
	
	if (confirm("정말 거절하시겠습니까??") == true){ 
		
		$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "<%= root %>/message",
		    data: { act : "denyFriendRequest",  fr_id : fr_id},
		    success:function(data) {
		    	//alert("성공!!! : " + data.mlist[0].name);
		    	friendRequestList(data);
		    },
		    error: function(e) {
		    	alert("denyFriendRequest 에러!!");
		    }
	    });
		
	}
}

function friendRequest(){
	
	$.ajax({
	    type: "GET",
	    dataType: 'json',
	    url: "<%= root %>/message",
	    data: { act : "showFriendRequestList" },
	    success:function(data) {
	    	//alert("성공!!! : " + data.mlist[0].name);
	    	friendRequestList(data);
	    },
	    error: function(e) {
	    	alert("friendRequest 에러!!");
	    }
    });
}


function groupRequest(){
	
	$.ajax({
	    type: "GET",
	    dataType: 'json',
	    url: "<%= root %>/message",
	    data: { act : "showGroupRequestList" },
	    success:function(data) {
	    	//alert("성공!!! : " + data.mlist[0].name);
	    	groupRequestList(data);
	    },
	    error: function(e) {
	    	alert("에러!!");
	    }
    });
	
}


function friendRequestList(data){
	
	var len = data.friendRequestListJson.length;
	friendList = document.getElementById("list");
	
	clearFriendList();
	if(len == 0){
		
		
		
	}
	
	for(var i = 0 ; i < len; i++){
		
		var title = "친구 요청";
		var fr_id = data.friendRequestListJson[i].fr_id;
		var from_id = data.friendRequestListJson[i].from_id;
		var from_name =data.friendRequestListJson[i].from_name;
		var date = data.friendRequestListJson[i].fr_date
		var content = data.friendRequestListJson[i].fr_content;
		var li = createFriendLi(title, fr_id, from_id,  from_name, date, content);
		
		friendList.appendChild(li);
	}
	
	
}



function groupRequestList(data){
	
	var len = data.groupRequestListJson.length;
	groupList = document.getElementById("list");
	
	clearGroupList();
	
	for(var i = 0 ; i < len; i++){
		
		var title = "그룹 초대";
		var gi_id = data.groupRequestListJson[i].gi_id;
		var p_subject = data.groupRequestListJson[i].p_sujbect; // 플래너 제목
		var p_img = "<%=root%>/image/" + data.groupRequestListJson[i].p_img+ ".jpg";
		var gi_date = data.groupRequestListJson[i].gi_date;	// 보낸 날짜
		var m_id = data.groupRequestListJson[i].m_id; // 보낸 사람 아이디
		var m_name = data.groupRequestListJson[i].m_name;
		var gi_content = data.groupRequestListJson[i].gi_content;
		var g_id = data.groupRequestListJson[i].g_id;
		
		var li = createGroupLi(gi_id, g_id, title, p_img, p_subject, gi_date, m_id, m_name, gi_content);
		
		groupList.appendChild(li);
	}
	
}

function createGroupLi(gi_id, g_id, title, p_img, p_subject, gi_date, m_id, m_name, gi_content){
	
	var li = document.createElement("Li");
	li.setAttribute("class", "list-group-item");
	li.setAttribute("id", "li"+gi_id);
	
	var div_row = document.createElement("div");
	div_row.setAttribute("class", "row");
	
	li.appendChild(div_row);
	
	var div1 = document.createElement("div");
	div1.setAttribute("class", "col-xs-2 col-sm-2 col-md-2 col-lg-2");
	
	var img = document.createElement("img");
	img.setAttribute("src", p_img);
	img.setAttribute("class", "img-circle img-responsive");
	
	div1.appendChild(img);
	
	div_row.appendChild(div1);
	
	var div2 = document.createElement("div");
	div2.setAttribute("class","col-xs-8 col-sm-9 col-md-8 col-lg-7");
	
	//div2_1
	var div2_1 = document.createElement("div");
	var h5 = document.createElement("h5");
	var h5Text = document.createTextNode("그  룹  초  대");
	h5.appendChild(h5Text);
	
	div2_1.appendChild(h5);
	
	
	//<div2_1_1 class="mic-info">
	var div2_1_1 = document.createElement("div");
	div2_1_1.setAttribute("class", "mic-info");
	
	var textFrom = document.createTextNode("From : ");
	div2_1_1.appendChild(textFrom);
	
	var a = document.createElement("a");
	a.setAttribute("href", "#");
	var from_id1 = document.createTextNode(m_id);
	a.appendChild(from_id1);
	
	var from_name1 = document.createTextNode("  ("+m_name+")");
	a.appendChild(from_name1);
	
	div2_1_1.appendChild(a);
	
	var br1 = document.createElement("br");
	div2_1_1.appendChild(br1);
	
	var textDate = document.createTextNode("Data : ");
	var date = document.createTextNode(gi_date);
	
	div2_1_1.appendChild(textDate);
	div2_1_1.appendChild(date);
	
	div2_1.appendChild(div2_1_1);
	div2.appendChild(div2_1);
	
	
	//<div2_2 class="comment-text">
	var div2_2 = document.createElement("div");
	div2_2.setAttribute("class", "comment-text");
	var content  = document.createTextNode(gi_content);
	div2_2.appendChild(content);
	
	div2.appendChild(div2_2);
	div_row.appendChild(div2);
	
	
	//div3
	var div3 = document.createElement("div");
	var a_div3 = document.createElement("a");

	a_div3.setAttribute("href", "javascript:acceptGroupRequest('" + gi_id + "','" + g_id +"');");
	a_div3.setAttribute("class", "btn btn-sm btn-hover btn-primary");
	
	var span_div3 = document.createElement("span");
	span_div3.setAttribute("class", "glyphicon glyphicon-share-alt");
	span_div3.setAttribute("style","padding-right:3px");

	var acceptText = document.createTextNode("수락");
	a_div3.appendChild(span_div3);
	a_div3.appendChild(acceptText);
	
	div3.appendChild(a_div3);
	
	div_row.appendChild(document.createElement("br"));
	div_row.appendChild(div3);
	div_row.appendChild(document.createElement("br"));
	
	//div4
	var div4 = document.createElement("div");
	var a_div4 = document.createElement("a");
	
	
	a_div4.setAttribute("href", "javascript:denyGroupRequest('" + gi_id + "');");
	a_div4.setAttribute("class", "btn btn-sm btn-hover btn-danger");
	
	var span_div4 = document.createElement("span");
	span_div4.setAttribute("class", "glyphicon glyphicon-remove");
	span_div4.setAttribute("style","padding-right:3px");
	
	var denyText = document.createTextNode("거절");
	a_div4.appendChild(span_div4);
	a_div4.appendChild(denyText);
	
	div4.appendChild(a_div4);
	
	div_row.appendChild(div4);
	
	li.appendChild(div_row.appendChild(document.createElement("br")));
	return li;
	
}



function createFriendLi(title, fr_id, from_id, from_name, date, content){ //createRow
	
	var li = document.createElement("Li");
	li.setAttribute("class", "list-group-item");
	li.setAttribute("id", "li"+fr_id);
	
	
	//div(class = "row")
	var div_row = document.createElement("div");
	div_row.setAttribute("class", "row");
// 	div_row.setAttribute("id", fr_id);
	
	li.appendChild(div_row);
	
	//div1(class = "col-xs-2 col-sm-2 col-md-2 col-lg-2")
	var div1 = document.createElement("div");
	div1.setAttribute("class", "col-xs-2 col-sm-2 col-md-2 col-lg-2");
	
	var img = document.createElement("img");
	img.setAttribute("src", "http://placehold.it/80");
	img.setAttribute("class", "img-circle img-responsive");
	
	div1.appendChild(img);
	
	div_row.appendChild(div1);
	
	//div2(class="col-xs-8 col-sm-9 col-md-8 col-lg-7")
	var div2 = document.createElement("div");
	div2.setAttribute("class","col-xs-8 col-sm-9 col-md-8 col-lg-7");
	
	//div2_1
	var div2_1 = document.createElement("div");
	var h5 = document.createElement("h5");
	var h5Text = document.createTextNode("친  구  요  청");
	h5.appendChild(h5Text);
	
	div2_1.appendChild(h5);
	
	//<div2_1_1 class="mic-info">
	var div2_1_1 = document.createElement("div");
	div2_1_1.setAttribute("class", "mic-info");
	
	var textFrom = document.createTextNode("From : ");
	div2_1_1.appendChild(textFrom);
	
	var a = document.createElement("a");
	a.setAttribute("href", "#");
	var from_id1 = document.createTextNode(from_id);
	a.appendChild(from_id1);
	
	var from_name1 = document.createTextNode("  ("+from_name+")");
	a.appendChild(from_name1);
	
	div2_1_1.appendChild(a);
	
	var br1 = document.createElement("br");
	div2_1_1.appendChild(br1);
	
	var textDate = document.createTextNode("Data : ");
	var date = document.createTextNode(date);
	
	div2_1_1.appendChild(textDate);
	div2_1_1.appendChild(date);
	
	div2_1.appendChild(div2_1_1);
	div2.appendChild(div2_1);
	

	//<div2_2 class="comment-text">
	var div2_2 = document.createElement("div");
	div2_2.setAttribute("class", "comment-text");
	var content  = document.createTextNode(content);
	div2_2.appendChild(content);
	
	div2.appendChild(div2_2);
	div_row.appendChild(div2);
	
	//div3
	var div3 = document.createElement("div");
	var a_div3 = document.createElement("a");
	
	a_div3.setAttribute("href", "javascript:acceptFriendRequest('" + fr_id + "','" + from_name + "','" + from_id + "');");
	a_div3.setAttribute("class", "btn btn-sm btn-hover btn-primary");
	
	var span_div3 = document.createElement("span");
	span_div3.setAttribute("class", "glyphicon glyphicon-share-alt");
	span_div3.setAttribute("style","padding-right:3px");

	var acceptText = document.createTextNode("수락");
	a_div3.appendChild(span_div3);
	a_div3.appendChild(acceptText);
	
	div3.appendChild(a_div3);
	
	div_row.appendChild(document.createElement("br"));
	div_row.appendChild(div3);
	div_row.appendChild(document.createElement("br"));
	//div4
	var div4 = document.createElement("div");
	var a_div4 = document.createElement("a");
	
	
	a_div4.setAttribute("href", "javascript:denyFriendRequest('" + fr_id + "');");
	a_div4.setAttribute("class", "btn btn-sm btn-hover btn-danger");
	
	var span_div4 = document.createElement("span");
	span_div4.setAttribute("class", "glyphicon glyphicon-remove");
	span_div4.setAttribute("style","padding-right:3px");
	
	var denyText = document.createTextNode("거절");
	a_div4.appendChild(span_div4);
	a_div4.appendChild(denyText);
	
	div4.appendChild(a_div4);
	
	div_row.appendChild(div4);
	
	li.appendChild(div_row.appendChild(document.createElement("br")));
	return li;
}


function clearFriendList() {
	var len = friendList.childNodes.length;
	for(var i=len-1;i>=0;i--) {
		friendList.removeChild(friendList.childNodes[i]);
	}
}

function clearGroupList(){
	var len = groupList.childNodes.length;
	for(var i=len-1;i>=0;i--) {
		groupList.removeChild(groupList.childNodes[i]);
	}
	
}



function message(){
	
	alert("쪽지");
	
}



</script>
<!--<form id="messageForm" name="messageForm" method="post" action=""
	style="margin: 0px">
  
<input type="hidden" id = "act" name="act" value="">
<input type="hidden" id = "fr_id" name="fr_id" value=""> 					
<input type="hidden" id = "m_id" name="m_id" value="memberDto.getM_id()%>">		
<input type="hidden" id = "from_id" name="from_id" value="">				
<input type="hidden" id = "from_name" name="from_name" value=""> 	
 -->	

<div class="wrapper">
<%if(memberDto != null){%>
<div class="container">
	<div class="col-md-1 col-lg-2"></div>
	
	<div class="panel panel-default widget col-md-10 col-lg-8">
            <div class="panel-heading" id="SStab">
            <ul>
				<li class="on"><a href="javascript:friendRequest();">친구 신청</a></li>
				<li><a href="javascript:groupRequest();">그룹 신청</a></li>
	            
			</ul>
            </div>
            
            
            <div class="panel-body">
                <ul class="list-group" id="list">
                <!-- 리스트 들어갈 자리 -->
                
                
                
                </ul>
            </div>
        </div>
      <div class="col-md-1 col-lg-2"></div>
    </div>
<%} else { %>

alert("로그인하세요");

<%} %>
</div>
<%@include file="/common/footer.jsp" %>

</body>
</html>