<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .boardOuter{
        font-size: 13px;
    }
    
    .menu{
        width:100%;
        height:50px; 
        font-size:18px;
    }
    .menus{
        height:100%;
        float:left; 
        margin-right:15px; 
        color:rgb(190, 190, 190);
        cursor: pointer;
        border-radius: 15px; 
        line-height:48px;
        text-align: center;
        font-weight: 900;
        padding-left:8px;
        padding-right:8px;
    }
    .menus:hover{opacity: 0.5;}
    .clicked{color:black;}  
</style>
</head>
<body>

	<jsp:include page="menubar.jsp"/>

	<div class="boardMenu"> 
        <h4><b>회사소식</b></h4>
        <div class="menu">
            <div class="menus" onclick="location.href='list.no'">공지사항</div>
            <div class="menus" onclick="location.href='list.bo'">익명게시판</div>
            <div class="menus" onclick="location.href='myList.bo'">나의 게시글</div>
            <!-- 관리자일 경우 보여짐 
            <div class="menus" onclick="location.href='manage.bo'">익명게시판 관리</div>
            <div class="menus" onclick="location.href='schedule.ad'">회사 일정 관리</div>
            -->
        </div>
    </div>
    
    
</body>
</html>