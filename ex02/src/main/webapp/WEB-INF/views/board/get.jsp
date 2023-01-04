<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>

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
                            	onclick="location='modify?bno=${board.bno}&pageNum=${param.pageNum}&amount=${param.amount}'">Modify</button>
                            <button data-oper="list" class="btn btn-default"
                            	onclick="location='list?pageNum=${param.pageNum}&amount=${param.amount}'">List</button>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
<%@ include file="../includes/footer.jsp" %>
    
