<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

  <!-- Bootstrap Core CSS -->
    <link href="/resources/css/reply/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/css/reply/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/css/reply/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/css/reply/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/css/reply/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/css/reply/font-awesome.min.css" rel="stylesheet" type="text/css">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- Ajax.js -->
<script src="/resources/css/reply/reply.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
    function alignModal(){
        var modalDialog = $(this).find(".modal-dialog");
        
        // Applying the top margin on modal dialog to align it vertically center
        modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 2));
    }
    // Align modal when it is displayed
    $(".modal").on("shown.bs.modal", alignModal);
    
    // Align modal when user resize the window
    $(window).on("resize", function(){
        $(".modal:visible").each(alignModal);
    });   
});
	/* $(document).ready(function() {

		// addReply 버튼을 클릭하면 모달창을 보여준다
		$("#addReplyBtn").on("click", function() {
			// 초기화
			$("#updateBtn").hide();
			$("#removeBtn").hide();
			$("#replyInsertBtn").show();
			$("#reply").val("");
			$("#replyer").val("");
			// 모달창 보여줌
			$("#myModal").modal("show");
		});
		
		// 선택자
		// 아이디 : # , class : . , 태그
		// $("#id")
		// $(".class")
		// $("태크명")
		$("#removeBtn").on("click", function() {
			deleteAjax();
		});

		$("#updateBtn").on("click", function() {
			updateAjax();
		});

		$("#replyInsertBtn").on("click", function() {
			// 리플 작성
			ajaxInsert();

		});

		// 실질적으로 리시트를 조회 해서 화면에 뿌려준다
		getAjaxList(); 
	});

	function replyDetail(rno) {
		// 선택된 rno세팅
		$("#rno").val(rno);

		// 버튼 숨김 처리
		$("#replyInsertBtn").hide();
		$("#updateBtn").show();
		$("#removeBtn").show();

		// 모달창 보여주기
		$("#myModal").modal("show");

		//상세내용 조회
		getAjax();

	}

	 */
</script>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<!-- /.panel-heading -->
			<div class="panel-body">



				<!-- 답글 -->
				<div class='row'>

					<div class="col-lg-12">

						<!-- /.panel -->
						<div class="panel panel-default">

							<div class="panel-heading">
								<i class="fa fa-comments fa-fw"></i> Reply
								<a href="#myModal" class="btn btn-lg btn-primary" data-toggle="modal">Launch Demo Modal</a>
							</div>


							<!-- /.panel-heading -->
							<div class="panel-body">

								<ul class="chat">

								</ul>
								<!-- ./ end ul -->
							</div>
							<!-- /.panel .chat-panel -->

							<div class="panel-footer">

								<!-- 페이징 -->
								<nav aria-label="...">
									<ul class="pagination">
									</ul>
								</nav>
								<!-- /페이징 -->
							</div>
							<!-- 리스트 호출시 bno와 pageNo 값을 가지고 감!!!!!!! -->
							<input type="text" value="user" id="user"><br> 
							<input type="hidden" id="replyPageNo" value="1"><br> 
							<input type="hidden" id="rno"><br>

						</div>
					</div>
					<!-- ./ end row -->



				</div>


			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>

<div id="myModal" class="modal">
     <div class="modal-dialog">
          <div class="modal-content">
               <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Confirmation</h4>
               </div>
               <div class="modal-body">
                    <p>Do you want to save changes you made to document before closing?</p>
                    <p class="text-warning"><small>If you don't save, your changes will be lost.</small></p>
               </div>
               <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
               </div>
          </div>
     </div>
</div>



<!-- 모달 Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Reply</h4>
			</div>
			<div class="modal-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><input type="text"
						class="form-control ml-2" placeholder="replyer" id="replyer">
					</li>
					<li class="list-group-item"><textarea class="form-control"
							id="reply" placeholder="reply" rows="3"></textarea></li>
				</ul>
			</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-warning" data-dismiss="modal"
					id="updateBtn">Modify</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal"
					id="removeBtn">Remove</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">cancle</button>
				<button type="button" class="btn btn-primary" id="replyInsertBtn">save</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->





