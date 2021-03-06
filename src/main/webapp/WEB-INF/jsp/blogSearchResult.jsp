<!DOCTYPE html>
	<html lang="ja">
		<head>
			<title>検索結果</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="/TeraNavi/css/search.css" rel="stylesheet" type="text/css">
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
		</head>
		<body>
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>

			<h2 class="page-title">ブログの検索結果</h2>
			<br>

			<div class="section hidden-xs">
				<div class="container">
					<c:forEach var="item" items="${result}">
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<img src="${item.headerPath}" class="img-responsive">
								<div class="blog">
									<a href="/TeraNavi/front/showBlog?bloguserId=${item.userId}">
										<h1 class="text-muted">${item.title}</h1>
									</a>
									<p>${item.explanation}<br></p>
								</div>
							</div>
						</div><br><br>
					</c:forEach>
						<div class="row">
					<div class="col-md-10 col-md-offset-1 col-xs-12">
						<h3 class="text-center">検索結果は以上です</h3>
					</div>
					<div class="col-md-1 col-xs-0">

					</div>
				</div>

				</div><!-- container-->


			</div><!-- section -->

			<div class="visible-xs">
				<table class="table table-striped">
					<tbody>
						<c:forEach var="item" items="${result}">
							<tr>
								<td>
									<img src="${item.headerPath}" class="img-responsive mobile-blog-icon">

								</td>
								<td>
									<a href="/TeraNavi/front/showBlog?bloguserId=${item.userId}">
										<h3 class="text-muted mobile-blog-title">${item.title}</h3>
										<p>${item.explanation}<br></p>
										<br>
									</a>

								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-xs-12">
						<h3 class="text-center">検索結果は以上です</h3>
					</div>
					<div class="col-md-1 col-xs-0">

					</div>
				</div>

			</div>
			<jsp:include page="/WEB-INF/jsp/footer.jsp"/>

		</body>
	</html>
