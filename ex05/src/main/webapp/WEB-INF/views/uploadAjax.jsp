<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadAjax</title>
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
<!-- Jquery 라이브러리 등록 : CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- ajax 처리를 위한 이벤트 -->
<script type="text/javascript">
	$(function(){
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
		
		//파일 올리기 버튼 이벤트
		$("#uploadBtn").on("click",function(e){
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
					$(".uploadDiv input").val("");
				}
			});
		});//파일 올리기 버튼 이벤트의 끝
		
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
			})
		})
		
		var uploadResult = $(".uploadResult ul");
		//파일명 리스트를 보여줄 UL 태크
		//보여줄 함수
		function showUploadFile(list){
			//ul tag 비우기
			//uploadResult.empty();
			var str = "";
			// list가 있는 만큼 반복시킨다
			$(list).each(function(i,obj){
				str += "<li>";
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
					str += "<img src='/diplay?fileName="+fileCallPath+"'>";
				}	str += "</a>";
				
				str += "<span class='deleteX' data-file=\'"+fileCallPath+"\' data-type=\'"+(obj.image?"image":"file")+"\'>";
				str += "x";
				str += "</span>";
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
			
		})
		
	});
	//원본 이미지 보여주는 함수
	function showImage(fileCallPath){
		//동작 확인
		//alert(fileCallPath);
		$(".bigPictureWrapper").css("display","flex").show();
		$(".bigPicture").html("<img src='/diplay?fileName="+encodeURI(fileCallPath)+"'>")
		.animate({width:'100%',height:'100%'},1000);
	}
</script>
</head>
<body>
<!-- ajax인 경우 form을 사용하지않음 동작되지도 않음 필요x -->
<h1>Upload With Ajax</h1>

<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple>
</div>

<button id="uploadBtn">uploadFile</button>
<div class="uploadResult">
	<ul></ul>
</div>
<div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>
</body>
</html>