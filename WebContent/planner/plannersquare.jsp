<%@page import="com.project.util.Encoder"%>
<%@page import="com.project.util.ParameterCheck"%>
<%@page import="com.project.util.PageNavigator"%>
<%@page import="com.project.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.List, com.project.planner.model.*"%>
<%
int pg = ParameterCheck.nullToOne(request.getParameter("pg"));
String key = ParameterCheck.nullToBlank(request.getParameter("key"));//검색조건 : 글번호, 이름, 아이디, 제목
String word = Encoder.isoToUtf(request.getParameter("word"));
List<PlannerDto> list = (List<PlannerDto>) request.getAttribute("plannerlist");
PageNavigator navigator = (PageNavigator) request.getAttribute("navigator");
%>
<%@include file = "/common/public.jsp" %>
<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('<%=root%>/image/squarebg2.jpeg') no-repeat center center fixed;
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
function selectPlanner(start_day, p_id) {
	  var login = "<%=memberDto%>"; 
	  if(login != "null") {
		document.location.href = "<%= root %>/planner?act=dayplan&p_id=" + p_id + "&date=" + start_day;
	  } else {
		  alert("로그인 후 이용 가능합니다.");
	  }
}

function listArticle(pg) {
	document.getElementById("pgs").value = pg;
	document.commonform.action = "<%=root%>/planner";
	document.commonform.submit();
}

function searchArticle() {
	if(document.searchForm.word.value == "") {
		alert("검색어를 입력해주세요!");
		return;
	} else {
		document.searchForm.action = "<%=root%>/planner";
		document.searchForm.submit();
	}	
}
</script>

<div class="wrapper">
<br>
<div class="row bg1" align="center">
<h1><font color="black" style="font-style: italic;">플래너 광장</font></h1>
</div>
<br>&nbsp;

<form name="commonform" method="get">
<input type="hidden" name="act" value="plannersquare">
<input type="hidden" name="pg" id="pgs" value="<%=pg%>">
<input type="hidden" name="key" id="key" value="<%=key%>">
<input type="hidden" name="word" id="word" value="<%=word%>">
</form>

<div class="container bg1" style="border-radius: 20px;">
	<br>
	<br>
	<div class="container" align="center">
	<form name="searchForm" method="get" action="" onsubmit="return false;"
		style="margin: 0px">
		<input type="hidden" name="act" value="plannersquare">
		<input type="hidden" name="pg" value="1">
	
		<select name="key" style="height: 26px;">
			<option value="subject">글제목</option>
			<option value="name">글쓴이</option>
			<option value="id">아이디</option>
		</select>
			<span id="sear1"> <input type="text" name="word" size="22"
				class="inp" onkeypress="javascript:if(event.keyCode == 13) {searchArticle('1');}"> 
			</span>
			<span>
			<button class="btn-primary" style="width: 50px;" onclick="javascript:searchArticle();">검색</button>
			</span>
	</form>
	</div>	
		
		
		
		
	<br>&nbsp;
	<br>&nbsp;

        <div class="row">
        
         <% 
         int count = 0;
         for(PlannerDto plannerDto : list) {
        	 ++count;
         %>
          <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3" align="center">
          <a href="javascript:selectPlanner('<%=plannerDto.getStart_day()%>', '<%=plannerDto.getP_id()%>')" style="text-decoration: none;">
          <div class="bg3 border">
            <img src="<%= root %>/image/<%= plannerDto.getP_img() %>.jpg"
            class="img-responsive">
            <h3 style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;"><%= plannerDto.getP_subject() %></h3>
            <p>시작일 : <%= plannerDto.getStart_day() %>
              <br>종료일 : <%= plannerDto.getEnd_day() %>
              <br><i class="glyphicon glyphicon-user"></i> <%=plannerDto.getM_name()%></p>
              </div>
              </a>
              <div>&nbsp;</div>
          </div>
          <%
        	// }
          if(count % 4 == 0) {
          %>
          <div align="center">
          <br>&nbsp;
          <br>
          </div>
          <%
          }
         }
          %>
          
         
          
        </div>
	
	<%=navigator.getNavigator()%>
        
      </div>
</div>
      


<%@include file="/common/footer.jsp" %>

</body>
</html>