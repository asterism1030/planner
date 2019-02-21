<%@page import="com.project.planner.model.service.PlannerServiceImpl"%>
<%@page import="com.project.planner.model.GroupMemberDto"%>
<%@page import="java.util.List"%>
<%@page import="com.project.planner.model.DayRouteDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file = "/common/public.jsp" %>    
<%
int p_id = Integer.parseInt(request.getParameter("p_id"));
String startdate = request.getParameter("startdate");
String googleapikey = "AIzaSyAn8_26RCYdUxvtjjARwYSawXMJNdEs6LU";
List<GroupMemberDto> glist = PlannerServiceImpl.getPlannerService().groupMember(Integer.toString(p_id));
%>
<link rel="stylesheet" href="<%=root%>/css/jquery.searchableSelect.css">
<script type="text/javascript" src="<%=root%>/js/jquery.searchableSelect.js"></script>
<script type="text/javascript" src="<%=root%>/js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script type="text/javascript" src="<%=root%>/js/map.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">  
  
 
  
  <style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('<%=root%>/image/dayplanbg.jpg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
	}

     .controls {
     margin-top: 10px;
     border: 1px solid transparent;
     border-radius: 2px 0 0 2px;
     box-sizing: border-box;
     -moz-box-sizing: border-box;
     height: 32px;
     outline: none;
     box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
   	}
   
   #day {
    width: 200px;
    height: 30px;
    border: 1px solid #E9DDDD;
	}
	
   #div1, #div2{
   
   float : left;
   margin : 10px;
   }
   
   #div3, #div4{
   float : left;
   margin : 15px;
   
   }
   
	.d1 {background: #A3D0C3;}
	.d1 input {
	  width: 100%;
	  height: 42px;
	  padding-left: 10px;
	  border: 2px solid #7BA7AB;
	  border-radius: 5px;
	  outline: none;
	  background: #ffffff;
	  color: #9E9C9C;
	}
	.d1 button {
	  position: absolute; 
	  top: 0;
	  right: 0px;
	  width: 42px;
	  height: 42px;
	  border: none;
	  background: #7BA7AB;
	  border-radius: 0 5px 5px 0;
	  cursor: pointer;
	}
	.d1 button:before {
	  content: "\f002";
	  font-family: FontAwesome;
	  font-size: 16px;
	  color: #F9F0DA;
	}
   
  </style>
  
  
  <script type="text/javascript">
  
  var flag = true;
  var list;
  var dayList;
  
  function donePlanner(){
	  
	  document.location.href="<%=root%>/planner?act=myplanner&select=0";
  }
  
  function savePlanner(){
		
		 var lat="";
		 var lng="";
		 var order="";
		 var area="";
		 
		 var len =  markers.length;
		 
		 if(len != 0){
			 for(var i = 0; i < len; i++){
					
				 lat += markers[i].getPosition().lat();
				 lng += markers[i].getPosition().lng();
				 order += i;
				 area += addresses[i];
				 
				 if(i != len-1){
					 
					 lat += "##";
					 lng += "##";
					 order += "##";
					 area += "##";
				 }
			 }
			 document.getElementById("order").value=order;
			 document.getElementById("lat").value=lat;
			 document.getElementById("lng").value=lng;
			 document.getElementById("location").value= area;
		 }
		 
		 document.getElementById("act").value="saveplanner";
		 document.getElementById("p_id").value="<%=p_id%>";
		 document.getElementById("startdate").value="<%=startdate%>";
		 document.getElementById("date").value = $("#day option:selected").val();
		 
		 document.savePlannerForm.action = "<%=root%>/dayroute";
		 document.savePlannerForm.submit();
		 
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

  
  $(document).ready(function(){
	 
	  var date = getParameterByName("startdate");
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
	  
	  $("#addGroupMember").click(function(){
		 
		  if(flag == true){
			  $(function(){
				  $("#selectid").searchableSelect();
				});
			  flag= false;
		  }
	  });
	  
	  
 	  $("#groupList").click(function(){
		  
		  $("#dev-table-filter").empty();
	  });
 	  
 	  $("#day").change(function(){
 		 dr_order = 0;
 		 
 		 $.ajax({
 		    type: "GET",
 		    dataType: 'json',
 		    url: "<%=root%>/planner",
 		    data: { act : "getdata", p_id : <%=p_id%>, date : $("#day option:selected").val() },
 		    success:function(data) {
 		    	
 		    	loadData(data);
 		    },
 		    error: function(e) {
 		    	alert("loaddata ajax 에러!!");
 		    }
 	    });
 		  
 	  });
 	  
 	 $.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "<%=root%>/group",
		    data: { act : "grouplist"},
		    success:function(data) {
		    	//alert("성공!!! : " + data.mlist[0].name);
		    
		    },
		    error: function(e) {
		    	
		    }
	    });
 	 
	  $.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "<%=root%>/friend",
		    data: { act : "friendlist"},
		    success:function(data) {
		    	friendList(data);
		    },
		    error: function(e) {
		    	alert("friendList ajax 에러!!");
		    }
	    });
	  
	  
	  $.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "<%=root%>/planner",
		    data: { act : "datelist", p_id : <%=p_id%>},
		    success:function(data) {
		    	dateList(data);

		    },
		    error: function(e) {
		    	alert("dateList ajax 에러!!");
		    }
	    });
  });
  
  function loadData(data){
	  
	 
	  bounds = new google.maps.LatLngBounds(null);
	  document.getElementById("memo").value = "";
	  document.getElementById("house").value = "";
	  document.getElementById("transport").value="";
	  $("#addLocation").empty();
	  for (var i = 0; i < markers.length; i++) {
  	      markers[i].setMap(null);
	  }
      markers = [];
      addresses=[];
      path = poly.getPath();
      path.clear();
      
      
	  document.getElementById("transport").value = data.getdata.transport;
	  document.getElementById("house").value = data.getdata.house;
	  document.getElementById("memo").value = data.getdata.memo;
	  // var myLatLng = {lat: -25.363, lng: 131.044};

	  var len = data.getdata.locationAll.length;
	  
	  for(var i = 0 ; i < len; i++){
		  
		  var address = data.getdata.locationAll[i].location;
		  var mapLat = data.getdata.latAll[i].lat;
		  var mapLng = data.getdata.lngAll[i].lng;
		  var latLng = {lat: mapLat, lng: mapLng};
		  addRouteDiv(address);
		  
		  marker = new google.maps.Marker({
		      position: latLng,
		      map: map
		  });
		  markers.push(marker);
		  bounds.extend(marker.getPosition());
	      map.fitBounds(bounds);
		  addresses.push(address);
		  var path = poly.getPath();
		  path.push(markers[i].getPosition());
		  
	  }
  }
  
  function dateList(data){
	  
	  	var len = data.dayList.length;
		dayList = document.getElementById("day");
		
		clearDayList();
		
		for(var i = 0 ; i < len; i++){
			var day = data.dayList[i];
			var option = createDay(day);
			dayList.appendChild(option);
		}
		
  }
  
  function createDay(day){
	  
	  var option = document.createElement("option");
	  option.setAttribute("value", day);
	  var optionText = document.createTextNode(day);
	  option.appendChild(optionText);
	  
	  return option;
	  
  }
  

	function invitate(){
		
		
		if(document.getElementById("content").value == "") {
			 document.getElementById("content").value = "저희 플래너로 초대합니다!";
		 }
		var startdate = getParameterByName("startdate");
		document.invitateForm.date.value=startdate;
		document.invitateForm.p_id.value = <%=p_id%>;
		document.invitateForm.toid.value=$("#selectid option:selected").val();
		document.invitateForm.action="<%=root%>/group";
		document.invitateForm.submit();
		
	}
	
	
	function friendList(data){
		
		var len = data.friendList.length;
		list = document.getElementById("selectid");
		
		clearList();
		if(len == 0){
			
			//친구가 없는 것을 보여줘야함.
			
		}
		
		for(var i = 0 ; i < len; i++){
			
			var f_name = data.friendList[i].f_name;
			var f_id = data.friendList[i].f_id;
			var optionItem = createOption(f_id, f_name);
			
			list.appendChild(optionItem);
		}
		
	}
	
	function createOption(f_id, f_name){
		
		var optionItem = document.createElement("option");
		optionItem.setAttribute("value", f_id);
		
		var nameText = document.createTextNode(f_name+"                    ")
		var idText = document.createTextNode("("+f_id+")");
		
		optionItem.appendChild(nameText);
		optionItem.appendChild(idText);
		
		return optionItem;
		
	}
	
	function clearList() {
		var len = list.childNodes.length;
		for(var i=len-1;i>=0;i--) {
			list.removeChild(list.childNodes[i]);
		}
	}
	
	function clearDayList() {
		var len = dayList.childNodes.length;
		for(var i=len-1;i>=0;i--) {
			dayList.removeChild(dayList.childNodes[i]);
		}
	}
  
 
  </script>

