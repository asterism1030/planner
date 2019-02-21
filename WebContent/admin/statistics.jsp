<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Date,java.text.SimpleDateFormat"%>
<%@ include file="/common/public.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="statisticsRoot" value="${pageContext.request.contextPath}"></c:set>

<%
String time = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
int year = Integer.parseInt((new SimpleDateFormat("yyyy")).format(new Date()));
%>

<!-- �׷��� -->
<link class="include" rel="stylesheet" type="text/css" href="${statisticsRoot}/css/jqplot/jquery.jqplot.min.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${statisticsRoot}/css/jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="${statisticsRoot}/css/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"></script>

<script type="text/javascript" src="${statisticsRoot}/css/jqplot/plugins/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript" src="${statisticsRoot}/css/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="${statisticsRoot}/css/jqplot/plugins/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="${statisticsRoot}/css/jqplot/plugins/jqplot.pointLabels.js"></script>

<!-- �׸� -->
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

var m_period = []; //���� �Ⱓ��
var w_period = []; //���� �Ⱓ��

var jan = 0; //����
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

var eachYear = []; //�⺰

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
		    	$("#avgAge").val("�� "+avgAge);
		    	
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
		    	alert("member data �������� ����");
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
		    	alert("member data �������� ����");
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
	
	$.jqplot ('graph1', [[['10��', teens], ['20��', twelves], ['30��', thirties], ['40��', forties]]], 
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //����
	            rendererOptions: { //������ܿ� ��
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //���� ���� Ÿ��Ʋ ���
	        }
	);
}

function gender() {
	$("#graph1").empty();
	$("#graph2").empty();
	
	$.jqplot ('graph1', [[['����', allMen], ['����', allWomen]]], 
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //����
	            rendererOptions: { //������ܿ� ��
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //���� ���� Ÿ��Ʋ ���
	        }
	);
}

function join() {
	$("#graph1").empty();
	$("#graph2").empty();
	$.jqplot ('graph1', [[['general', general], ['facebook', facebook], ['google', google]]], 
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //����
	            rendererOptions: { //������ܿ� ��
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //���� ���� Ÿ��Ʋ ���
	        }
	);
}

function plans() {
	$("#graph1").empty();
	$("#graph2").empty();
	$.jqplot ('graph1', [[['general', 50], ['facebook', 22], ['google', 10]]], 
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //����
	            rendererOptions: { //������ܿ� ��
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //���� ���� Ÿ��Ʋ ���
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
    var ticks = ['1~3��', '3~7��', '1~2��', '2��~3��', '3��~�Ѵ�', '�Ѵ� �̻�'];
     
    plot2 = $.jqplot('graph1', [s1, s2], {
    	title: '<%=year%> ���� �Ⱓ�� �÷��� ��',
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
 
	
	$.jqplot ('graph2', [[['1~3��', m_period[0]+w_period[0]], ['3~7��', m_period[1]+w_period[1]], ['1~2��', m_period[2]+w_period[2]], ['2��~3��', m_period[3]+w_period[3]], 
	                      ['3��~�Ѵ�', m_period[4]+w_period[4]], ['�Ѵ� �̻�', m_period[5]+w_period[5]]]],
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //����
	            rendererOptions: { //������ܿ� ��
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //���� ���� Ÿ��Ʋ ���
	        }
	);
}

function month() {
	$("#graph1").empty();
	$("#graph2").empty();
	$.jqplot('graph1', [[['1��', jan], ['2��', feb], ['3��', mar], ['4��', apr],
	                     ['5��', may], ['6��', jun], ['7��', jul], ['8��', aug],
	                     ['9��', sep], ['10��', oct], ['11��', nov], ['12��', dec]]], {
	      title: '<%=year%> ���� �÷��� ��(����� ����)',
	      series:[{renderer:$.jqplot.BarRenderer}],
	      axes: {
	        xaxis: {
	          renderer: $.jqplot.CategoryAxisRenderer,
	          label: "��"
	        },
	        yaxis: {
	          label: "�ϼ�"
	        }
	      }
	    });
	
	$.jqplot ('graph2', [[['1��', jan], ['2��', feb], ['3��', mar], ['4��', apr],
		                ['5��', may], ['6��', jun], ['7��', jul], ['8��', aug],
		                ['9��', sep], ['10��', oct], ['11��', nov], ['12��', dec]]],
	        { 
	          seriesDefaults: { 
	            renderer: $.jqplot.PieRenderer, //����
	            rendererOptions: { //������ܿ� ��
	              showDataLabels: true }
	          },
	          legend: { show:true, location: 'e' } //���� ���� Ÿ��Ʋ ���
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
	      title: '�⺰ �÷��� �� ����', 
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
    <h2>���</h2>
    
    <div id="tabs">
       <ul>
			<li><a href="#tag-1" onclick="javascript:member()">ȸ��</a></li>
			<li><a href="#tag-2" onclick="javascript:planner()">�÷���</a></li>
		</ul>
		<h5><%=time%> ����</h5>
		
<!-- ----------------------------------------------------------------------------------- -->			
		<div id="tag-1">
			<div class="radioset">
				<input type="radio" id="s_age" name="s_radio" onclick="javascript:age()"><label for="s_age">���ɴ�</label>
				<input type="radio" id="s_gender" name="s_radio" onclick="javascript:gender()"><label for="s_gender">����</label>
				<input type="radio" id="s_join" name="s_radio" onclick="javascript:join()"><label for="s_join">���Թ��</label>
				<!-- 
				<input type="radio" id="s_plans" name="s_radio" onclick="javascript:plans()"><label for="s_plans">���� �÷���</label>
				<input type="radio" id="s_friend" name="s_radio" onclick="javascript:friends()"><label for="s_friend">ģ��</label>
				-->
			</div><br>
			�� ��� �� : &nbsp;<input type="text" id= "allMembers" value="" style="width:50px; border-width:0" readonly>&nbsp;
			���δ� ��� �÷��� �� : &nbsp;<input type="text" id= "avgPlans" value="" style="width:50px; border-width:0" readonly>&nbsp;
			���δ� ��� ģ�� �� : &nbsp;<input type="text" id= "avgFriends" value="" style="width:50px; border-width:0" readonly>&nbsp;
			��� ���� : &nbsp;<input type="text" id= "avgAge" value="" style="width:50px; border-width:0" readonly><br>
			
		</div>

<!-- ----------------------------------------------------------------------------------- -->		
		<div id="tag-2">
			<div class="radioset">
				<input type="radio" id="s_period" name="s_radio" onclick="javascript:period()"><label for="s_period">�Ⱓ</label>
				<input type="radio" id="s_month" name="s_radio" onclick="javascript:month()"><label for="s_month">����</label>
				<input type="radio" id="s_year" name="s_radio" onclick="javascript:years()"><label for="s_year">�⺰</label>
			</div><br>
			�� �÷��� �� : &nbsp;<input type="text" id= "allPlans" value="" style="width:50px; border-width:0" readonly>&nbsp;
			��� ���� �Ⱓ : &nbsp;<input type="text" id= "avgPeriod" value="" style="width:50px; border-width:0" readonly>(��)&nbsp;
		</div>
<!-- ----------------------------------------------------------------------------- -->		
		<div id="graph1" style="width:60%;"></div> <br><br>
		<div id="graph2" style="width:60%;"></div>

</div>	

</center>
</body>
</html>