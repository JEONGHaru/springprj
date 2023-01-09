<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
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
.deleteX:hover{
	cursor:pointer;
	color:red;
}

</style>
<script type="text/javascript">
$(function(){
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click",function(e){
		//submit 이벤트 무시 - 진행은 계속 된다
		e.preventDefault();
		console.log("submit click!");
		
		var str = "";
		$(".uploadResult ul li").each(function(i,obj){
			var jobj = $(obj);
			console.dir(jobj);
			console.log(jobj.data("filename"));
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			
		});//foreach의 끝 추가할 input tag
			formObj.append(str).submit();
		
	});
	//업로드 될수 없는 파일 종류의 정규식
	//생성자를 통해 대소문자 구분하지않음 설정 "i"
	//리터럴 사용시 \i를 문자뒤에 붙임
	//이미지 인경우 - 썸네일 파일을 따로만든다 - 이미지의 판단과 썸네일 작업은 JAVA(Controller)에서 
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$","i");
	//현재 페이지에서의 파일 제한
	var maxSize = 52428000; // 5MB(1024*1024*5)
	//파일데이터의 유효성 검사
	function chechExtension(fileName,fileSize){
		if(fileSize > maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)) {
			alert("해당 파일은 업로드 할수없습니다");
			return false;
		}
		return true;
	}
	//파일 선택이 되면 값이 변하는 change 이벤트
	$("input[type='file']").on("change",function(e){
		//console.log("파일 첨부가 됨");
		//formData -> 만듬(사용 x)
		var formData = new FormData();
		console.log(formData);
		//input 태그중 name이 uploadFile인 것을 선택
		var inputFile = $("input[name='uploadFile']");
		console.log(inputFile);
		//inputFile[0] = index 중 0번째 파일은 선택
		var files = inputFile[0].files;
		console.log(files);
		//files를 formData에 한개씩 추가
		for(var i = 0; i< files.length; i++){
			//파일 체크 - 사이즈 , 종류
			if(!chechExtension(files[i].name,files[i].size)){
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		
		//서버에 데이터 넘겨서 처리
		$.ajax({
			url : "/uploadAjaxAction",
			processData : false,
			contentType : false,
			data : formData,
			type : "POST",
			dataType : "JSON",
			success : function(result){
				console.log(JSON.stringify(result));
				//업로드 파일 화면에 보이기
				showUploadFile(result);
				//$(".uploadDiv input").val("");
			}
		});
	});//파일 선택이 되면 값이 변하는 change 이벤트
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
				+"' data-type='"+obj.image+"'>";
			str += "<div>";
			if(!obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+obj.uuid+"_"+obj.fileName);
			str += "<a href='/download?fileName="+fileCallPath+"'>";	
			str += obj.fileName
			str += "</a>"
			}else{
				//이미지의 경우
				//불러온 파일 정보
				var fileCallPath = encodeURIComponent(obj.uploadPath +"/s_"+obj.uuid+"_"+obj.fileName);
				var originPath = obj.uploadPath +"/"+obj.uuid+"_"+obj.fileName
				
				originPath = originPath.replace(new RegExp(/\\/g),"/");
				str += "<a href=\"javascript:showImage(\'"+originPath+"\')\">";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</a>";
		}
			str += "<span class='deleteX' data-file=\'"+fileCallPath+"\' data-type=\'"+(obj.image?"image":"file")+"\'>";
			str += "x";
			str += "</span>";
			str += "</div>";
			str += "</li>";
		});
		
		uploadResult.append(str);
	}//파일명 보여주는함수의 끝
		//파일 삭제 이벤트
		$(".uploadResult").on("click",".deleteX",function(e){
			//alert("파일 삭제이벤트")
			var deleteX = $(this);
			//서버에 넘겨줄 데이터 수집
			var targetFile = $(this).data("file");
			var targetType = $(this).data("type");
			//console.log(targetFile,targetType);
			$.ajax({
				url: '/deleteFile',
				data : {fileName :targetFile,
						type : targetType},
				dataType : 'text', //서버에서 결과로 전달되는 데이텨 형식
				type : "POST",
				success : function(result){
					alert(result);
					deleteX.closest("li").remove();
				}
			});
		});// 파일삭제 이벤트 끝
}); //document function의 끝
</script>	
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                <!-- 페이지 제목 -->
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    <!-- 테이블 이름 -->
                        <div class="panel-heading">
                           Board Register
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form role="form" action="register" method="POST">
                            	<div class="form-group">
                            		<label>Title</label>
                            		<input class="form-control" name="title">
                            	</div>
                            	<div class="form-group">
                            		<label>Text Area</label>
                            		<textarea rows="3" name="content" class="form-control"></textarea>
                            	</div>
                            	<div class="form-group">
                            		<label>Writer</label>
                            		<input class="form-control" name="writer"></input>
                            	</div>
                            	<button type="submit" class="btn btn-default">Submit</button>
                            	<button type="reset" class="btn btn-default">Reset</button>
                            	
                            </form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
					  <div class="panel-heading">File Attach</div>
					  <div class="panel-body">
					  <!-- 첨부파일 선택 div -> 파일을 선택하면 값이 변경 -> change 이벤트 발생 -->
					  	<div class="form-group uploadDiv">
							<input type="file" name="uploadFile" multiple>
						</div>
						<!-- 올라간 파일의 정보 div -->
						<div class="uploadResult">
							<ul>
							</ul>
						</div>
					  </div>
					</div>
            	</div>
            </div>
            <!-- /.row -->
            
<%@ include file="../includes/footer.jsp" %>
    
