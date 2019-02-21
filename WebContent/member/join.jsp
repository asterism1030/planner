<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR" import="com.project.member.model.service.MemberServiceImpl"%>
<%@ include file = "/common/public.jsp" %>

<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('${root}/image/signbg2.jpg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>
<%@ include file = "/facebook/facebook.jsp" %>
<script type = "text/javascript">  
function join() {
   if(document.getElementById("name").value == "")
      alert("이름을 입력해 주세요!");
   else if(document.getElementById("youremail").value == "")
      alert("이메일을 입력해주세요!");
   else if(document.getElementById("password").value == "")
      alert("비밀번호를 입력해주세요!");
   else if(document.getElementById("passwordcheck").value == "")
      alert("비밀번호를 확인해주세요!");
   else if(document.getElementById("password").value != document.getElementById("passwordcheck").value)
      alert("비밀번호가 일치하지 않습니다!");
   else
      document.joinform.action = "${root}/user";
}

$(document).ready(function(){
	
	$("#youremail").blur(function(){
		$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "${root}/user",
		    data: { act : "checkEmail", youremail : $("#youremail").val() },
		    success:function(data) {
		    	var result = data.result;
		    	$("#idckresult").append(result);
		    },
		    error: function(e) {
		    	alert("에러!!");
		    }
	    });
	});
	
	$("#youremail").focus(function(){
		
		$("#idckresult").empty();
	});
	
	
	
});  
</script>  
  

   <div class="container wrapper">
      <div class="col-md-1 col-lg-2"></div>
      <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 bg1" style="border-top-left-radius: 20px; border-bottom-right-radius: 20px;">
      <br>
         <legend>
            <i class="glyphicon glyphicon-globe"></i> 회원가입
         </legend>
         
            <form action="" method="post" class="form" role="form" id="joinform" name="joinform">
            <input type="hidden" name="act" value="join">
            <input type="hidden" name="emailChecked" id="emailChecked" value="false">
            
            <!-- 회원가입시 정보 입력단 -->
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <label>이름</label><br>
            </div>
            <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
            <input class="form-control" name="name" id="name" placeholder="이름" type="text" required autofocus>
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">&nbsp;
            </div>
            &nbsp;<br>&nbsp;
            
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <label>이메일</label><br>
            </div>
            <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
            <input class="form-control" name="youremail" id="youremail" placeholder="이메일" type="email"  />  
            <div id="idckresult"></div><br>
            </div>
            
            
            <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
            <label>비밀번호</label>
            <input class="form-control" name="password" id="password" placeholder="비밀번호" type="password" /> <br> 
            <label>비밀번호 확인</label>
            <input class="form-control" name="passwordcheck" id="passwordcheck" placeholder="비밀번호 확인" type="password" /> <br> 
            <label for=""> 생년월일</label>
            <div class="row">
               <div class="col-xs-4 col-md-4">
               <!-- 년 -->
                  <select class="form-control" name="Year">
	                  <c:forEach var="i" begin="1960" end="2017" step="1">
	                     <option value="${i}">${i}</option>
	                  </c:forEach>
                  </select>
               </div>
               <div class="col-xs-4 col-md-4">
               <!-- 월 -->
                  <select class="form-control" name="Month">
	                  <c:forEach var="i" begin="1" end="12" step="1">
	                  	<option value="${i}">${i}</option>
	                  </c:forEach>
                  </select>
               </div>
               <div class="col-xs-4 col-md-4">
               <!-- 일 -->
                  <select class="form-control" name="Day" >
	                  <c:forEach var="i" begin="1" end="31" step="1">
	                  	<option value="${i}">${i}</option>
	                  </c:forEach>
                  </select>
               </div>
            </div>
            <br>
            <label>성별</label>&nbsp;&nbsp;
            <label class="radio-inline">
            <input type="radio" name="gender" id="gender" value="남자" checked="checked">
                             남자
            </label> 
            <label class="radio-inline"> 
            <input type="radio" name="gender" id="gender" value="여자" />
			여자
            </label>
            <br>
            &nbsp;
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6">
	            <button class="btn btn-lg btn-info btn-block" type="submit" onclick="javascript:join()">
	               회원가입</button>
            </div>
         </form>
         	<div class="col-xs-6 col-sm-6 col-md-6">
				<!-- 페이스북 로그인. 직접적으로 함수 호출 -->
				<button onclick="javascript:facebooklogin()" class="btn btn-lg btn-primary btn-block">Facebook</a>
			</div>
         <br>
      </div>
      <div class="col-md-1 col-lg-2"></div>
   </div>


<%@ include file = "/common/footer.jsp" %>

</body>
</html>