<div class="wrapper">
<div class="container bg3">
      
      <!-- =====================맨 윗줄 ================================== -->
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
      <legend>
      
      	<div id ="div1">
            <i class="glyphicon glyphicon-calendar">일일 계획 </i>
        </div>
        
        <div id ="div2">
            <select  class = "form-control" id = "day" name = "day">
              <!-- 선택 날짜 리스트 들어가는 곳 -->
            </select>
        </div>
        
        <div id ="div3">    
            <i class="glyphicon glyphicon-user" id="groupList" data-toggle="modal" data-target="#groupmemberlist">그룹목록</i>
        </div>
        
        <div id ="div4">    
            <i class="glyphicon glyphicon-plus" id="addGroupMember" data-toggle="modal" data-target="#exampleModal">친구초대</i>
        </div>    
            
      </legend>
      </div>
      
      <!-- =====================맨 윗줄 ================================== -->
      
      
      <!-- ===================== 왼쪽 지도 부분============================== -->
      <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
      
      	<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
	      <div class="d1">
		  	<input id="address" type="text" placeholder="여행할 지역을 검색해 주세요">
		  	<button id="submit" type = "button" ></button>
		  </div>
		</div>
		
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
            <input type ="button" class="btn btn-lg btn-primary btn-block" value = "경로 초기화" style="font-size: small;" onclick="javascript:deletePlanner();">
		</div>
		<br><br><br>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
      		<div class ="row">
	        
	          <div id = "map" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style ="height:650px"></div>
	          <script>
                
              
             </script>
	          <script src="https://maps.googleapis.com/maps/api/js?key=<%=googleapikey%>&libraries=places&callback=initMap"
	               async defer></script>
	
	      	</div>
      	</div>
      </div>
      <!-- ===================== 왼쪽 지도 부분============================== -->
      
      
      <!-- ===================== 오른쪽 Form 부분============================== -->
      <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" >
      <form id="savePlannerForm" name = "savePlannerForm" action="" method="post">
      <input type="hidden" id="act" name="act" value="">
      <input type="hidden" id="p_id" name="p_id" value="">
      <input type="hidden" id="location" name="location" value="">
      <input type="hidden" id="order" name="order" value="">
      <input type="hidden" id="lat" name="lat" value="">
      <input type="hidden" id="lng" name="lng" value="">
      <input type="hidden" id="startdate" name="startdate" value="">
      <input type="hidden" id="date" name="date" value="">
            
            <div class ="row">
               	<div class="col-xs-12 col-md-12 col-sm-12">
	               <label for="">이동경로</label>&nbsp;&nbsp;
	               <!-- 일별 이동경로 갯수만큼 표시 -->
	               <!-- <input class="form-control" name="departure" placeholder="출발지" type="button" required autofocus /> <br> -->
	               <div id="addLocation"></div>
               	</div>
               <br>&nbsp;<br>
               	<div class="col-xs-12 col-md-12 col-sm-12">
	         		<label for="">교통편</label>&nbsp;&nbsp;
	         		<input class="form-control" id="transport" name="transport" placeholder="교통편" type="text" required autofocus />
	           	</div>
	         	<br>&nbsp;<br>
	         
	         	<div class="col-xs-12 col-md-12 col-sm-12">
	         		<label for="">숙박</label>&nbsp;&nbsp;
	         		<input class="form-control" id="house" name="house" placeholder="숙박" type="text" required autofocus />
	         	</div>
	         	<br>&nbsp;<br>
	         
	         	<div class="col-xs-12 col-md-12 col-sm-12">
	         		<label for="">메모</label>
	         		<textarea maxlength="400" class= "form-control" id="memo" name = "memo" rows="5" cols="40"></textarea>
	         	</div>
	         	<br>&nbsp;<br>
	         	
	         	<div class="col-xs-6 col-md-6 col-sm-6">
	         		<input type ="button" class="btn btn-lg btn-primary btn-block" value = "저장 " onclick="javascript:savePlanner();">        
	         	</div>
	         	<div class="col-xs-6 col-md-6 col-sm-6">
	         		<input type ="button" class="btn btn-lg btn-primary btn-block" value = "완료" onclick="javascript:donePlanner();">
	         	</div>
            </div>
            <br>
      </form>
      </div>
      <!-- ===================== 오른쪽 Form 부분============================== -->
      
      
      
      <!-- ===================== 친구 목록 모달 창 ============================== -->
