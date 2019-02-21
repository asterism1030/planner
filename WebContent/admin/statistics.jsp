<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Date,java.text.SimpleDateFormat"%>
<%@ include file="/common/public.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="statisticsRoot" value="${pageContext.request.contextPath}"></c:set>

<%
String time = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
int year = Integer.parseInt((new SimpleDateFormat("yyyy")).format(new Date()));
%>

<!-- 그래프 -->
<link class="include" rel="stylesheet" type="text/css" href="${statisticsRoot}/css/jqplot/jquery.jqplot.min.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${statisticsRoot}/css/jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="${statisticsRoot}/css/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"></script>

<script type="text/javascript" src="${statisticsRoot}/css/jqplot/plugins/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript" src="${statisticsRoot}/css/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="${statisticsRoot}/css/jqplot/plugins/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="${statisticsRoot}/css/jqplot/plugins/jqplot.pointLabels.js"></script>

<!-- 테마 -->
<link href="${statisticsRoot}/css/pink_blue_theme/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="${statisticsRoot}/css/pink_blue_theme/jquery-ui.js"></script>
<script>


var allMembers = 0;
var avgPlans = 0;
var avgFriends = 0;
var avgAge = 0;

var allMen = 0;
var allWomen = 0;

var teens = 0;
var twelves = 0;
var thirties = 0;
var forties = 0;

var facebook = 0;
var google = 0;
var general = 0;
//////////////// 
var avgPeriod = 0;
var allPlanner = 0;

var m_period = []; //남자 기간별
var w_period = []; //여자 기간별

var jan = 0; //월별
var feb = 0;
var mar = 0;
var apr = 0;
var may = 0;
var jun = 0;
var jul = 0;
var aug = 0;
var sep = 0;
var oct = 0;
var nov = 0;
var dec = 0;

var eachYear = []; //년별

$(function(){
	  $("#tabs").tabs();
	  $("#searchBtn").button();
	  $("#selectmenu").selectmenu();
	  $("#control").controlgroup();
	  
	  $(".radioset").buttonset();
	  $("#controlgroup").controlgroup();
		
		$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "${statisticsRoot}/adminstatics",
		    data: { act : "memberData"},
		    success:function(data) {
		    	allMembers = data.allMembers;
		    	avgPlans = data.avgPlans;
		    	avgFriends = data.avgFriends;
		    	avgAge = data.avgAge;
		    	
		    	$("#allMembers").val(allMembers);
		    	$("#avgPlans").val(avgPlans);
		    	$("#avgFriends").val(avgFriends);
		    	$("#avgAge").val("만 "+avgAge);
		    	
		    	allMen = data.allMen;
		    	allWomen = data.allWomen;

		    	teens = data.teens;
		    	twelves = data.twelves;
		    	thirties = data.thirties;
		    	forties = data.forties;

		    	facebook = data.facebook;
		    	google = data.google;
		    	general = data.general;

		    },
		    error: function(e) {
		    	alert("member data 가져오기 실패");
		    }
	    });
		
		
		$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "${statisticsRoot}/adminstatics",
		    data: { act : "plannerData" },
		    success:function(data) {
		    	avgPeriod = data.avgPeriod;
		    	$("#avgPeriod").val(avgPeriod);
		    	allPlanner = data.allPlanner;
		    	$("#allPlans").val(allPlanner);
		    	
		    	for(var i = 0; i < 6; i++)
		    		m_period[i] = data.m_period[i];
		    	
		    	for(var i = 0; i < 6; i++)
		    		w_period[i] = data.w_period[i];

		    	jan = data.jan;
		    	feb = data.feb;
		    	mar = data.mar;
		    	apr = data.apr;
		    	may = data.may;
		    	jun = data.jun;
		    	jul = data.jul;
		    	aug = data.aug;
		    	sep = data.sep;
		    	oct = data.oct;
		    	nov = data.nov;
		    	dec = data.dec;
		    	
		    	for(var i = 0; i < 10; i++)
		    		eachYear[i] = data.years[i];
		    	
		    },
		    error: function(e) {
		    	alert("member data 가져오기 실패");
		    }
	    });
});	

