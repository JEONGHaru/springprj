<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
<style type="text/css">
.chat > li:hover{
	cursor:pointer;
}

</style>

<script type="text/javascript" src="/resources/js/reply.js" ></script>
<script type="text/javascript">
	//reply.js 객체를 사용해보자
	$(function(){
		//console.log("-------------------------------");
		//console.log("JS TEST");
		var bnoValue = '${board.bno}';
		var replyUL = $(".chat");
		//자동으로 한번은 댓글이 실행이 되야함. 페이지는 : 1로만
		showList(1);
		//자동으로 실행이 안되고 호출해야 실행됨
		function showList(page){
			console.log("showList------page : "+page);
		//getList(서버로 전달데이터,서버에 갔다오면 처리되는 함수(callback),에러를 처리되는 함수(error))
		replyService.getList(
				{bno: bnoValue , page : page || 1},
				function(replyCnt,list){
					
					//넘어오는 데이터 확인하기
					//console.log("replyCnt : " + replyCnt);
					//console.log("list : " + list);
					
					/* if(page == -1){
						pageNum = Math.ceil(replyCnt/10.0);
						showList(pageNum);
						return;
					} */
					//list가 넘어오지않았거나 데이터가 없는경우 처리하지 않는다
					if(list ==null || list.length == 0){
						replyUL.html("");
						return;
					}
					var str = "";
					//데이터가 있는경우의 처리
					for(var i = 0, len = list.length || 0; i < len; i++ ){
						//console.log(list[i]);
						str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
						str += "	<div>";
						str += "		<div class='header'>";
						str += "		<strong class='primary-font'>"+ list[i].replyer +"</strong>";
						str += "		<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small>";
						str += "		<p>" + list[i].reply + "</p>";		
						str += "		</div>"
						str += "	</div>"
						str += "</li>";
					} //for 문의 끝 - str의 완성  : 데이터가 있는 만큼li tag 가 생긴다
					replyUL.html(str); // 원래 있던것은 사라지고 덮어쓰기가 된다
					showReplyPage(replyCnt);
				}		
		); //replyService.getList()의 끝
		} //showList()의 끝
		//댓글 등록을 위한 모달창을 보이게 하는 버튼 이벤트
		$("#addReplyBtn").on("click",function(e){
			//alert("댓글 등록 창 열기 클릭");
			//모달창의 데이터를 지운다
			$("#modalReply,#modalReplyer").val("");
			//필요한 입력 항목은 보이게 필요없는 항목은 보이지않게 처리
			$("#modalUpdateBtn,#modalDeleteBtn").hide();
			$("#modalRegisterBtn").show();
			//모달창을 보이게 한다
			$("#myModal").modal("show");
		});
		
		//모달창의 reply 등록 버튼 - > 댓글 등록처리
		$("#modalRegisterBtn").on("click",function(){
			//alert("댓글 등록 진행 버튼 이벤트");
			//데이터 수집
			var reply = {
					reply :  $("#modalReply").val(),
					replyer :  $("#modalReplyer").val(),
					bno : bnoValue
			}
			//댓글 등록 함수로 데이터 전달 진행후 등록
			replyService.add(reply,function(result){
				//등록 성공하면 실행되는 함수
				alert(result);
				//댓글 리스트를 새롭게 화면에 등록
				showList(1);
			});
			
			//모달창 닫기
			$("#myModal").modal("hide");
		});//모달창의 등록 버튼 이벤트의 끝
		
		// 댓글을 클릭하면 수정/삭제 이벤트 모달창
		$(replyUL).on("click","li",function(){
			//alert("댓글 수정/삭제를 진행");
			//rno를 찾아 와서 모달에 세팅하자 (data-* 를 활용)
			var rno = $(this).data("rno");
			//alert(rno);
			//수정할 데이터 세팅
			var reply = $(this).find("p").html();
			var replyer = $(this).find("strong").html();
			//alert(reply);
			$("#modalReply").val(reply.replaceAll("<br>","\n"));
			$("#modalReplyer").val(replyer);
			//필요한 버튼은 보이게 
			$("#myModal").data("rno",rno);
			//alert($("#myModal").data("rno"));
			$("#modalUpdateBtn,#modalDeleteBtn").show();
			$("#modalRegisterBtn").hide();
			$("#myModal").modal("show");
			
		});//댓글 수정/삭제 이벤트 모달창의 끝
		
		//모달 reply 수정 이벤트
		$("#modalUpdateBtn").on("click",function(){
				$("#myModal").modal("hide");
			var reply = {
					reply :  $("#modalReply").val(),
					replyer :  $("#modalReplyer").val(),
					rno : $("#myModal").data("rno")
			}
			//replyService로 보낸다
			replyService.update(reply,function(result){
				alert(result);
				showList(pageNum)
			});
		})//모달 reply 수정 이벤트끝
		
		//모달 reply 삭제 이벤트
		$("#modalDeleteBtn").on("click",function(){
			var rno = $("#myModal").data("rno");
				//alert(rno);
				$("#myModal").modal("hide");
			//replyService로 보낸다
			replyService.remove(rno,
				//성공했을때 실행되는 함수
				function(result){
				alert(result);
				showList(1)
				//실패했을때 실행되는 함수
			},function(err){
				alert("Error..... : " + err)
			})
		})//모달 reply 수정 이벤트끝
		
		var pageNum = 1;
		var replyPageFooter = $("#footer_replyPagenation");
		
		//reply pagenation 을 위한 처리
		function showReplyPage(replyCnt){
			// 10 = 페이지에 보여주고 싶은 댓글 개수
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - (10-1);
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt) endNum = Math.ceil(replyCnt/10.0);
			if(endNum * 10 < replyCnt) next = true;
			//이전 페이지 표시
			var str = "<ul class='pagination pull-right'>";
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>"
			}
			//시작~마지막 페이지까지
			for(var i = startNum ; i <= endNum; i++){
				//현재 페이지 표시
				var active = pageNum == i ? "active" : "";
				str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>"
			}
			//다음 페이지 표시
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>"
			}
			str += "</ul>"
			console.log(str);
			//pagenation객체의 HTML에 넣는다
			replyPageFooter.html(str);
		}// reply pagenation 처리함수끝
		
		//pagenation 페이지  이벤트 함수
		//이떄는 반드시 on 함수를 사용해야만 함 - JS에 의해서 새로생긴 태그에는 이벤트는 주어지지않는다.
		replyPageFooter.on("click","li a",function(e){
			//a태그 이벤트 무시
			e.preventDefault();
			//alert("댓글 페이지 이동클릭");
			
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
		
		(function(){
		//첨부파일 데이터를 불러오는 Ajax 처리 함수
		var bno = "${board.bno}";
		$.getJSON("/board/getAttachList",{bno :bno },function(arr){
			//console.log(arr);
			//ul tag안에 li 작성해서 넣기
			showUploadFile(arr);
		});
		})();
		
		//파일명 리스트를 보여줄 UL 태크
		var uploadResult = $(".uploadResult ul");
		//보여줄 함수
		function showUploadFile(list){
			//ul tag 비우기
			//uploadResult.empty();
			var str = "";
			// list가 있는 만큼 반복시킨다
			$(list).each(function(i,obj){
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName
				+"' data-type='"+obj.fileType+"'>";
				str += "<div>";
				if(!obj.fileType){
					var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+obj.uuid+"_"+obj.fileName);
				str += "<span>"+obj.fileName+"</span><br>"
				}else{
					//이미지의 경우
					//불러온 파일 정보
					var fileCallPath = encodeURIComponent(obj.uploadPath +"/s_"+obj.uuid+"_"+obj.fileName);
					var originPath = obj.uploadPath +"/"+obj.uuid+"_"+obj.fileName
					
					originPath = originPath.replace(new RegExp(/\\/g),"/");
					str += "<img src='/display?fileName="+fileCallPath+"'>";
				}
				str += "</div>";
				str += "</li>";
			});
			
			uploadResult.append(str);
		}//파일명 보여주는함수의 끝
		
		//큰이미지 안보이게하는 이벤트
		$(".bigPictureWrapper").on("click",function(e){
			$(".bigPicture").animate({width:'0%',height:'0%'},1000);
			setTimeout(
				() => {$(this).hide()},
				1000
			);
			
		});//큰이미지 안보이게하는 이벤트의 끝
		
		//첨부 파일을 둘러싸고 있는 li tag 클릭 이벤트
		$(".uploadResult").on("click","li",function(){
			//alert("첨부파일 클릭")
			var liObj = $(this);
			//작업할 파일명 세팅(서버에 올라간 원본 이미지)
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"))
			//이미지 인경우
			if(liObj.data("type")){
				showImage(path.replace(new RegExp(/\\/g),"/"))
			}else{
				location="/download?fileName=" + path;
			}
		});//첨부 파일을 둘러싸고 있는 li tag 클릭 이벤트의 끝
	});
	function showImage(fileCallPath){
		//동작 확인
		//alert(fileCallPath);
		$(".bigPictureWrapper").css("display","flex").show();
		$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
		.animate({width:'100%',height:'100%'},1000);
	}