<div class="bd-example">
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="exampleModalLabel">플래너로 초대하기</h4>
        </div>
        
        <div class="modal-body">
          <form id="invitateForm" name = "invitateForm" action="" method="post">
      	  <input type="hidden" name="act" value="invitate">
      	  <input type="hidden" name="p_id" value="">
      	  <input type="hidden" name="toid" value="">
      	  <input type="hidden" name="date" value="">
            <div class="form-group">
             <div><label for="recipient-name" class="form-control-label">친구 목록:</label></div>
              <select class= "form-control" id="selectid">
			      <!-- 친구목록 들어가는 놈 -->
		      </select>
            </div>
            
            
            <div class="form-group">
              <label for="message-text" class="form-control-label">내용:</label>
              <textarea class="form-control" name="content" id="content" placeholder="내용을 입력하세요"></textarea>
            </div>
            
          </form>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="javascript:invitate();">초대하기</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ===================== 모달 창 끝============================== -->






<!-- ===================== 그룹원 목록 모달 창 ============================== -->

<div class="bd-example">
  <div class="modal fade" id="groupmemberlist" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" >그룹원 목록</h4>
        </div>
        
        <div class="panel-body">
			<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="검색어를 입력하세요" />
		</div>
					
        <div class="modal-body">
          <form id="" name = "" action="" method="post">
      	  <input type="hidden" name="act" value="">
      	  <input type="hidden" name="toid" value="">
          <table class="table table-hover" id="dev-table">
			<thead>
				<tr>
					<th>#</th>
					<td>아이디</td>
          			<td>이름</td>
				</tr>
			</thead>
			<tbody>
			<%for(GroupMemberDto groupMemberDto : glist) {%>
				<tr>
					<td>1</td>
					<td><%=groupMemberDto.getM_id()%></td>
          			<td><%=groupMemberDto.getM_name()%></td>
				</tr>
			<%} %>
				<!-- <tr>
					<td>2</td>
					<td>sg6321@naver.com</td>
          			<td>조성국</td>
          			<td>1990-10-18</td>
          			<td>남자</td>
          			<td><i class="glyphicon glyphicon-envelope"></i></td>
				</tr> -->
			</tbody>
		</table>
		</form>
       </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
