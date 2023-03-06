<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 글쓰기 버튼 */
    #write{
        background: rgb(111, 80, 248);
        color:white;
        width:70px;
        height:30px;
        font-size: 13px;
    }
    #write:hover{opacity: 0.7;}

    /* 익명게시판 리스트 */
    .table{text-align: center;}
    .table>tbody>tr:hover{cursor:pointer; opacity: 0.7;}


    /* 페이징 */
    #paging{
    	width:1600px; 
        text-align:center;
    }
    #paging>ul{display: inline-block;}
    #paging li {
        text-align: center;
        float: left;
        list-style:none;
        border-radius:5px;
        background: rgb(244, 244, 244);
        margin:2px;
    }
    #paging li a {
        display: block;
        font-size: 12px;
        color: black;
        padding: 5px 10px;
        box-sizing: border-box;
        text-decoration-line:none;
    }
    #paging li:hover{background: rgb(111, 80, 248);}
    #paging li a:hover{color: white;}
    #paging li.on {background: rgb(111, 80, 248);}
    #paging li.on a {color: white;}

    /* 검색 */
    #searchForm{float:right;}
    #searchForm>*{float:left;}
    select{
        width: 70px;
        border: 1px solid rgb(202, 199, 199);
        height: 30px;
        border-radius: 5px;
        cursor: pointer;
    }
    .text{
        width: 190px;
        border: 1px solid rgb(202, 199, 199);
        height: 30px;
        border-radius: 5px;
    }
    .text>div{height:100%; float:left;}
    .text button, .text input{
        height:100%;
        box-sizing:border-box;
        border:none;
        background:none;
        cursor:pointer;
    }
</style>
</head>
<body>
	<jsp:include page="boardMenubar.jsp"/>
    <script>
        document.getElementsByClassName("menus")[1].className += ' clicked';
    </script>
    <div class="boardOuter"> 
        <div align="right">
            <a href="" class="btn" id="write">글쓰기</a>
        </div>
        <br>
        <table class="table">
            <thead class="thead-light">
              <tr>
                <th style="width:50px;">번호</th>
                <th style="width:500px;">제목</th>
                <th>작성일</th>
                <th style="width:70px;">조회수</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>10</td>
                <td>익명게시판 제목</td>
                <td>2023-02-16</td>
                <td>100</td>
              </tr>
              <tr>
                <td>9</td>
                <td>익명게시판 제목</td>
                <td>2023-02-15</td>
                <td>50</td>
              </tr>
            </tbody>
        </table>
        
		<form id="searchForm" action="" method="Get">
            <div class="select">
                <select name="condition">
                    <option value="all">전체</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </div>
            <div class="text">
                <div id="search-text">
                    <input type="text" name="keyword" placeholder="&nbsp;검색어를 입력하세요">
                </div>
                <div id="search-btn">
                    <button type="submit"><img src="resource/images/search.png" height="25px" width="25px"></button>
                </div>
            </div>
        </form>
        <div id="paging">
            <ul>
                <li><a href="#"><</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">></a></li>
            </ul>
        </div>
    </div>

</body>
</html>