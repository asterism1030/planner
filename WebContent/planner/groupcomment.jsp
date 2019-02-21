<%@page import="com.project.planner.model.GroupMemberDto"%>
<%@page import="com.project.planner.model.service.PlannerServiceImpl"%>
<%@page import="com.project.planner.model.PlannerDto"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.project.util.Encoder"%>
<%@page import="java.util.List"%>
<%@page import="com.project.comment.model.CommentDto"%>
<%@page import="com.project.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String p_id = request.getParameter("p_id");
String g_id = request.getParameter("g_id");
List<PlannerDto> plist = PlannerServiceImpl.getPlannerService().plannerInfo(p_id);
String p_subject = plist.get(0).getP_subject();
String start_day = request.getParameter("start_day");

List<GroupMemberDto> glist = (List<GroupMemberDto>) request.getAttribute("groupmember");
int firstLike = (Integer) request.getAttribute("firstlike");
%>
<%@include file = "/common/public.jsp" %>

<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('<%=root%>/image/plannerbg.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>

<%@ include file = "/facebook/facebook.jsp"%>

<script type="text/javascript">

$(document). ready(function(){
	
	cptCheck();
	  
	toPublic();
	  
	like();
	
	
	$.ajax({
		type: "POST",
		dataType: 'json',
		url: "<%= root %>/comment",
    	data: { act:"gcommentList", p_id: "<%=p_id%>", g_id: "<%=g_id%>" },
	    success:function(data) {
	    	commentList(data);
		},
     	error:function(e){
     		alert("에러가 왜 나와!!");
     	}
	 });
	

	$("#cmtwrite").click(function(){
		commentWrite();
	});
	
	//$("#commentval").keypress(function(e){
	//	if(e.keyCode == 13) {
	//		commentWrite();
	//	}
	//});
	
	
});

//-------------------------------------------comment-----------------------------------------//

function commentWrite() {
	
	if($("#commentval").val() != "") {
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: "<%= root %>/comment",
	     	data: { act:"gwrite", p_id: "<%=p_id%>", g_id: "<%=g_id%>", comment: $("#commentval").val() },
		    success:function(data) {
		    	$("#commentval").val("");
		    	commentList(data);
			},
	     	error:function(e){
	     		alert("에러!!");
	     	}
		 });
		} else {
			alert("댓글 내용을 입력하세요.");
		}
	
}


function commentDelete(gc_id) {
	if(confirm("정말로 삭제하시겠습니까?")) {
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: "<%= root %>/comment",
	     	data: { act:"gdelete", p_id: "<%=p_id%>", gc_id: gc_id },
		    success:function(data) {
		    	alert("댓글이 삭제 되었습니다.");
		    	commentList(data);
			},
	     	error:function(e){
	     		alert("에러!!");
	     	}
		 });
	}
	
}


function commentModify(gc_id) {
	$.ajax({
		type: "POST",
		dataType: 'json',
		url: "<%= root %>/comment",
     	data: { act:"gmodify", p_id: "<%=p_id%>", gc_id: gc_id, comment:  $("#commentModify" + gc_id).val() },
	    success:function(data) {
	    	alert("댓글이 수정 되었습니다.");
	    	commentList(data);
		},
     	error:function(e){
     		alert("에러!!");
     	}
	 });
	
}



function mvCommentModify(gc_id) {
	$("#modiform" + gc_id).css("display", "");
	//$("#modiform" + gc_id).slideDown(500);
}

function closeCommentModify(gc_id) {
	$("#modiform" + gc_id).css("display", "none");
}