function member() {
	$("#graph1").empty();
	$("#graph2").empty();
	
}

function planner() {
	$("#graph1").empty();
	$("#graph2").empty();
	
}


function age(){
	$("#graph1").empty();
	$("#graph2").empty();
	
	$.jqplot ('graph1', [[['10대', teens], ['20대', twelves], ['30대', thirties], ['40대', forties]]], 
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //원형
	            rendererOptions: { //원형상단에 값
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //우측 색상별 타이틀 출력
	        }
	);
}

function gender() {
	$("#graph1").empty();
	$("#graph2").empty();
	
	$.jqplot ('graph1', [[['남자', allMen], ['여자', allWomen]]], 
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //원형
	            rendererOptions: { //원형상단에 값
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //우측 색상별 타이틀 출력
	        }
	);
}

function join() {
	$("#graph1").empty();
	$("#graph2").empty();
	$.jqplot ('graph1', [[['general', general], ['facebook', facebook], ['google', google]]], 
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //원형
	            rendererOptions: { //원형상단에 값
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //우측 색상별 타이틀 출력
	        }
	);
}

function plans() {
	$("#graph1").empty();
	$("#graph2").empty();
	$.jqplot ('graph1', [[['general', 50], ['facebook', 22], ['google', 10]]], 
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //원형
	            rendererOptions: { //원형상단에 값
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //우측 색상별 타이틀 출력
	        }
	);
}

function friends() {
	$("#graph1").empty();
	$("#graph2").empty();
}

function period() {
	$("#graph1").empty();
	$("#graph2").empty();
	
	var s1 = [m_period[0], m_period[1], m_period[2], m_period[3], m_period[4], m_period[5]];
	var s2 = [w_period[0], w_period[1], w_period[2], w_period[3], w_period[4], w_period[5]];
    var ticks = ['1~3일', '3~7일', '1~2주', '2주~3주', '3주~한달', '한달 이상'];
     
    plot2 = $.jqplot('graph1', [s1, s2], {
    	title: '<%=year%> 남녀 기간별 플래너 수',
        seriesDefaults: {
            renderer:$.jqplot.BarRenderer,
            pointLabels: { show: true }
        },
        axes: {
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                ticks: ticks
            }
        }
    });
 
	
	$.jqplot ('graph2', [[['1~3일', m_period[0]+w_period[0]], ['3~7일', m_period[1]+w_period[1]], ['1~2주', m_period[2]+w_period[2]], ['2주~3주', m_period[3]+w_period[3]], 
	                      ['3주~한달', m_period[4]+w_period[4]], ['한달 이상', m_period[5]+w_period[5]]]],
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //원형
	            rendererOptions: { //원형상단에 값
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //우측 색상별 타이틀 출력
	        }
	);
}

function month() {
	$("#graph1").empty();
	$("#graph2").empty();
	$.jqplot('graph1', [[['1월', jan], ['2월', feb], ['3월', mar], ['4월', apr],
	                     ['5월', may], ['6월', jun], ['7월', jul], ['8월', aug],
	                     ['9월', sep], ['10월', oct], ['11월', nov], ['12월', dec]]], {
	      title: '<%=year%> 월별 플래너 수(출발일 기준)',
	      series:[{renderer:$.jqplot.BarRenderer}],
	      axes: {
	        xaxis: {
	          renderer: $.jqplot.CategoryAxisRenderer,
	          label: "월"
	        },
	        yaxis: {
	          label: "일수"
	        }
	      }
	    });
	
	$.jqplot ('graph2', [[['1월', jan], ['2월', feb], ['3월', mar], ['4월', apr],
		                ['5월', may], ['6월', jun], ['7월', jul], ['8월', aug],
		                ['9월', sep], ['10월', oct], ['11월', nov], ['12월', dec]]],
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //원형
	            rendererOptions: { //원형상단에 값
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //우측 색상별 타이틀 출력
	        }
	);
}

