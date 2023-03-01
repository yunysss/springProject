<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>공지사항 상세보기</h2>
            <br><br>
            <table align="center" border="1">
                <tr>
                    <th>제목</th>
                    <td colspan="3">${ n.noticeTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ n.noticeWriter }</td>
                    <th>작성일</th>
                    <td>${ n.createDate }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">${ n.noticeContent }</td>
                </tr>
            </table>
            <br>

			<c:if test="${ loginUser.userId eq 'admin' }">
	            <div align="center">
	                <a class="btn btn-primary" href="updateForm.no?no=${ n.noticeNo }">수정하기</a>
	                <a class="btn btn-danger" href="delete.no?no=${ n.noticeNo }">삭제하기</a>
	            </div>
	        </c:if>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>