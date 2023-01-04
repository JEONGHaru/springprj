<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                <!-- 페이지 제목 -->
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    <!-- 테이블 이름 -->
                        <div class="panel-heading">
                           Board List Page
                           - amount <select id="selAmount">
                           <option>10</option>
                           <option>15</option>
                           <option>20</option>
                           <option>25</option>
                           </select>
                           <a href="register" class="btn btn-xs btn-default pull-right">Register New Board</a>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <!--  <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example"> -->
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>#제목</th>
                                        <th>#작성자</th>
                                        <th>#작성일</th>
                                        <th>#수정일</th>
                                    </tr>
                                </thead>
                               <tbody>
                               	<c:forEach var="board" items="${list}">
                               		<tr class="move">
                               			<td class="bno">${board.bno}</td>
                               			<td><c:out value="${board.title}"/></td>
                               			<td>${board.writer}</td>
                               			<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>
                               			<td><fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd"/></td>
                               		</tr>
                               	</c:forEach>	
                               </tbody>
                            </table>
                            
                            <!-- 검색 폼 -->
                            <div class="row">
                            	<div class="col-lg-12">
                            		<form id="searchForm">
	                            		<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}">
	                           			<input type="hidden" name="amount" value="${pageMaker.criteria.amount}">
                            			<select name="type">
                            				<option value="">---</option>
                            				<option value="T">제목</option>
                            				<option value="C">내용</option>
                            				<option value="W">작성자</option>
                            				<option value="TC">제목 or 내용</option>
                            				<option value="TW">제목 or 작성자</option>
                            				<option value="WC">작성자 or 내용</option>
                            				<option value="TWC">제목 or 작성자 or 내용</option>
                            			</select>
                            			<input name="keyword">
                            			<button class="btn btn-default">search</button>
                            		</form>
                            	</div>
                            </div>
                            
                            <div class="row">
                            <!-- 현재 페이지와 전체 페이지 정보 -->
                            	<div class="col-md-4">${pageMaker.criteria.pageNum}/${pageMaker.totalPage}</div>
	                            <!-- 페이지네이션 -->
	                            <div class="col-md-8">
	                            <div class="pull-right">
	                            	<ul class="pagination">
	                            		<c:if test="${pageMaker.prev}">
	                            		<li class="paginate_button previous"><a href="${pageMaker.startPage-1}">Priv</a></li>
	                            		</c:if>
	                            		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                            		<li class="paginate_button ${pageMaker.criteria.pageNum == num ? 'active':'' }"><a href="${num}">${num}</a></li>
	                            		</c:forEach>
	                            		<c:if test="${pageMaker.next}">
	                            		<li class="paginate_button next"><a href="${pageMaker.endPage+1}">Next</a></li>
	                            		</c:if>
	                            	</ul>
	                            </div>
                       </div>
                       </div>
                       <!--  /.pageNation -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <!-- 페이지네이션 클릭한 페이지로 이동 시키는 정보가 있는 form태크 -->
            <form id="actionForm" action="list">
            	<!-- 클릭한 href에 들어있는 페이지 번호를 바꿔준다 -->
            	<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}" id="pageNum">
            	<input type="hidden" name="amount" value="${pageMaker.criteria.amount}">
            	<input type="hidden" name="type" value="${pageMaker.criteria.type}">
            	<input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">
            </form>
            <script type="text/javascript">
	$(function(){
		
		//검색 데이터 세팅
		var searchForm = $("#searchForm");
		$(searchForm).find("select").val("${param.type}");
		$(searchForm).find("input[name='keyword']").val("${param.keyword}");
		
		//amount 값 세팅
		$("#selAmount").val("${param.amount}");
		
		//var actionForm = $("#actionForm");
		$(".paginate_button a").on("click",function(e){
			//페이지 이동을 무시시킨다 return false와 동일
			e.preventDefault();
			//actionForm.find("input[name=pageNum]")
			$("#pageNum").val($(this).attr("href"));
			$("#actionForm").submit();
		});
		
		$(".move").on("click",function(e){
			//alert("글보기 클릭");
			//아래 actionForm에 bno를 가져와서 hidden input 태그를 앞에 추가한다/
			var bno = $(this).find(".bno").text();
			$("#actionForm")
				.prepend("<input type='hidden' name='bno' value='"+bno+"'>")
				.attr("action","get")
				.submit();
			
			//alert(bno);
			
		});
		
		//amount 변경 이벤트
		$("#selAmount").on("change",function(){
			location = "list?amount="+$(this).val();
		});
		
		//검색을 위한 유효성 검사
		/* var searchForm = $("#searchForm");
		$(searchForm).on("submit",function(e){
			e.preventDefault();
			alert("검색폼 서브밋이벤트");
		}); */
		
		
		$(searchForm).on("click","button",function(e){
			e.preventDefault();
			//alert("검색폼 버튼의 클릭이벤트");
			//if(!searchForm.find("option:selected").val())
			//alert(searchForm.find("select").val());	
			if(!searchForm.find("select").val()){
				alert("검색 종류를 선택하세요");
				searchForm.find("select").focus();
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.submit();
		});
	});
</script>
<%@ include file="../includes/footer.jsp" %>
    
