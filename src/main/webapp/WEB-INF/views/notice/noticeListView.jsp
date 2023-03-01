<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #pagingArea{width:fit-content;margin:auto;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <div class="content">
    	<br><br>
    	<div class="innerOuter" style="padding:5% 10%;">
            <h2>공지사항</h2>
            <br>
            
            <c:if test="${ loginUser.userId eq 'admin' }">
	            <a class="btn btn-secondary" style="float:right" href="enrollForm.no">글쓰기</a>
	            <br>
            </c:if>
            
            <br>
            <table id="noticeList" class="table table-hover">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="n" items="${ list }">
	                    <tr>
	                        <td>${ n.noticeNo }</td>
	                        <td class="nTitle">${ n.noticeTitle }</td>
	                        <td>${ n.createDate }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <script>
	            $(function(){
	        		$(".nTitle").click(function(){
	        			location.href = 'detail.no?no=' + $(this).siblings().eq(0).text();
	        		})
	        	})
            </script>

            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.no?cpage=${ pi.currentPage - 1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="list.no?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.no?cpage=${ pi.currentPage + 1 }">Next</a></li>
                   		</c:otherwise>
                    </c:choose>
                </ul>
            </div>
		</div>
        <br><br>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>