function commentList(data) {
	var len = data.commentlist.length;
	
	var output = "";
	for(var i=0; i<len; i++) {
		var gc_id = data.commentlist[i].gc_id;
		var p_id = data.commentlist[i].p_id;
		var g_id = data.commentlist[i].g_id;
		var m_id = data.commentlist[i].m_id;
		var m_name = data.commentlist[i].m_name;
		var gc_content = data.commentlist[i].gc_content;
		var gc_date = data.commentlist[i].gc_date;
		output += "	<div class=\"col-xs-3 col-sm-3 col-md-2 col-lg-2\">";
		output += "            <img class=\"img-circle pull-left\" src=\"<%=root%>/image/cprofile.png\" style=\"max-width: 95%\">";
		output += "	</div>";
		output += "	<div class=\"col-xs-9 col-sm-9 col-md-10 col-lg-10\">";
		output += "            <div class=\"well well-sm\">";
		output += "               <h4 class=\"media-heading text-uppercase reviews\">" + m_name + "</h4>";
		output += "                   <ul class=\"media-date text-uppercase reviews list-inline\">";
		output += "                       <li class=\"dd\">" + gc_date +"</li>";
		output += "                   </ul>";
		output += "                   <p class=\"media-comment\">" + gc_content + "</p>";
		output += "                   <div align=\"right\">";
		if(m_id == "<%=memberDto.getM_id()%>") {
			output += "                      <a class=\"btn btn-info btn-circle btn-xs\" href=\"javascript:mvCommentModify('" + gc_id + "')\"><span class=\"glyphicon glyphicon-edit\"></span> 수정</a>";
			output += "                      <a class=\"btn btn-danger btn-circle btn-xs\" href=\"javascript:commentDelete('" + gc_id + "')\"><span class=\"glyphicon glyphicon-remove\"></span> 삭제</a>";
		} else {
			output += "&nbsp;";
		}
		output += "                   </div>";
		output += "              </div>";
		output += "      </div>";

		output += "<div id=\"modiform" + gc_id + "\" style=\"display: none;\">";
		output += "<div class=\"col-xs-10 col-sm-10 col-md-10 col-lg-10\" align=\"right\" style=\"height: 80px;\">";
		output += "	<textarea class=\"form-control\" id=\"commentModify" + gc_id + "\" name=\"commentModify\" rows=\"3\" style=\"height: 100%; width: 75%;\">" + gc_content +"</textarea>";
		output += "</div>";
		output += "<div class=\"col-xs-2 col-sm-2 col-md-2 col-lg-2\" align=\"left\" style=\"height: 80px;\">";
		output += "<a class=\"btn btn-primary btn-circle btn-xs\" href=\"javascript:commentModify('" + gc_id + "')\"><span class=\"glyphicon glyphicon-edit\"></span> 수정</a><br><br>";
		output += "<a class=\"btn btn-warning btn-circle btn-xs\" href=\"javascript:closeCommentModify('" + gc_id + "')\"><span class=\"glyphicon glyphicon-edit\"></span> 취소</a>";
		output += "</div>";
		output += "<br>&nbsp;<br>"
		output += "</div>";
		
		$("#commentlist").empty();
		$("#commentlist").append(output);
	}
}

function groupcomment() {
	document.groupcomment.action = "<%=root%>/comment"
	document.groupcomment.submit();
}
  
function comment() {
	document.comment.action = "<%=root%>/comment"
	document.comment.submit();
}


//-------------------------------------------기타 등등-----------------------------------------//


function cptCheck() {
	  var output = "";
	  if(<%=plist.get(0).getComplete()%> == 0) {
			output += "<button id=\"cptToOne\" type=\"button\" class=\"btn btn-warning btn-md\" onclick=\"javascript:changeCpt(this.value);\" value=\"0\"><i class=\"glyphicon glyphicon-edit faa-tada animated\" style=\"color: gray;\"></i> 계획중</button>";
	  } else {
		  	output += "<button id=\"cptToZero\" type=\"button\" class=\"btn btn-success btn-md\" onclick=\"javascript:changeCpt(this.value);\" value=\"1\"><i class=\"glyphicon glyphicon-check faa-tada animated\" style=\"color: blue;\"></i> 완료됨</button>";
	  }
	  $("#cptcheck").empty();
	  $("#cptcheck").append(output);
}

function changeCpt(val) {
	  $.ajax({
			type: "POST",
			dataType: 'json',
			url: "<%=root%>/planner",
	     	data: { act:"cptcheck", p_id: <%=p_id%>, complete: val },
		    success:function(data) {
		    	cptChecks(data);
			},
	     	error:function(e){
	     		alert("에러!!");
	     	}
		 });
	  
}

