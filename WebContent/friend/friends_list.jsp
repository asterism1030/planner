<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/common/public.jsp" %>
<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('${root}/image/friendbg.jpeg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>
<script type = "text/javascript">
var list;
var check;

$(document).ready(function(){
	
	getFriendList();
	
	$("#add").click(function(){
		
		if(document.getElementById("toid").value == "") {
			 alert("�̸���(���̵�)�� �Է����ּ���!");
			 return;
		 }
		
		if(document.getElementById("content").value == "") {
			 document.getElementById("content").value = "ģ������ ��Ź�帳�ϴ�";
		 }
		
		if(check == 0){
			 alert("�̸���(���̵�)�� �ٽ� �ѹ� Ȯ���ϼ���!");
			 return;
		 }
		
		document.requestForm.action = "${root}/friend";
		document.requestForm.submit();
	});
	
	$("#toid").focus(function(){
		
		$("#idckresult").empty();
	});
	
	$("#toid").blur(function(){
		
		$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "${root}/friend",
		    data: { act : "friendidcheck", toid : $("#toid").val() },
		    success:function(data) {
		    	var result = data.result[0].result;
		    	check = data.result[0].check;
		    	$("#idckresult").append(result);
		    	
		    },
		    error: function(e) {
		    	alert("����!!");
		    }
	    });
	});
	
});

function getFriendList(){
	
	$.ajax({
	    type: "GET",
	    dataType: 'json',
	    url: "${root}/friend",
	    data: { act : "friendlist", id : "${userInfo.m_id}"},
	    success:function(data) {
	    	//alert("����!!! : " + data.mlist[0].name);
	    	friendList(data);
	    },
	    error: function(e) {
	    	alert("����!!");
	    }
    });
	
}

function friendList(data){
	
	var len = data.friendList.length;
	list = document.getElementById("contact-list");
	
	clearList();
	
	for(var i = 0 ; i < len; i++){
		
		var fl_id = data.friendList[i].fl_id;
		var f_name = data.friendList[i].f_name;
		var f_id = data.friendList[i].f_id;
		
		var li = createLi(fl_id, f_name, f_id);
		
		list.appendChild(li);
	}
	
}

function createLi(fl_id, f_name, f_id){
	
	var li = document.createElement("Li");
	li.setAttribute("class", "list-group-item");
	li.setAttribute("id", "li"+fl_id);
	
	var div_row = document.createElement("div");
	div_row.setAttribute("class", "row");
	li.appendChild(div_row);
	
	var div1 = document.createElement("div");
	div1.setAttribute("class", "col-xs-4 col-sm-3 col-md-3 col-lg-3");
	var img = document.createElement("img");
	img.setAttribute("src", "${root}/image/profile.PNG");
	img.setAttribute("alt", "Scott Stevens");
	img.setAttribute("class", "img-responsive img-circle");
	div1.appendChild(img);
	div_row.appendChild(div1);
	
	var div2 = document.createElement("div");
	div2.setAttribute("class", "col-xs-8 col-sm-9 col-md-9 col-lg-9");
	
	var div2_1 = document.createElement("div");
	
	var div2_1_1 = document.createElement("div");
	div2_1_1.setAttribute("class", "mic-info");
	
	var nameText = document.createTextNode("�̸� : ");
	var f_name1 = document.createTextNode(f_name);
	
	div2_1_1.appendChild(nameText);
	div2_1_1.appendChild(f_name1);
	div2_1_1.appendChild(document.createElement("p"));
	
	var idText = document.createTextNode("���̵� : ");
	var f_id1 = document.createTextNode(f_id);
	
	div2_1_1.appendChild(idText);
	div2_1_1.appendChild(f_id1);
	div2_1_1.appendChild(document.createElement("p"));
	
	
	var a = document.createElement("a");
	a.setAttribute("href", "");
	var plannerText = document.createTextNode(f_name+"���� �÷���");
	//a.appendChild(plannerText);
	div2_1_1.appendChild(a);
	
	div2_1.appendChild(div2_1_1);
	div2.appendChild(div2_1);
	div_row.appendChild(div2);
	
	var div3 = document.createElement("div");
	var div3 = document.createElement("div");
	var a_div3 = document.createElement("a");
	
	a_div3.setAttribute("href", "javascript:deleteFriend('"+f_id+"');");
	a_div3.setAttribute("class", "btn btn-sm btn-hover btn-danger  col-xs-3 col-sm-3 col-md-3 col-lg-3 col-xs-offset-9 col-sm-offset-9 col-md-offset-9 col-lg-offset-9");
	
	var span_div3 = document.createElement("div");
	span_div3.setAttribute("class", "glyphicon glyphicon-share-alt");
	span_div3.setAttribute("style","padding-right:3px");

	var deleteFriend = document.createTextNode("ģ�� ����");
	a_div3.appendChild(span_div3);
	a_div3.appendChild(deleteFriend);
	
	div3.appendChild(a_div3);
	div_row.appendChild(div3);
	
	return li;
	
}


function clearList() {
	var len = list.childNodes.length;
	for(var i=len-1;i>=0;i--) {
		list.removeChild(list.childNodes[i]);
	}
}

function deleteFriend(f_id){
	
	if (confirm("���� �����Ͻðڽ��ϱ�??") == true){    //Ȯ��
		$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "${root}/friend",
		    data: { act : "deleteFriend", f_id : f_id },
		    success:function(data) {
		    	//alert("����!!! : " + data.mlist[0].name);
		    	friendList(data);
		    },
		    error: function(e) {
		    	alert("����!!");
		    }
	    });
	}
}


</script>


<div class="container wrapper">
    <div class="row">
        <div class="col-xs-12 col-sm-offset-3 col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                    <span class="title">ģ�����</span>
                    <ul class="pull-right c-controls">
                        <li>
                        <a href="" class="hide-search" data-command="toggle-search" data-toggle="modal" data-target="#addFriend" data-placement="top" ><i class="glyphicon glyphicon-plus">ģ���߰�</i></a></li>
                    </ul>
                </div>
                
                <ul class="list-group" id="contact-list">
                <!--  ģ����� ���� �ڸ� -->
                </ul>
            </div>
        </div>
	</div>
</div>

<div id="addFriend" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">ģ�� �߰�</h4>
      </div>
      
      
      <div class="modal-body">
       	
       	<form id="requestForm" name="requestForm" method="post" action="">
       	<input type="hidden" name="act" value="addFriend">
		<input type="hidden" name="m_id" value="${userInfo.m_id}">
		<input type="hidden" name="m_name" value="${userInfo.m_name}">
		
	        <div><label>�޴� ��� ���̵�</label></div>
	        <div><input type ="text" class = "form-control" name="toid" id="toid" placeholder="�̸���(���̵�)"></div>
	        <div id="idckresult"></div><br>
	        <br>
	        <div><label>����</label></div>
	        <div><input type = "textarea" class= "form-control" name="content" id ="content" placeholder="ģ������ ��Ź�帳�ϴ�"></div>
		</form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="add">ģ����û ������</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" id="cancel">���</button>
      </div>
      
    </div>

  </div>
</div>


<%@include file="/common/footer.jsp" %>
</body>
</html>