</script>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                <!-- 페이지 제목 -->
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    <!-- 테이블 이름 -->
                        <div class="panel-heading">
                           Board Read page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="form-group">
                            	<label>Bno</label>
                            	<input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
                            </div>
                            <div class="form-group">
                            	<label>Title</label>
                            	<input class="form-control" name="title" value="${board.title}" readonly="readonly">
                            </div>
                            <div class="form-group">
                            	<label>Content</label>
                            	<textarea rows="5" class="form-control" name="content" readonly="readonly">${board.content}</textarea>
                            </div>
                            <div class="form-group">
                            	<label>Writer</label>
                            	<input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
                            </div>
                            <button data-oper="modify" class="btn btn-default"
                            	onclick="location='modify?bno=${board.bno}&pageNum=${param.pageNum}&amount=${param.amount}&type=${param.type}&keyword=${param.keyword}'">Modify</button>
                            <button data-oper="list" class="btn btn-default"
                            	onclick="location='list?pageNum=${param.pageNum}&amount=${param.amount}&type=${param.type}&keyword=${param.keyword}'">List</button>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <!-- 작은 이미지를 클릭시 큰이미지로 보여줄 div -->
            <div class="bigPictureWrapper">
				<div class="bigPicture"></div>
			</div>
			<!-- /.bigPictureWrapper -->
			<style type="text/css">
