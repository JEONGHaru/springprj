<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
    <script type="text/javascript">
		$(function(){
			var formObj = $("#modifyForm");
			$("button[data-oper='remove']").on("click",function(){
				if(!confirm("정말 삭제 하시겠습니까?")) return false;
				formObj.attr("action","remove");
				/* formObj.submit(); */
			});
		});
	</script>	
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                <!-- 페이지 제목 -->
                    <h1 class="page-header">Board Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    <!-- 테이블 이름 -->
                        <div class="panel-heading">
                           Board Modify
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
	                        <form role="form" method="POST" id="modifyForm">
	                            <div class="form-group">
	                            	<label>Bno</label>
	                            	<input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
	                            </div>
	                            <div class="form-group">
	                            	<label>Title</label>
	                            	<input class="form-control" name="title" value="${board.title}">
	                            </div>
	                            <div class="form-group">
	                            	<label>Content</label>
	                            	<textarea rows="5" class="form-control" name="content" >${board.content}</textarea>
	                            </div>
	                            <div class="form-group">
	                            	<label>Writer</label>
	                            	<input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
	                            </div>
	                            <button data-oper="modify" class="btn btn-default">Modify</button>
	                            <button data-oper="remove" class="btn btn-danger">Remove</button>
	                            <button data-oper="list" class="btn btn-default" type="button"
	                            	onclick="location='list'">List</button>
	                        </form>
                        </div>
                      
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
 
<%@ include file="../includes/footer.jsp" %>
    