function years() {
	$("#graph1").empty();
	$("#graph2").empty();
	var thisYear = <%=year%>;
	var data = [eachYear[0], eachYear[1], eachYear[2], eachYear[3], eachYear[4],
	            eachYear[5], eachYear[6], eachYear[7], eachYear[8], eachYear[9]];
	
	$.jqplot('graph1', [[[thisYear-9, eachYear[0]], [thisYear-8, eachYear[1]], [thisYear-7, eachYear[2]], [thisYear-6, eachYear[3]],
	          	         [thisYear-5, eachYear[4]], [thisYear-4, eachYear[5]], [thisYear-3, eachYear[6]], [thisYear-2, eachYear[7]],
	        	         [thisYear-1, eachYear[8]], [thisYear, eachYear[9]]]], {
	      title: '년별 플래너 수 추이', 
	      seriesDefaults: {
	        showMarker:false,
	        pointLabels: {
	          show: true,
	          edgeTolerance: 5
	        }},
	      axes:{
	      }
	  });
}

	
</script>
</head>
<body>
<center>
    <h2>통계</h2>
    
    <div id="tabs">
       <ul>
			<li><a href="#tag-1" onclick="javascript:member()">회원</a></li>
			<li><a href="#tag-2" onclick="javascript:planner()">플래너</a></li>
		</ul>
		<h5><%=time%> 기준</h5>
		
<!-- ----------------------------------------------------------------------------------- -->			
		<div id="tag-1">
			<div class="radioset">
				<input type="radio" id="s_age" name="s_radio" onclick="javascript:age()"><label for="s_age">연령대</label>
				<input type="radio" id="s_gender" name="s_radio" onclick="javascript:gender()"><label for="s_gender">성별</label>
				<input type="radio" id="s_join" name="s_radio" onclick="javascript:join()"><label for="s_join">가입방식</label>
				<!-- 
				<input type="radio" id="s_plans" name="s_radio" onclick="javascript:plans()"><label for="s_plans">보유 플래너</label>
				<input type="radio" id="s_friend" name="s_radio" onclick="javascript:friends()"><label for="s_friend">친구</label>
				-->
			</div><br>
			총 멤버 수 : &nbsp;<input type="text" id= "allMembers" value="" style="width:50px; border-width:0" readonly>&nbsp;
			일인당 평균 플래너 수 : &nbsp;<input type="text" id= "avgPlans" value="" style="width:50px; border-width:0" readonly>&nbsp;
			일인당 평균 친구 수 : &nbsp;<input type="text" id= "avgFriends" value="" style="width:50px; border-width:0" readonly>&nbsp;
			평균 연령 : &nbsp;<input type="text" id= "avgAge" value="" style="width:50px; border-width:0" readonly><br>
			
		</div>

<!-- ----------------------------------------------------------------------------------- -->		
		<div id="tag-2">
			<div class="radioset">
				<input type="radio" id="s_period" name="s_radio" onclick="javascript:period()"><label for="s_period">기간</label>
				<input type="radio" id="s_month" name="s_radio" onclick="javascript:month()"><label for="s_month">월별</label>
				<input type="radio" id="s_year" name="s_radio" onclick="javascript:years()"><label for="s_year">년별</label>
			</div><br>
			총 플래너 수 : &nbsp;<input type="text" id= "allPlans" value="" style="width:50px; border-width:0" readonly>&nbsp;
			평균 여행 기간 : &nbsp;<input type="text" id= "avgPeriod" value="" style="width:50px; border-width:0" readonly>(일)&nbsp;
		</div>
<!-- ----------------------------------------------------------------------------- -->		
		<div id="graph1" style="width:60%;"></div> <br><br>
		<div id="graph2" style="width:60%;"></div>

</div>	

</center>
</body>
</html>