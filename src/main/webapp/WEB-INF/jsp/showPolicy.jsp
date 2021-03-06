	<!DOCTYPE html>
	<html lang="ja">
		<head>
			<meta charset="UTF-8">
			<title>プライバシーポリシー</title>
			<!-- Latest compiled and minified CSS -->
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
			<link href="/TeraNavi/css/policy.css" rel="stylesheet" type="text/css">
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
		</head>
		<body class="hidden-md" data-spy="scroll">
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>


			<div class="section  hidden-xs">
				<div class="container">
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<h1>プライバシーポリシー最新版</h1>
						</div>
					</div>
				</div>
			</div>

			<div class="visible-xs col-xs-10 col-xs-offset-1">
				<h2>プライバシーポリシー</h2>
			</div>

			<div class="section">
				<div class="container">
					<div class="row">
						<div id="listMobile" class=" dropdown visible-xs">
							<ul class="dropdown-menu"  style="width:100%;">

							</ul>
						</div>
						<div class="col-md-8 col-md-offset-1">
							<div id="main">
								<h1>少々お待ちください</h1>
							</div>
						</div>
						<div class="col-md-2 hidden-xs">
							<div id="list">
								<ul>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>


			<jsp:include page="/WEB-INF/jsp/footer.jsp"/>

			<script src="/TeraNavi/js/LoadPolicy.js"></script>

			</script>

		</body>
	</html>
