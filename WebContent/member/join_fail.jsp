<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   
   
<%@include file="/common/public.jsp" %>
<script type = "text/javascript">
function gojoin(){
	   document.gologinform.action="${root}/user?act=mvjoin";
}

</script>  


<center>
<div> <br>
<h2>���� �̸����� �����մϴ�.</h2><br>
<b>�ٽ� �õ��� �ּ���.</b><br>
&nbsp;<br>
</div>
<div class="col-xs-2 col-sm-3 col-md-3 col-lg-3"></div>
<div class="col-xs-8 col-sm-6 col-md-6 col-lg-6">

<form name="gologinform" method="post" action="">
<input type="hidden" name="act" value="mvlogin">
<button class="btn btn-lg btn-primary btn-block" onclick="javascript:gojoin();">ȸ�������ϱ�</button>
</form>

</div>
<div class="col-xs-2 col-sm-3 col-md-3 col-lg-3"></div>
<br>
<br>
</center>



<%@ include file="/common/footer.jsp" %>

</body>
</html>