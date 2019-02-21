<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "/common/public.jsp" %>
<style type="text/css">
body {
    background: url('${root}/image/loginbg.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>

<script type="text/javascript">
function checkInfo() {
	$("#sendButton").empty();
	document.getElementById("sendButton").innerHTML = "처리 중입니다...";
	
	var birthday = document.getElementById("findYear").value + "-" + document.getElementById("findMonth").value + "-" + document.getElementById("findDay").value;
	$.ajax({
	    type: "GET",
	    dataType: 'json',
	    url: "${root}/user",
	    data: { act : "checkmember", id : $("#findEmail").val(), name : $("#findname").val(), birth : birthday},
	    success:function(data) {
	    	if(data.isSuccess == "0") {
	    		document.getElementById("message").innerHTML = "해당 아이디가 없습니다";
	    		$("#sendButton").empty();
	    		document.getElementById("sendButton").innerHTML = "인증 메일 전송";
	    	}
	    	else if(data.isSuccess == "1")
	    		mvPage();
	    },
	    error: function(e) {
	    	alert("email 실패!");
	    }
    });
}

function mvPage() {
	document.location.href = "${root}/user?act=modifyPassOk";
}

</script>

<body>
	<br><br><br><br>
	<div class="container">
		<div class="col-md-1 col-lg-2"></div>
		<div class="col-sm-12 col-md-10 col-lg-8 bg1">
			<div class="main">
				<h3>
					비밀번호 찾기
				</h3><br>

				<form name="loginform" role="form" method="post" action="">
				<input type="hidden" name="act" value="login">
					<div class="form-group">
					
						<div id="message" align="right"></div>
						
						<label for="findEmail">아이디(이메일)</label> 
						<input type="text" class="form-control" id="findEmail" name="findEmail" value="">
						<label for="findname">이름</label> 
						<input type="text" class="form-control" id="findname" name="findname" value="">
						<label for=""> 생년월일</label>
			            <div class="row">
			               <div class="col-xs-4 col-md-4">
			                  <select class="form-control" id="findYear" name="findYear">
			                  	<c:forEach var="i" begin="1960" end="2017" step="1">
			                  		<option value="${i}">${i}</option>
			                  	</c:forEach>
			                  </select>
			               </div>
			               <div class="col-xs-4 col-md-4">
			                  <select class="form-control" id="findMonth" name="findMonth">
			                  	<c:forEach var="i" begin="1" end="12" step="1">
			                  		<option value="${i}">${i}</option>
			                  	</c:forEach>
			                  </select>
			               </div>
			               <div class="col-xs-4 col-md-4">
			                  <select class="form-control" id="findDay" name="findDay" >
			                  	<c:forEach var="i" begin="1" end="31" step="1">
			                  		<option value="${i}">${i}</option>
			                  	</c:forEach>
			                  </select>
			               </div>
			            </div>
					</div>

					<button type="button" class="btn btn-lg btn-info btn-block" onclick="javascript:checkInfo();"><div id="sendButton">인증 메일 전송</div></button>
				</form> <br>
				
			</div>
	</div>

</body>
</html>