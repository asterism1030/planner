<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/common/public.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<li class="list-group-item">
		<div class="row">
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
				<img src="http://placehold.it/80" class="img-circle img-responsive"
					alt="" />
			</div>

			<div class="col-xs-8 col-sm-9 col-md-8 col-lg-7">
				<div>
					<h5>친 구 요 청 or 플래너 초대</h5>
					<div class="mic-info">
						from: <a href="#">이한길(hangil123)</a> <br> date : 2016-09-09
						(쪽지 보낸 날짜)
					</div>
				</div>
				<div class="comment-text">당신을 우리의 플래너로 초대합니다!</div>
			</div>
			<br>

			<div>
				<a href="javascript:accept();/"
					class="btn btn-sm btn-hover btn-primary"> <span
					class="glyphicon glyphicon-share-alt" style="padding-right: 3px;">
				</span> 수락
				</a>
			</div>

			<br>

			<div>
				<a href="javascript:deny();/"
					class="btn btn-sm btn-hover btn-danger"> <span
					class="glyphicon glyphicon-remove" style="padding-right: 3px;">
				</span> 거절
				</a>
			</div>
		</div>
	</li>
	<br>

</body>
</html>






















