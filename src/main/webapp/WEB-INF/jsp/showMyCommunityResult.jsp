<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>コミュニティ管理</title>
    <!-- Latest compiled and minified CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="/TeraNavi/js/bootstrap.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">
        <jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
        <style>
            .modal-open {
                overflow: auto;
            }
            .modal-close {
                overflow: auto;
            }
        </style>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>
    <%-- トップのナビゲーションを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/topnav.jsp"/>

    <div class="section">
        <div class="container">
            <div class="row">

                <div class="col-md-2 hidden-xs">
                    <jsp:include page="/WEB-INF/jsp/mypagenav.jsp"/>
                    <script>
                      $("#commMgrTab").attr("class","active");
                    </script>

                    </script>
                </div>
                <!--モバイル用のドロップダウンメニュー-->
                <div class="container visible-xs">
                    <div class="dropdown">
                        <button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">コミュニティ管理<span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li id="mypageTab">
                                <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a>
                            </li>
                            <c:choose>
                                <c:when test="${sessionScope.loginUser.blogStatus eq 1}">

                                    <li>
                                        <a href="/TeraNavi/front/showDraftArticleList?writeUserId=${sessionScope.loginUser.id}">下書き一覧</a>
                                    </li>
                                    <li>
                                        <a href="/TeraNavi/front/showBlog?edit=true&bloguserId=${sessionScope.loginUser.id}">ブログ設定</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="/TeraNavi/blogSetting">ブログ開設</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li>
                                <a href="/TeraNavi/front/commmy?groupBy=group+By+community_members_list.fk_community_id+&where=community_members_list.fk_user_id%3D+%3F+and+communities.community_delete_flag+%3D0+and+community_members_list.community_withdrawal_flag+%3D0&target=create">コミュニティ管理</a>
                            </li>