function cptChecks(data) {
	  var output = "";
	  var complete = data.getcomplete;
	  if(complete == "0") {
			output += "<button id=\"cptToOne\" type=\"button\" class=\"btn btn-warning btn-md\" onclick=\"javascript:changeCpt(this.value);\" value=\"0\"><i class=\"glyphicon glyphicon-edit faa-tada animated\" style=\"color: gray;\"></i> 계획중</button>";
	  } else {
		  	output += "<button id=\"cptToZero\" type=\"button\" class=\"btn btn-success btn-md\" onclick=\"javascript:changeCpt(this.value);\" value=\"1\"><i class=\"glyphicon glyphicon-check faa-tada animated\" style=\"color: blue;\"></i> 완료됨</button>";
	  }
	  $("#cptcheck").empty();
	  $("#cptcheck").append(output);
}



function toPublic() {
	  var output = "";
	  if(<%=plist.get(0).getP_public()%> == 0) {
			output += "<button id=\"publicToOne\" type=\"button\" class=\"btn btn-warning btn-md\" onclick=\"javascript:changePublic(this.value);\" value=\"0\"><i class=\"glyphicon glyphicon-eye-close faa-bounce animated\" style=\"color: gray;\"></i> 비공개</button>";
	  } else {
		  	output += "<button id=\"publicToZero\" type=\"button\" class=\"btn btn-success btn-md\" onclick=\"javascript:changePublic(this.value);\" value=\"1\"><i class=\"glyphicon glyphicon-eye-open faa-bounce animated\" style=\"color: blue;\"></i> 공개중</button>";
	  }
	  $("#onPublic").empty();
	  $("#onPublic").append(output);
}


function changePublic(val) {
	  $.ajax({
			type: "POST",
			dataType: 'json',
			url: "<%=root%>/planner",
	     	data: { act:"topublic", p_id: <%=p_id%>, publics: val },
		    success:function(data) {
		    	toPublics(data);
			},
	     	error:function(e){
	     		alert("에러!!");
	     	}
		 });
	  
}


function toPublics(data) {
	  var output = "";
	  var publics = data.getpublic;
	  if(publics == "0") {
			output += "<button id=\"likeOn\" type=\"button\" class=\"btn btn-warning btn-md\" onclick=\"javascript:changePublic(this.value);\" value=\"0\"><i class=\"glyphicon glyphicon-eye-close faa-bounce animated\" style=\"color: gray;\"></i> 비공개</button>";
	  } else {
		  	output += "<button id=\"likeOff\" type=\"button\" class=\"btn btn-success btn-md\" onclick=\"javascript:changePublic(this.value);\" value=\"1\"><i class=\"glyphicon glyphicon-eye-open faa-bounce animated\" style=\"color: blue;\"></i> 공개중</button>";
	  }
	  $("#onPublic").empty();
	  $("#onPublic").append(output);
}



//

function like() {
	  var output = "";
	  if(<%=firstLike%> == 0) {
			output += "<button id=\"publicToOne\" type=\"button\" class=\"btn btn-warning btn-md\" onclick=\"javascript:changeLike(this.value);\" value=\"1\"><i class=\"fa fa-heart faa-pulse animated\" style=\"color: gray;\"></i> 좋아요</button>";
	  } else {
		  	output += "<button id=\"publicToZero\" type=\"button\" class=\"btn btn-success btn-md\" onclick=\"javascript:changeLike(this.value);\" value=\"0\"><i class=\"fa fa-heart faa-pulse animated\" style=\"color: red;\"></i> 좋아요</button>";
	  }
	  $("#like").empty();
	  $("#like").append(output);
}


function changeLike(val) {
	  $.ajax({
			type: "POST",
			dataType: 'json',
			url: "<%=root%>/planner",
	     	data: { act:"like", p_id: <%=p_id%>, like: val },
		    success:function(data) {
		    	likes(data);
			},
	     	error:function(e){
	     		alert("에러!!");
	     	}
		 });
	  
}


