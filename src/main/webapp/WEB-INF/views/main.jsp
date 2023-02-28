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
	
	<jsp:include page="common/header.jsp" />
	
	<div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>게시판 Top5</h2>
            <br>
            
            <a href="list.bo" style="float:right;">더보기 >></a>
            <br><br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                    <th>첨부파일</th>
                  </tr>
                </thead>
                <tbody>
                	<!-- 현재 조회수가 가장 높은 상위 5개의 게시글 조회해서 뿌리기 -->
                </tbody>
            </table>
            <script>
            	$(function(){
            		
            		topBoardList();
            		
            		setInterval(topBoardList, 3000);
            		
            		/*
            		$("#boardList>tbody>tr").click(function(){
            			location.href = 'detail.bo?no=' + $(this).children(".bno").text();
            		})
            		*/
            		
            		// 동적으로 만들어진 요소에 이벤트 부여 방법
            		$(document).on("click", "#boardList>tbody>tr", function(){
            			location.href = 'detail.bo?no=' + $(this).children().eq(0).text();
            		})
            	})
            	
            	// 조회수가 가장 높은 상위5개의 게시글 조회용 ajax
            	function topBoardList(){
            		$.ajax({
            			url:"topList.bo",
            			success:function(list){
            				console.log(list);
            				
            				let value = "";
            				for(let i=0; i<list.length; i++){
            					let b = list[i]; // {}
            					value += "<tr>"
            							+	"<td>" + b.boardNo + "</td>"
            							+	"<td>" + b.boardTitle + "</td>"
            							+	"<td>" + b.boardWriter + "</td>"
            							+	"<td>" + b.count + "</td>"
            							+	"<td>" + b.createDate + "</td>"
            							+	"<td>";
            					if(b.originName != null){
            						value += "★";
            					}
            					value += "</td></tr>";	
            				}
            				
            				$("#boardList tbody").html(value);
            			},error:function(){
            				console.log("조회수 top5 게시글 조회용 ajax 통신 실패");
            			}
            		})
            	}
            </script>
            
            <br>
            
        </div>
        <br><br>
    </div>
	
	<jsp:include page="common/footer.jsp" />
	
</body>
</html>