<!--									<li>
                                <a href="/TeraNavi/front/showDmList">DM</a>
                            </li>-->
                            <br><br>
                            <li>
                                <a href="/TeraNavi/withdraw">退会</a>
                            </li>


                        </ul>
                    </div>
                    <a class="btn btn-warning btn-block visible-xs" href="/TeraNavi/createcomm" role="button" style="margin-top: 60px">コミュニティ作成</a>
                </div>

                <!-- 残り8列はコンテンツ表示部分として使う -->
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1 col-xs-12">
        			        <a class="btn btn-warning btn-lg hidden-xs" href="/TeraNavi/createcomm" role="button" style="margin-left: 80%;">コミュニティ作成</a>
                        </div>
            		</div>

                    <h1 class="text-warning">作成したコミュニティ</h1>
                    <table class="table table-striped">
                        <tbody>
                            <c:forEach var="community" items="${result.list}">
                                <c:if test="${community.adminFlag eq 1}">
                                    <tr id="tableRow${community.id}">
                                        <td>
                                            <img src="${community.iconPath}" class="img-thumbnail" style="width:50px;height:50px;">
                                        </td>
                                        <td><a href="/TeraNavi/front/showcomm?commId=${community.id}"><p class="text-muted">${community.name}</p></td>
                                        <td>
                                            <button type="button" class="btn btn-default">編集</button>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${sessionScope.loginUser.id eq result.user.id}">
                                                    <button type="button" class="btn btn-danger btn_withDraw" value="${community.id}">退会</button>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="edit">
                                                <form action="commSetting" method="post" name="showDel">
                                                    <input type="hidden" name="commId" value="${community.id}">
                                                    <input type="hidden" name="commName" value="${community.name}">
                                                    <input type="hidden" name="commProfile" value="${community.profile}">
                                                    <input type="hidden" name="iconPath" value="${community.iconPath}">
                                                    <input type="hidden" name="headerPath" value="${community.headerPath}">
                                                    <input type="hidden" name="nowIconPath" value="${community.iconPath}">
                                                    <input type="hidden" name="nowHeaderPath" value="${community.headerPath}">
                                                    <input type="hidden" name="deleteFlag" value="${community.deleteFlag}">
                                                    <input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
                                                    <input type="hidden" name="del" value="del">
                                                    <input type="hidden" name="target" value="communityDeleteResult">
                                                    <button type="submit" class="btn btn-danger" id="showDel">削除</button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:set var="commAdminFlag" value="false"/>
                    <c:forEach var="comm" items="${result.list}">
                        <c:choose>
                            <c:when test="${comm.adminFlag eq 1}">
                                <c:set var="commAdminFlag" value="true"/>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${commAdminFlag eq false}">
                        <p class="text-center">まだコミュニティを作成していません</p>
                    </c:if>

                    <hr>

                    <h1 class="text-warning">参加中のコミュニティ</h1>
                    <table class="table table-striped">
                        <tbody>
                            <c:forEach var="community2" items="${result.list}">
                                <c:if test="${community2.adminFlag ne 1}">
                                    <tr id="tableRow${community2.id}">
                                        <td>
                                            <img src="${community2.iconPath}" class="img-thumbnail" style="width:50px;height:50px;">
                                        </td>
                                        <td><a href="/TeraNavi/front/showcomm?commId=${community2.id}"><p class="text-muted">${community2.name}</p></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${sessionScope.loginUser.id eq result.user.id}">
                                                    <button type="button" class="btn btn-danger btn_withDraw" value="${community2.id}">退会</button>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${fn:length(result.list) <= 0}">
                        <p class="text-center">まだコミュニティに参加していません</p>
                    </c:if>
                </div>
            </div>
        </div>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

    	<!-- 退会確認モーダル -->
    	<div class="fade modal text-justify" id="withDrawModal">
    		<div class="modal-dialog">
    		  <div class="modal-content">
    			<div class="modal-header">
    			  <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
    				<span aria-hidden="true">×</span>
    			  </button>
    			　<h4 class="modal-title text-center">確認</h4>
    			 </div>
    			<div class="modal-body">
    				<p class="text-center">本当に退会しますか？</p>
    			</div>
    			<div class="modal-footer">
    				<button type="submit" class="btn btn-block btn-danger" id="btn_modalWithDraw" data-dismiss="modal">退会</button>
    				<button type="button" class="btn btn-block btn-default" data-dismiss="modal">キャンセル</button>
    			</div>
    		  </div>
    		</div>
    	 </div>

    	 <!-- 結果モーダル -->
    	  <div class="modal fade" id="withDrawResultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    		<div class="modal-dialog">
    		  <div class="modal-content">
    			<div class="modal-header">
    			  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">閉じる</span></button>
    			  <h4 class="modal-title text-center" id="withDrawResultModalLabel">退会結果</h4>
    			</div>
    			<div class="modal-body">
    			  <p id="withDrawResultMessage" class="text-center">退会しました。</p>
    			</div>
    			<div class="modal-footer">
    			  <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
    			</div>
    		  </div><!-- /.modal-content -->
    		</div><!-- /.modal-dialog -->
    	  </div><!-- /.modal -->

          <!--コミュ編集のモーダル-->
          <div class="fade modal text-justify" id="communitySetting-modal">
              <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header">
                          <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title">コミュニティ編集確認</h4>
                      </div>

                      <div class="modal-body">
                          <div class="row">
                              <div class="col-md-1"></div>
                              <div class="col-md-10">
                                  <h2>コミュニティ名</h2>
                                  <h5 id="modalName"></h5>
                                  <h2>説明文</h2>
                                  <h5 id="modalProfile"></h5>
                                  <h2>ヘッダー画像</h2>
                                  <img src="" class="img-rounded" width="450" height="150" id="commHeader">
                                  <h2>アイコン画像</h2>
                                  <img src="" class="img-thumbnail" width="110" height="150" id="commIcon">
                              </div>
                              <div class="col-md-1"></div>
                          </div>
                      </div>
                      <div class="modal-footer">
                          <button type="submit" class="btn btn-warning" form="setting">設定する</button>
                          <button type="button" class="btn btn-warning" data-dismiss="modal">キャンセル</button>
                      </div>
                  </div>
              </div>
          </div>
    	  <%-- 退会処理のjs --%>
    	<script>
    		$(function(){

    			var withDrawId;

    			$(".btn_withDraw").on("click",function(){
    				withDrawId = $(this).val();
    				$("#withDrawModal").modal();
    			});

    			$("#btn_modalWithDraw").on("click",function(){

    				$.ajax({
    				  url: '/TeraNavi/front/withDrawComm',
    				  type:'POST',
    				  dataType: 'json',
    				  data:{
    					commId:withDrawId,
    					ajax:'true'
    				  }
    			   })
    				   .done(function(data) {
    					   $("#withDrawResultModal").modal();
    					   console.log("#tableRow"+withDrawId);
    						$("#tableRow" + withDrawId).hide();
    				   })
    				   .fail(function() {
    					   $("#withDrawResultMessage").text("退会できませんでした。もういちどお試しください。");
    					   $("#withDrawResultModal").modal();
    				   });
    			});
    		});
    	</script>
        <script>
            var ajaxSettings;
            var ajax;
            $(function () {

            ajaxSettings = {
            type: 'post',
                    url: '/TeraNavi/upload',
                    processData: false,
                    contentType: false,
                            cache: false,
                            dataType: 'json'};
                            $("#edit").click(function () {
                            var id = $('#commid');
                            var userid = $('#userId');
                            var name = $('#name');
                            var profile = $('#profile').text();
                            var iconPath = " ${result.iconPath}";
                            var headerPath = "${result .headerPath}";
                            var del = '0';
                            var target = 'communitySettingResult';
                            var button = $('#ed i tButton');
                            $("#name").html('<input type="text" class = "form-control" name="commName" value="' + name.text() + '" id="commName" maxlength="100"><br>');
                            $("#name").css("background-color", "");
                            $("#name").removeClass("col-md-12");
                            $("#name").addClass("col-md-8");
                            $("#profile").html('<textarea class="form-control" id="profile" rows="4" name="commProfile">' + profile + '</textarea>');
                            $("#headerPa t h").append('<p id="headerText">ヘッダー画像を選択</p>');
                            $("#headerPath").addClass("changeEffectHead");
                            // $("#headimg").addClass("changeEffectHead");
                            $("#iconPath").append('<p id="changeEffectIconText">アイコン画像を選択</p>');
                            $("#iconPath").addClass("changeEffectIcon");
                            $("#edit").css("display", "none");
                            // $("#iconFile").show();
                            $("#iconFile").append('<input id="comIconPath" type="hidden" name="iconPath">');
                            // $("#headerFile").show();
                            $("#headerFile").append('<input id="commHeaderPath" type="hidden" name="headerPath">');
                            button.hide();
            //									<!-- 下は隠し要素 -->
                            $('#userId').html('<input type="hidden" name="userId" value="' + userid.text() + '">');
                            $('#commid').html('<input type="hidden" name="commId" value="' + id.text() + '">');
                            $('#commid').append('<input type="hidden" name="deleteFlag" value="' + del + '">');
                            $('#commid').append('<input type="hidden" name="target" value="' + target + '">');
                            $('#commid').append('<input type="hidden" name="nowIconPath" value="' + iconPath + '">');
                            $('#commid').append('<input type="hidden" name="nowHeaderPath" value="' + headerPath + '">');
                            $('#sub').html('<button class="btn btn-warning btn-lg" type="button" id="commSubmit" data-toggle="modal">確認</button>');
                    });
                    });
                    //画像のアップロード関係
                            function fileUpIcon() {
                            var files = document.getElementById("iconFile").files;
                                    for (var i = 0; i < files.length; i++) {
                            console.log("for");
                                    var f = files[i];
                                    var formData = new FormData();
                                    formData.append("file", f);
                                    ajaxSettings.data = formData;
                                    ajaxSettings.url = "/TeraNavi/upload";
                                    ajaxSettings.success = function (data) {
                                    $("#comIconPath").val(data.result);
                                            $("#icon").attr("src", data.result);
                                    }

                            ajax = $.ajax(ajaxSettings);
                            }

                            }

                    $(document).on("change", "#headerFile", function () {
                var file = this.files[0];
                // ブラウザごとの違いをフォローする
                window.URL = window.URL || window.webkitURL;

                // Blob URLの作成
                src = window.URL.createObjectURL(file);
                $("#headimg").attr("src", src);
                fileUpHeader();
            });

            $(document).on("change", "#iconFile", function () {
                var file = this.files[0];
                // ブラウザごとの違いをフォローする
                window.URL = window.URL || window.webkitURL;

                // Blob URLの作成
                src = window.URL.createObjectURL(file);

                fileUpIcon();
            });


            function fileUpHeader() {
                var files = document.getElementById("headerFile").files;

                for (var i = 0; i < files.length; i++) {
                    console.log("for");
                    var f = files[i];
                    var formData = new FormData();
                    formData.append("file", f);
                    ajaxSettings.data = formData;
                    ajaxSettings.url = "/TeraNavi/upload/header";
                    ajaxSettings.success = function (data) {
                        $("#commHeaderPath").val(data.result);
                        $("#preHeader").attr("src", data.result);
                    }

                    ajax = $.ajax(ajaxSettings);
                }
            }

            $(document).on('click', "#commSubmit", function () {
                $("#modalName").empty();
                $("#modalProfile").empty();
                $("#commHeader").empty();
                $("#commIcon").empty();

                $("#modalName").append($("#commName").val());
                $("#modalProfile").append($("#profile").text());
                $("#commHeader").attr("src", $("#headimg").attr("src"));
                $("#commIcon").attr("src", $("#icon").attr("src"));

                $("#communitySetting-modal").modal("show");
            });

        </script>
</body>
</html>