function likes(data) {
	  var output = "";
	  var like = data.getlike;
	  if(like == "0") {
			output += "<button id=\"likeOn\" type=\"button\" class=\"btn btn-warning btn-md\" onclick=\"javascript:changeLike(this.value);\" value=\"1\"><i class=\"fa fa-heart faa-pulse animated\" style=\"color: gray;\"></i> 좋아요</button>";
	  } else {
		  	output += "<button id=\"likeOff\" type=\"button\" class=\"btn btn-success btn-md\" onclick=\"javascript:changeLike(this.value);\" value=\"0\"><i class=\"fa fa-heart faa-pulse animated\" style=\"color: red;\"></i> 좋아요</button>";
	  }
	  $("#like").empty();
	  $("#like").append(output);
}

</script>

<form id="groupcomment" name="groupcomment" method="post" action="">
<input type="hidden" name="act" value="mvgroupcomment">
<input type="hidden" name="p_id" value="<%=p_id%>">
<input type="hidden" name="subject" value="<%=plist.get(0).getP_subject()%>">
<input type="hidden" name="g_id" value="<%=plist.get(0).getG_id()%>">
<input type="hidden" name="start_day" value="<%=plist.get(0).getStart_day()%>">
</form>

<form id="comment" name="comment" method="post" action="">
<input type="hidden" name="act" value="mvcomment">
<input type="hidden" name="p_id" value="<%=p_id%>">
<input type="hidden" name="subject" value="<%=plist.get(0).getP_subject()%>">
<input type="hidden" name="g_id" value="<%=plist.get(0).getG_id()%>">
<input type="hidden" name="start_day" value="<%=plist.get(0).getStart_day()%>">
</form>

<div class="wrapper">
<div class="container bg3">
		<div class="col-sm-12 col-md-12 col-lg-10 col-lg-offset-1">
		<h2><b><%=p_subject%></b></h2>
		<font style="font-size: 13pt;"><i class="glyphicon glyphicon-user"></i> :  </font>
		<%
		for(GroupMemberDto groupMemberDto : glist) {
		%>
		<font style="font-size: 13pt;"><%=groupMemberDto.getM_name()%>&nbsp;&nbsp;</font>
		<%
		}
		%>
		<br>&nbsp;
		
		 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="right">
		<%
		for(GroupMemberDto groupMemberDto : glist) {
			if(memberDto.getM_id().equals(groupMemberDto.getM_id())) {
		%>
		<span id="onPublic"></span>
		&nbsp;&nbsp;
		<span id="cptcheck"></span>
		&nbsp;&nbsp;
		<%
		break;
		}
		}
		%>
		<span id="like"></span>
		</div>
		
		<br>&nbsp;
		<div class="row tabbed round">
			<ul>
				<a href="javascript:comment();"><li>댓글</li></a>
				<a href="javascript:groupcomment();"><li class="active">그룹 댓글</li></a>
				<a href="<%= root %>/planner?act=dayplan&date=<%=start_day%>&p_id=<%=p_id%>">
				<li>플래너</li></a>
			</ul>
		</div>
		
			<legend>
				<i class="glyphicon glyphicon-comment"></i> 그룹 댓글
			</legend>
			
			<div class="row">
            <div id="commentlist"></div>
            <legend></legend>
            </div>


	<!-- <div class="col-sm-1 col-md-2 col-lg-3"></div> -->
	<!-- <div class="col-sm-10 col-md-8 col-lg-6"> -->
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><label class="control-label" for="inputLarge">댓글</label></div>
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="height: 80px;" align="right">
		
<textarea class="form-control" id="commentval" name="commentval" rows="3" style="height: 100%; width: 90%;"></textarea>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="left" style="height: 80px;">
		<br><input class="btn btn-primary btn-lg" type="button" id="cmtwrite" value="등록" alt="등록"></div>
	<!-- </div> -->
	<!-- <div class="col-sm-1 col-md-2 col-lg-3"></div> -->
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
</div>
</div>


	<div class="row">&nbsp;</div>



<%@ include file="/common/footer.jsp" %>

</body>
</html>