.bigPictureWrapper{
	position:absolute;
	disply:none;
	justify-content:center;
	align-items:center;
	top : 0%;
	width: 100%;
	height: 100%;
	backgroun-color: gray;
	z-index: 100;
	backgroun: rgba(255,255,255,0.5);
}
.bigPicture{
	position : relative;
	display: flex;
	justify-content: center;
	align-items: center;
}
.bigPicture img{
	width: 600px;

}
.uploadResult ul li:hover{
	cursor:pointer;
	border:2px dotted #ddd;
	boarder-radius:5px; 
	color:red;
}

</style>
			<!-- 올라간 파일명 보여주기 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
					  <div class="panel-heading">Files</div>
					  <div class="panel-body">
					  	<div class="uploadResult">
					  		<ul></ul>
					  	</div>
					  </div>
					</div>
				</div>
			</div>
            <div class="row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
					  <div class="panel-heading">
					  <i class="fa fa-comments fa-fw"></i><b>Reply</b>
					  	<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
					  </div>
					  <div class="panel-body">
					  	<ul class="chat">
					  		<!-- ajax로 데이터를 가져와서 chat에 empty()를 이용해서 비운 다음 append로 추가 -->
					  		
					  	</ul>
					  	<!-- /.chat -->
					  	<div class="panel-footer" id="footer_replyPagenation">
					  		
					  	</div>
					  	<!-- /.panel-footer -->
					  </div>
					  <!-- /.panel-body -->
					</div>
					<!-- /.panel -->
            	</div>
            	<!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
<!-- 댓글 등록 수정 삭제를 위한 모달창 만들기 : 맨 처음에는 안보이게 한다 -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">REPLY MODAL</h4>
      </div>
      <div class="modal-body">
      	<div class="form-group">
      		<label>Reply</label>
      		<textarea rows="3" name="reply" class="form-control" id="modalReply"></textarea>
      	</div>
      	<div class="form-group">
      		<label>Replyer</label>
      		<input name="replyer" class="form-control" id="modalReplyer">
      	</div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-warning" id="modalUpdateBtn">Update</button>
        <button class="btn btn-danger" id="modalDeleteBtn">Delete</button>
        <button class="btn btn-primary" id="modalRegisterBtn">Register</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>            
<%@ include file="../includes/footer.jsp" %>
    
