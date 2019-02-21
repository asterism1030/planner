<%@page import="com.project.util.ParameterCheck"%>
<%@page import="com.project.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.List, com.project.planner.model.*"%>
<%
List<DayRouteDto> drlist = (List<DayRouteDto>) request.getAttribute("dayroute");
List<DayPlanDto> dplist = (List<DayPlanDto>) request.getAttribute("dayplan");
List<PlannerDto> plist = (List<PlannerDto>) request.getAttribute("plannerInfo");
List<GroupMemberDto> glist = (List<GroupMemberDto>) request.getAttribute("groupmember");
String googleapikey = "AIzaSyAn8_26RCYdUxvtjjARwYSawXMJNdEs6LU";

String date = request.getParameter("date");
String p_id = request.getParameter("p_id");

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
  
  function getParameterByName( name ) //courtesy Artem
  {
    name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regexS = "[\\?&]"+name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var results = regex.exec( window.location.href );
    if( results == null )
      return "";
    else
      return decodeURIComponent(results[1].replace(/\+/g, " "));
  }
  
  
  
  function selectDate() {
	  
	document.selectDate.action = "<%=root%>/planner"
	document.selectDate.submit();
	
  }
	  
  function groupcomment() {
	document.groupcomment.action = "<%=root%>/comment"
	document.groupcomment.submit();
  }
	  
  function comment() {
		document.comment.action = "<%=root%>/comment"
		document.comment.submit();
  }
  
  function deletePlanner() {
	  
	  if(confirm("정말로 삭제하시겠습니까?")) {
	  	document.deleteplanner.action = "<%=root%>/planner";
	  	document.deleteplanner.submit();
	  } else {
		  
	  }
  }
  
  function mvCorrectPlanner(){
	 
	
	document.location.href="<%=root%>/planner?act=mvCorrectPlanner&p_id=<%=p_id%>&date=<%=date%>";
	
  }
	
  function getParameterByName( name ) //courtesy Artem
  {
    name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regexS = "[\\?&]"+name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var results = regex.exec( window.location.href );
    if( results == null )
      return "";
    else
      return decodeURIComponent(results[1].replace(/\+/g, " "));
  }		  
		

  $(document). ready(function(){
	  
	  cptCheck();
	  
	  toPublic();
	  
	  like();
	  
	  var date = getParameterByName("date");
	  $.ajax({
	      type: "GET",
	      dataType: 'json',
	      url: "<%=root%>/planner",
	      data: { act : "getdata", p_id : <%=p_id%>, date : date },
	      success:function(data) {
	      	loadData(data);
	      },
	      error: function(e) {
	      	alert("loaddata ajax 에러!!");
	      }
      });
	  
  });
  
  
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

