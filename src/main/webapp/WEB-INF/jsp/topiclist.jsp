	<!DOCTYPE html>
	<html lang="ja">
		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>トピックリスト</title>
			<!-- Latest compiled and minified CSS -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

			<!-- Optional theme -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
			<!-- Latest compiled and minified JavaScript -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
			<script type="text/javascript" src="js/fileup.js"></script>

			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
			<link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">
			<link rel="stylesheet" type="text/css" href="/TeraNavi/css/style.css">
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
		</head>
		<body>
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>
			<form action="commSetting" method="post" id="setting" >

				<div class="hidden-xs">
					<img src="${result.headerPath}" id="headimg">

				</div>
				<div class="visible-xs">
					<img src="${result.headerPath}" id="topicImgMobile">
				</div>

				<div class="container-fluid">
					<div class="row hidden-xs">
						<div class="col-md-3"></div>
						<div class="col-md-13">
							<p>
								<a href="/TeraNavi/front/showcomm?commId=${result.id}">
									<span id="name" class="col-md-12 text-center text-muted" style="position:relative;margin-top:-200px;background-color:rgba(255,255,255,0.7);font-size: 60px;">${result.name}</span>
								</a>
							</p>
						</div>
						<div class="col-md-4"></div>
					</div>
					<div class="row visible-xs">
						<div class="col-xs-10">
							<p>
								<a href="/TeraNavi/front/showcomm?commId=${result.id}">
									<span id="mobileCommName-tppic" class="col-xs-8 text-center text-muted">${result.name}</span>
								</a>
							</p>
						</div>
					</div>

					<div class="row hidden-xs">
						<div class="col-md-12">
							<img id="icon" src="${result.iconPath}" style="width:130px; height:130px; position:relative; bottom:110px; margin-left:50px;"></img>
						</div>
					</div>
					<div class="row visible-xs">
						<div class="col-xs-12">
							<img id="mobileCommIcon" src="${result.iconPath}"></img>
						</div>
					</div>


					<!--トピック一覧の生成処理-->
					<div class="section hidden-xs">
						<div class="container-fluid">
							<div class="row">
								<c:choose>
									<c:when test="${empty result.topics}">
										<div class="row col-md-2"></div>
										<div class="row col-md-10">
											<h1>トピックが作成されていません</h1>
										</div>
									</c:when>
									<c:otherwise>
										<form name="memberForm" action="/TeraNavi/front/showMemberList" method="post">
											<input type="hidden" name="commId" value="${result.id}">
										</form>
										<div class="col-xs-1"></div>
										<div class="col-xs-10">
											<c:forEach var="item" items="${result.topics}">
												<div class="row col-md-10 col-md-offset-1 well">
													<div class="col-md-2">
														<img class="img-thumbnail" src="${item.userIconPath}" id="topicIcon">
														<p>
															<c:out value="${item.createUserName}" />
														</p>
													</div>

													<div class="col-md-7">
														<a href="showchat?topicId=${item.topicId}&communityId=${result.id}">
															<h2 class="text-muted">${item.name}</h2>
														</a>
													</div>

													<div class="col-md-3">
														<p id="date">
															<c:out value="${item.updateDate}" />
														</p>
													</div>
												</div>
											</c:forEach>
										</div>
										<div class="col-md-1"></div>
									</c:otherwise>
								</c:choose>
							</div>



								<div class="hidden-xs">
									<c:if test="${not empty sessionScope.loginUser}">
										<div class="row">
											<div class="col-md-10 col-md-offset-1">
												<div class="col-md-10"></div>
												<div class="col-md-2">
													<a class="btn btn-warning" data-toggle="modal" data-target="#myModal">新しいトピックを作成</a>
												</div>
											</div>
										</div>
									</c:if>
								</div>

						</div>
					</div>
				</div>

								<!--モバイル用画面-->
							<div class="row visible-xs">
								<form name="memberForm" action="/TeraNavi/front/showMemberList" method="post">
									<input type="hidden" name="commId" value="${result.id}">
								</form>
								<div class="col-xs-12 mobile-list-topic">
									<table class="table-striped">
										<tbody>
											<c:forEach var="item" items="${result.topics}" varStatus="i">

													<tr>
														<td>
															<img class="img-thumbnail" src="${item.userIconPath}" id="mobileTopicIcon">
															<p id="mobileCreateUser">
																<c:out value="${item.createUserName}" />
															</p>
														</td>
														<td class="topicMobileListContent">
															<a href="showchat?topicId=${item.topicId}&communityId=${result.id}">
																<h3 id="mobileTopicName" class="text-muted">${item.name}</h3>
															</a>
															<br>
															<p id="mobileCreateDate">
																<c:out value="${item.updateDate}" />

															</p>

														</td>

													</tr>

											</c:forEach>

										</tbody>
									</table>

								</div>
							</div>

								<div class="visible-xs mobile-btn-create">

									<c:if test="${not empty sessionScope.loginUser}">
										<div class="row">

												<div class="col-xs-10 col-xs-offset-1">
													<a class="btn btn-warning btn-block" data-toggle="modal" data-target="#myModal">新しいトピックを作成</a>
												</div>

										</div>
									</c:if>
								</div>


				<!-- モーダルウィンドウの中身 -->
				<div class="fade modal text-justify" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
								<h4 class="modal-title text-center">新規トピック作成</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-10">
										<h1>新しいトピック名</h1>
										<form id="newtopic" action="/TeraNavi/front/createtopic" method="post">
											<input type="text" size="50" name="topic_name">
											<input type="hidden" name="communityId" value="${result.id}">
										</form>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" form="newtopic" type="submit">作成する</button>
							</div>
						</div>
					</div>
				</div><%-- modal-end--%>
				<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
				<script type="text/javascript">
					$(function () {
						$("#createtopicbutton").on("click", function () {
							var target = $(".modal-body > .row > .col-md-10");
							var commId = $("input[name=communityId]").val();
							var topicName = $("input[name=topic_name]").val();
							target.empty().append('<div class="row"><div class="col-md-4"></div><div class="col-md-4"><img src="/TeraNavi/img/gif-load.gif"/><h3 class="text-center">作成中...</h3></div><div class="col-md-4"></div>');

							setTimeout(2000);

							$.ajax({
								url: '/TeraNavi/front/createtopic',
								type: 'POST',
								dataType: 'json',
								data: {
									communityId: commId,
									topic_name: topicName,
									ajax: 'true'
								}
							})
									.done(function (data) {
										target.empty();
										target.append(
												'<div class="col-md-4"></div>' +
												'<div class="col-md-4">' +
												'<h3 class="text-center">作成しました!</h3>' +
												'<a href=/TeraNavi/front/showTopic?communityId=' + commId + '>トピック一覧へ</a>' +
												'</div>' +
												'<div class="col-md-4"></div>'
												);
									})
									.fail(function () {
									});
						});
					});
				</script>
		</body>
	</html>
