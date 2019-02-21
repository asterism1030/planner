<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file = "/common/public.jsp" %>
<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
    background: url('${root}/image/invitebg.jpg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  	/*background-color:#333;*/
  	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
}
</style>

<div class="wrapper">
<%if(memberDto != null){ %>
<div class="container">

	<div class="col-md-1 col-lg-2"></div>
        <div class="panel panel-default widget col-md-10 col-lg-8">
            <div class="panel-heading">
                <span class="glyphicon glyphicon-comment"></span><h3 class="panel-title">������</h3>
            </div>
            <div class="panel-body">
                <ul class="list-group">
                	<c:forEach var="i" begin="0" end="2" step="1">
	                    <li class="list-group-item">
	                        <div class="row">
	                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
	                                <img src="http://placehold.it/80" class="img-circle img-responsive" alt="" /></div>
	                            <div class="col-xs-8 col-sm-9 col-md-8 col-lg-7">
	                                <div>
	                                    <h5>ģ �� �� û  or �÷��� �ʴ�(if�� ������ ģ����û���� �÷��� �ʴ����� )</h5>
	                                    <div class="mic-info">from: <a href="#">���ѱ�(hangil123)</a> <br>
	                                    date : 2016-09-09 (���� ���� ��¥)
	                                    </div>
	                                </div>
	                                <div class="comment-text">
	                                    	����� �츮�� �÷��ʷ� �ʴ��մϴ�!
	                                </div>
	                            </div>
	                            <div>
	                            <br>
	    							<a href="${root}/" class="btn btn-sm btn-hover btn-primary"><span class="glyphicon glyphicon-share-alt" style="padding-right:3px;"></span>����</a>
	      						</div>
	      						<br>
	      						<div>
	      						<a href="${root}/" class="btn btn-sm btn-hover btn-danger"><span class="glyphicon glyphicon-remove" style="padding-right:3px;"></span>����</a>
	                        	</div>
	                        </div>
	                    </li>
	                    <br>
                    </c:forEach>
                </ul>
            </div>
        </div>
      <div class="col-md-1 col-lg-2"></div>
    </div>
<%} else { %>

<%} %>

</div>
<%@include file="/common/footer.jsp" %>

</body>
</html>