<form id="deleteplanner" name="deleteplanner" method="post" action="">
<input type="hidden" name="act" value="deleteplanner">
<input type="hidden" name="select" value="1">
<input type="hidden" name="p_id" value="<%=p_id%>">
</form>
<div class="wrapper">
<div class="container bg3">
	<div class="col-sm-12 col-md-12 col-lg-10 col-lg-offset-1">
		<h2><b><%=plist.get(0).getP_subject()%></b></h2>
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
				<%
				for(GroupMemberDto groupMemberDto : glist) {
					if(memberDto.getM_id().equals(groupMemberDto.getM_id())) {
				%>
				<a href="javascript:groupcomment();"><li>그룹 댓글</li></a>
				<%
					}
				}
				%>
				<a href="<%= root %>/planner?act=dayplan&date=<%=plist.get(0).getStart_day()%>&p_id=<%=p_id%>">
				<li class="active">플래너</li></a>
			</ul>
		</div>
		
		<div>
		<label><font style="font-size: 15pt;">
		<legend>
		<i class="glyphicon glyphicon-calendar"></i> 여행 날짜 : </font></label>&nbsp;&nbsp;
    		<label><font style="font-size:14pt; font-style:italic; border-bottom-style: solid; border-bottom-color: blue; border-bottom-width: 2px">
    		<%= date %></font></label>&nbsp;&nbsp;&nbsp;
        	<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal">
        	<i class="glyphicon glyphicon-list"></i> 날짜선택</button>
        	</legend>
		</div>
		<br>
		<legend>
			<i class="glyphicon glyphicon-road"></i> <b>일일 경로</b>
		</legend>
		
		<div class="col-sm-12 col-md-6 col-lg-6">
			
		<!-- <div class="container">
		
			<div class="col-sm-12 col-md-6 col-lg-6">
	    		<label>여행 날짜</label>&nbsp;&nbsp;&nbsp;
	    		<label><%= date %></label>&nbsp;&nbsp;&nbsp;
	        	<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal">
	        	<i class="glyphicon glyphicon-list"></i> 날짜선택</button>
			</div>
		</div> -->
		
		<br>
					<%
					for(DayRouteDto dayRouteDto : drlist) {
						if(dayRouteDto.getDr_date().equals(date)) {
					%>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2"
					 style="background-color: #D4F4FA; font-size: x-large; font-style:italic; height: 50px; padding-top: 8px; border-style: solid; border-color: gray; border-width: 2px; border-top-left-radius: 20px;" align="center">
					<%=dayRouteDto.getDr_order()+1%></div>
					<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10"
					 style="background-color: #E6F4FA; font-size: medium; height: 50px; border-style: solid; border-color: gray; border-width: 2px; padding-top: 12px; border-left-style: none; border-bottom-right-radius: 20px; overflow:auto;">
					<%= dayRouteDto.getDr_location() %></div>
					</div>
					<br>
					<br>
					<br>
					<%
					}
					} 
					%>
					<br>&nbsp;
				</div>
				
				
				<div class="col-sm-12 col-md-6 col-lg-6" id="map" style ="height:80%; min-height :350px; border-color:black;  border-style: solid; border: thick;">
		<script type="text/javascript">
		var markers = [];
		var address = [];
		var poly;
		var bounds;
		
		var map;
		var defaultLat = 36.661662;
		var defaultLng = 127.883371;
		var defaultLevel = 7;
		
		function initMap() {
			bounds = new google.maps.LatLngBounds();	
		    var korea = {lat: defaultLat, lng: defaultLng};

			   map = new google.maps.Map(document.getElementById('map'), {
			   zoom: defaultLevel,
			   center: korea,
			  
			});
			   
		    var lineSymbol = {
					path : google.maps.SymbolPath.FORWARD_CLOSED_ARROW
			};


			poly = new google.maps.Polyline({
			    strokeColor: '#ff0000',
			    strokeOpacity: 1.0,
			    icons: [{
			      icon: lineSymbol,
			      offset: '100%',
			   	  repeat: '20%'
			    }],
			    strokeWeight: 1.5
			    
			}); 
			poly.setMap(map);   
			   
		}
		
		
		function loadData(data){
			  
			  for (var i = 0; i < markers.length; i++) {
		  	      markers[i].setMap(null);
			  }
		      markers = [];

			  var len = data.getdata.locationAll.length;
			  
			  for(var i = 0 ; i < len; i++){
				  
				  var address = data.getdata.locationAll[i].location;
				  var mapLat = data.getdata.latAll[i].lat;
				  var mapLng = data.getdata.lngAll[i].lng;
				  var latLng = {lat: mapLat, lng: mapLng};
				  
				  marker = new google.maps.Marker({
				      position: latLng,
				      map: map
				  });
				  markers.push(marker);
				  bounds.extend(marker.getPosition());
				  map.fitBounds(bounds);
				  var path = poly.getPath();
				  path.push(markers[i].getPosition());
				  
			  }
		  }
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=<%=googleapikey%>&libraries=places&callback=initMap"
	               async defer></script>
		</div>
				<br>&nbsp;
				<br>&nbsp;
		
		
		
		<legend>
				<i class="glyphicon glyphicon-time"></i> <b>일일 계획</b>
			</legend>
			
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			
			
			<%
			for(DayPlanDto dayPlanDto : dplist) {
				if(dayPlanDto.getDp_date().equals(date)) {
			%>
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
         		<label><i class="glyphicon glyphicon-plane"></i> 교통편</label>&nbsp;&nbsp;
         		<input class="form-control" type="text" readonly="readonly" value = "<%= ParameterCheck.nullToBlank(dayPlanDto.getDp_transportation())%>"/>
				<br>
			</div>
			
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
         		<label><i class="glyphicon glyphicon-home"></i> 숙박</label>&nbsp;&nbsp;
         		<input class="form-control" type="text" readonly="readonly" value = "<%= ParameterCheck.nullToBlank(dayPlanDto.getDp_lodgment()) %>"/>
				<br>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
         		<label><i class="glyphicon glyphicon-pencil"></i> 메모</label>&nbsp;&nbsp;
         		<textarea maxlength="400" class= "form-control" id="memo" name = "memo" rows="5" cols="40" readonly="readonly"><%= ParameterCheck.nullToBlank(dayPlanDto.getDp_memo()) %></textarea>
				<br>
			</div>
			
			<%
				}
			} 
			%>
			
				<%
					if(memberDto.getM_id().equals(plist.get(0).getM_id())) {
				%>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					<button class="btn btn-lg btn-primary btn-block" type="submit" onclick="javascript:mvCorrectPlanner()">
					<i class="glyphicon glyphicon-edit"></i> 수정하기</button>
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="right">
					&nbsp;
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="right">
					<button class="btn btn-xs btn-danger btn-block" type="submit" style="width: 80px;"
					onclick="javascript:deletePlanner();">
					<i class="glyphicon glyphicon-remove"></i> 삭제하기</button>
					</div>
					<br>&nbsp;
					<br>
				<%
					}
				%>
			
			<!-- 
			<div class="col-xs-10 col-sm-8 col-md-6 col-lg-6 col-xs-offset-1 col-sm-offset-2 col-md-offset-0 col-lg-offset-0">
				<button class="btn btn-lg btn-primary btn-block" type="submit" onclick="javascript:mvCorrectPlanner()">
				<i class="glyphicon glyphicon-edit"></i>수정하기
				</button>
				<br>
			</div>
			<div class="col-xs-10 col-sm-8 col-md-6 col-lg-6 col-xs-offset-1 col-sm-offset-2 col-md-offset-0 col-lg-offset-0">
				<button class="btn btn-lg btn-danger btn-block" type="submit" onclick="javascript:deletePlanner();">
				<i class="glyphicon glyphicon-remove"></i> 삭제하기
				</button>
				<br>
			</div>
			-->
			
		</div>
		
	</div>
	
</div>
</div>	



<!----------- Modal ----------->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><i class="glyphicon glyphicon-list"></i> 날짜선택</h4>
      </div>
      <div class="modal-body">
       	<label>여행날짜</label>
       	<form id="selectDate" name="selectDate" method="get" action="">
       	<input type="hidden" name="act" value="dayplan">
       	<input type="hidden" name="p_id" value="<%=p_id%>">
        <select class="form-control" name="date" id="date">
        <%
        String checkdate="";
        for(DayRouteDto dayRouteDto : drlist) {
        	if(!checkdate.equals(dayRouteDto.getDr_date())) {
        %>
		<option id = "" value="<%=dayRouteDto.getDr_date()%>"><%=dayRouteDto.getDr_date()%></option>
		<%
        	}
        	checkdate = dayRouteDto.getDr_date();
        }
		%>
		</select>
		</form>
      </div>
      <div class="modal-footer">
      <a href="javascript:selectDate();">선택</a>
      </div>
      
    </div>
  </div>
</div>		
		

<%@ include file="/common/footer.jsp" %>

</body>
</html>