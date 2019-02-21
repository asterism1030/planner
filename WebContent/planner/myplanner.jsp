<%@page import="com.project.util.PageNavigator"%>
<%@page import="com.project.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.List, com.project.planner.model.*"%>
<%
List<PlannerDto> list = (List<PlannerDto>) request.getAttribute("myplanner");
int select = Integer.parseInt(request.getParameter("select"));
PageNavigator navigator = (PageNavigator) request.getAttribute("navigator");
%>
<%@include file = "/common/public.jsp" %>

<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('<%=root%>/image/myplanbg.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>
<script type="text/javascript">
function listArticle(pg) {
	//document.getElementById("act").value = "listarticle";
	var page = pg;
	
	document.location.href = "<%=root%>/planner?act=myplanner&select=" + <%=select%> + "&pg=" + page;
	//document.commonform.submit();
}
</script>
<div class="wrapper">
<div class="container bg1" style="border-radius: 20px;">
<br>
<div class="row" align="center" style="font-size: large;">
<%
if(select == 1) {
%>
<a href="<%=root%>/planner?act=myplanner&select=1"><b>완료된 일정</b></a>&nbsp;<b>ㅣ</b>&nbsp;
<a href="<%=root%>/planner?act=myplanner&select=0">계획중 일정</a>&nbsp;<b>ㅣ</b>&nbsp;
<a href="<%=root%>/planner?act=myplanner&select=2">좋아요한 일정</a>
<%
} else if(select == 0) {
%>
<a href="<%=root%>/planner?act=myplanner&select=1">완료된 일정</a>&nbsp;<b>ㅣ</b>&nbsp;
<a href="<%=root%>/planner?act=myplanner&select=0"><b>계획중 일정</b></a>&nbsp;<b>ㅣ</b>&nbsp;
<a href="<%=root%>/planner?act=myplanner&select=2">좋아요한 일정</a>
<%
} else if(select == 2) {
%>	
<a href="<%=root%>/planner?act=myplanner&select=1">완료된 일정</a>&nbsp;<b>ㅣ</b>&nbsp;
<a href="<%=root%>/planner?act=myplanner&select=0">계획중 일정</a>&nbsp;<b>ㅣ</b>&nbsp;
<a href="<%=root%>/planner?act=myplanner&select=2"><b>좋아요한 일정</b></a>
<%
}
%>
</div>
<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-1 col-xs-offset-1 col-md-offset-1 col-lg-offset-1" 
style="border: thin; border-color: black; border-style: solid;"></div>
<br>
<br>

        <div class="row">
        
         <% 
         int count = 0;
         for(PlannerDto plannerDto : list) {
        	 //if(plannerDto.getComplete() == complete) {
        	 ++count;
         %>
          <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3" align="center">
          <a href="<%= root %>/planner?act=dayplan&date=<%=plannerDto.getStart_day()%>&p_id=<%=plannerDto.getP_id()%>" style="text-decoration: none;">
          <div class="border bg3">
            <img src="<%= root %>/image/<%= plannerDto.getP_img() %>.jpg" class="img-responsive">
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