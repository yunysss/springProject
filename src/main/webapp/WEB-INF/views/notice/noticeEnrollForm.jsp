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
            <h2>게시글 작성하기</h2>
            <br>

            <form method="post" action="insert.no">
                <table align="center">
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="noticeTitle" required></td>
                    </tr>
                    <tr>
                        <th colspan="2">내용</th>
                    </tr>
                    <tr>
                        <td colspan="2"><textarea required name="noticeContent" style="resize:none;"></textarea></td>
                    </tr>
                </table>
                <br>
				<input type="hidden" name="noticeWriter" value="${ loginUser.userId }">
                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>