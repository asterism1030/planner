<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.project.util.*"%>
<%@ include file = "/common/public.jsp" %>
<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('${root}/image/loginbg.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>

<script type = "text/javascript">
function modifyMem(){
	
	if( "${userInfo.m_pass}" == document.getElementById("password").value){
		if(confirm("������ �����Ͻðڽ��ϱ�?")) {
			document.getElementById("birthY").value = document.getElementById("Year").value;
			document.getElementById("birthM").value = document.getElementById("Month").value;
			document.getElementById("birthD").value = document.getElementById("Day").value;
			if(document.getElementById("genderM").checked) {
				document.getElementById("gender").value = document.getElementById("genderM").value;
			} else {
				document.getElementById("gender").value = document.getElementById("genderF").value;
			}
			document.modify.action="${root}/user?act=modify";
			document.modify.submit();
		} else {
			
		}
	
	} else {
		alert("��й�ȣ�� Ȯ�����ּ���.");
	}
}

function changePassword() {
		if(document.getElementById("modipass").value != "") {
			if(document.getElementById("modipass").value == document.getElementById("modipasscheck").value){
				if(confirm("��й�ȣ�� �����Ͻðڽ��ϱ�?")) {
					document.getElementById("changepass").value = document.getElementById("modipass").value;
					document.passchg.action = "${root}/user";
					document.passchg.submit();
					alert("��й�ȣ�� ����Ǿ����ϴ�.");
				} else {
				}
			} else {
				alert("������ ��й�ȣ�� �ٸ��ϴ�.");
			}
		} else {
			alert("������ ��й�ȣ�� �Է����ּ���.");
		}
}

function showModal() {
	if( "${userInfo.m_pass}" == document.getElementById("password").value){
		document.getElementById("password").value = "";
		$('#myModal').modal('show');
	} else {
		document.getElementById("password").value = "";
		alert("��й�ȣ�� Ȯ�����ּ���.");
	}
}

</script> 

<form id="modify" name="modify" method="post" action="">
<input type="hidden" name="act" value="modify">
<!-- <input type="hidden" name="m_id" value="${userInfo.m_id}"> -->
<input type="hidden" name="birthY" id="birthY" value="">
<input type="hidden" name="birthM" id="birthM" value="">
<input type="hidden" name="birthD" id="birthD" value="">
<input type="hidden" name="gender" id="gender" value="">
</form>

<form id="passchg" name="passchg" method="post" action="">
<input type="hidden" name="act" value="passchg">
<input type="hidden" name="changepass" id="changepass" value="">
</form>

 
<div class="container wrapper">
	<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 
	col-md-offset-1 col-lg-offset-1 bg1" style="border-top-left-radius: 20px; border-bottom-right-radius: 20px;">
	
	 
	
	
	
	<h3>&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-user"></i>����������</h3>
	<div class="row" style="border-color: gray; border-style: solid;"></div>
	<br>
	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-1
    col-xs-offset-10 col-sm-offset-10 col-md-offset-10 col-lg-offset-11">
    	<button class="btn btn-xs btn-danger btn-block" type="submit" onclick="javascript:leave()">Ż��</button>
    </div>
    
    <!-- ���̵�  ǥ�� -->
	<div class="form-group">
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center"><label style="font-size: large;">���̵�</label></div>
        <div class="input-group col-md-9">
            <label style="font-size: large;">${userInfo.m_id}</label>
        </div>
   	</div>
	
	<!-- �̸� ǥ�� -->
	<div class="form-group">
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center"><label style="font-size: large;">�̸�</label></div>
        <div class="input-group col-md-9">
            <label style="font-size: large;">${userInfo.m_name}</label>
        </div>
   	</div>

	<%
	    if(!memberDto.getM_id().substring(0, 3).equals("fb_")){
	%>

	<div class="form-group">
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center" style="height: 34px; padding-top: 4px;"><label style="font-size: large;">��й�ȣ</label></div>
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
            <input type="password" class="form-control" name="password" id="password" placeholder="��й�ȣ" required data-toggle="popover" title="Password Strength" data-content="Enter Password...">
        </div>
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" style="height: 34px; padding-top: 10px;">
        <a href="javascript:showModal();">��й�ȣ ����</a>
        </div>
   	</div>
   	<br>&nbsp;

	<div class="form-group">
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center"><label style="font-size: large;">�������</label></div>
           <div class="input-group col-xs-9 col-sm-9 col-md-9 col-lg-9">
               <div class="col-xs-4 col-md-4" align="left">
	               <select class="form-control" id="Year" name="Year">
	               	  <%for(int i=1960; i<2017; i++) {%>
	                  	<option value="<%= i %>"
	                  	<%
	                  	if(memberDto.getM_birth().substring(0, 4).equals(Integer.toString(i))) {
	                  	%>
	                  	selected="selected"
	                  	<%
	                  	}
	                  	%>
	                  	><%= i %></option>
	                  <%} %>
	               </select>
            	</div>
            	<div class="col-xs-4 col-md-4">
	                <select class="form-control" id="Month" name="Month">
	                   <%for(int i=1; i<13; i++) {
	                	   String m;
		                   if(i<10) {
		                   		 m = "0"+i;
		                   } else {
		                	   m = Integer.toString(i);
		                   }
	                   %>
	                   	 <option value="<%= m %>"
	                   	 <%
	                  	if(memberDto.getM_birth().substring(5, 7).equals(m)) {
	                  	%>
	                  	selected="selected"
	                  	<%
	                  	}
	                  	%>
	                   	 ><%= m %></option>
	                   <%} %>
	                </select>
            	</div>
            	 <div class="col-xs-4 col-md-4">
                	<select class="form-control" id="Day" name="Day" >
                		<%for(int i=1; i<32; i++) {
                			String m;
 		                   	if(i<10) {
 		                   		 m = "0"+i;
 		                   	} else {
 		                		 m = Integer.toString(i);
 		                  	}
                		%>
                   	<option value="<%= m %>"
                   		<%
	                  	if(memberDto.getM_birth().substring(8, 10).equals(m)) {
	                  	%>
	                  		selected="selected"
	                  	<%
	                  	}
	                %>
                   	><%= m %></option>
                  		<% } %>
                	</select>
           		 </div>
          </div>
     </div>
    
         	
	<div class="form-group">
       <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center"><label style="font-size: large;">����</label></div>
       <%
    	String gender = memberDto.getM_gender();
    	if(gender.equals("����")) {
    	%>
       <div class="input-group col-md-9" align="left">
          <label class="radio-inline" style="font-size: large;">
          <input type="radio" name="genderS" id="genderM" value="����" checked="checked">
             ����
          </label> 
          <label class="radio-inline" style="font-size: large;"> 
          <input type="radio" name="genderS" id="genderF" value="����"/>
             ����
          </label>
        </div>
        <%
    	} else if(gender.equals("����")) {
        %>
        <div class="input-group col-md-9" align="left">
          <label class="radio-inline" style="font-size: large;">
          <input type="radio" name="gender" id="genderM" value="����" >
             ����
          </label> 
          <label class="radio-inline" style="font-size: large;"> 
          <input type="radio" name="gender" id="genderF" value="����" checked="checked"/>
             ����
          </label>
        </div>
        <%
    	}
        %>
    </div>
    
    	<div class="col-xs-3 col-sm-3 col-md-2 col-lg-2
    	col-xs-offset-9 col-sm-offset-9 col-md-offset-10 col-lg-offset-10">
    		<button class="btn btn-md btn-primary btn-block" type="submit" onclick="javascript:modifyMem()">����</button>
    	</div>
    <%
		} else {
    %>
    <br>
    <div align="center">
    <h3><font color="blue">���̽���</font>���� �α����� ȸ���Դϴ�.</h3>
    </div>
    <%
		}
    %>
    <br>&nbsp;
    <br>
	</div>
</div>


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><i class="glyphicon glyphicon-list"></i> ��й�ȣ ����</h4>
      </div>
      <div class="modal-body">
       	<!-- <form id="selectDate" name="selectDate" method="get" action="">
       	<input type="hidden" name="act" value="dayplan">
       	<input type="hidden" name="p_id" value="">
        <select class="form-control" name="date">
		<option value="1">1</option>
		</select>
		</form> -->
		<div class="input-group">
		<label class="input-group-addon">������ ��й�ȣ</label>
		<input type="password" id="modipass" class="form-control">
		</div>
		<br>
		<div class="input-group">
		<label class="input-group-addon">&nbsp;��й�ȣ Ȯ��&nbsp;&nbsp;</label>
		<input type="password" id="modipasscheck" class="form-control">
		</div>
      </div>
      <div class="modal-footer">
      <a href="javascript:changePassword();">����</a>
      </div>
    </div>

  </div>
</div>
<!-- Modal -->	

<%@ include file = "/common/footer.jsp" %>

</body>
</html>