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
                           <a href="register" class="btn btn-xs btn-default pull-right">Register New Board</a>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
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
                               		<tr onclick="location='get?bno=${board.bno}'">
                               			<td>${board.bno}</td>
                               			<td><c:out value="${board.title}"/></td>
                               			<td>${board.writer}</td>
                               			<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>
                               			<td><fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd"/></td>
                               		</tr>
                               	</c:forEach>	
                               </tbody>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
<%@ include file="../includes/footer.jsp" %>
    
