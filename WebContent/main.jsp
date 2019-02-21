<%@page import="com.project.planner.model.service.PlannerServiceImpl"%>
<%@page import="com.project.planner.model.PlannerDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.project.member.model.MemberDto"%>

<%
List<PlannerDto> bestList = PlannerServiceImpl.getPlannerService().bestPlanner();
List<PlannerDto> mainList = PlannerServiceImpl.getPlannerService().adminSelectPlanner();
%>

<%@include file = "/common/public.jsp" %>

<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('${root}/image/mainbg2.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>

<script type="text/javascript">
  function mvPlanner(){
	  var login = "${userInfo}"; 
	  if(login != "null") {
	  document.location.href="${root}/planner?act=mvplanner";
	  } else {
		  alert("로그인 후 이용 가능합니다.");
	  }
  }
  
  
  function logout() {
	  if(confirm("로그아웃 하시겠습니까?")) {
		facebooklogout();
		document.location.href = "${root}/user?act=logout";
	  } else {
		  
	  }
  }
  
  function bestPlanner(start_day, p_id) {
	  var login = "${userInfo}"; 
	  if(login != "") {
		document.location.href = "${root}/planner?act=dayplan&date=" + start_day + "&p_id=" + p_id;
	  } else {
		  alert("로그인 후 이용 가능합니다.");
	  }
}
</script>

<div class="wrapper">
<div class="row slider">
	<div id="carousel-example" data-interval="false" class="carousel slide" data-ride="carousel">
	
	<ol class="carousel-indicators">
    <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example" data-slide-to="1"></li>
    <li data-target="#carousel-example" data-slide-to="2"></li>
  	</ol>
  
      <div class="carousel-inner">

	<!-- 
	<c:set var="i" value="1"/>
      <c:forEach var="PlannerDto" items="${bestlist}">
	      <c:if test="${i eq '1'}">
	      	<div class="itemactive" align="center"><div class="overlay"></div>
	      <a href="javascript:bestPlanner('${PlannerDto.start_day}','${PlannerDto.p_id}')" style="text-decoration: none;">
	      <img src="${root}/image/img${i}.jpg" style="width: 100%"></a>
		      <div class="carousel-caption">
		      	<h2>${PlannerDto.p_subject}</h2>
		      	<p>${PlannerDto.m_name}</p>
		      </div>
	      </div>
	      </c:if>
	      <c:if test="${i ne '1'}">
	      	<div class="item" align="center"><div class="overlay"></div>
	      <a href="javascript:bestPlanner('${PlannerDto.start_day}','${PlannerDto.p_id}')" style="text-decoration: none;">
	      <img src="${root}/image/img${i}.jpg" style="width: 100%"></a>
		      <div class="carousel-caption">
		      	<h2>${PlannerDto.p_subject}</h2>
		      	<p>${PlannerDto.m_name}</p>
		      </div>
	      </div>
	      </c:if>
	      <c:set var="i" value="${i+1}"></c:set>
      </c:forEach>
	 -->      
	 
	   <%
      int i=1;
      for(PlannerDto plannerDto : mainList) {
      	%>
      	<div class="item 
      	<%if(i==1) { %>
      	active
      	<%} else {} %>
      	" align="center">
        <div class="overlay"></div>
        <a href="javascript:bestPlanner('<%=plannerDto.getStart_day()%>', '<%=plannerDto.getP_id()%>')" style="text-decoration: none;">
          <img src="${root}/image/img<%=i%>.jpg" style="width: 100%"></a>
          <div class="carousel-caption">
            <h2><%=plannerDto.getP_subject()%></h2>
            <p><%=plannerDto.getM_name()%></p>
          </div>
        </div>
      
      <%
      i++;
      }
      %>
	 
      
           
      <a class="left carousel-control" href="#carousel-example" data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a>
      <a class="right carousel-control" href="#carousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
    </div>
</div>
</div>

<br>
<br>

<div class="row bg1" align="center">
<h1 style="font-style: italic; color: black;">BEST PLANNER</h1>
</div>
<br>
<br>

<div class="container bg1" style="border-top-left-radius: 20px; border-bottom-right-radius: 20px;">
<br>
        <div class="row">
        
         <% 
         for(PlannerDto plannerDto : bestList) {
         %>
          <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3" align="center">
          <a href="javascript:bestPlanner('<%=plannerDto.getStart_day()%>', '<%=plannerDto.getP_id()%>')" style="text-decoration: none;">
          <div class="border bg3">
          
            <img src="${root}/image/<%= plannerDto.getP_img() %>.jpg"
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
         }
          %>
        </div>
      </div>
</div>
<%@include file="/common/footer.jsp" %>

</body>
</html>