</div>

<!-- ===================== 그룹원 목록 모달 창 끝 ============================== -->
<script type="text/javascript">
(function(){
    'use strict';
	var $ = jQuery;
	$.fn.extend({
		filterTable: function(){
			return this.each(function(){
				$(this).on('keyup', function(e){
					$('.filterTable_no_results').remove();
					var $this = $(this), 
                        search = $this.val().toLowerCase(), 
                        target = $this.attr('data-filters'), 
                        $target = $(target), 
                        $rows = $target.find('tbody tr');
                        
					if(search == '') {
						$rows.show(); 
					} else {
						$rows.each(function(){
							var $this = $(this);
							$this.text().toLowerCase().indexOf(search) === -1 ? $this.hide() : $this.show();
						})
						if($target.find('tbody tr:visible').size() === 0) {
							var col_count = $target.find('tr').first().find('td').size();
							var no_results = $('<tr class="filterTable_no_results"><td colspan="'+col_count+'">검색 결과가 없습니다.</td></tr>')
							$target.find('tbody').append(no_results);
						}
					}
				});
			});
		}
	});
	$('[data-action="filter"]').filterTable();
})(jQuery);

$(function(){
	$('[data-action="filter"]').filterTable();
	
	$('.container').on('click', '.panel-heading span.filter', function(e){
		var $this = $(this), 
			$panel = $this.parents('.panel');
		
		$panel.find('.panel-body').slideToggle();
		if($this.css('display') != 'none') {
			$panel.find('.panel-body input').focus();
		}
	});
	//$('[data-toggle="tooltip"]').tooltip(); //잘돼다가 지랄
})
</script>

</div>
</div>
<%@include file="/common/footer.jsp" %>   
</body>
</html>

