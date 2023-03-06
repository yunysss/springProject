<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script>
  $(function(){
      $('#summernote').summernote({
          height: 200,                 // 에디터 높이
          minHeight: 400,             // 최소 높이
          maxHeight: 300,             // 최대 높이
          lang: "ko-KR",					// 한글 설정
          placeholder: '내용을 입력해주세요.'	//placeholder 설정
      });
  });
</script>
<style>
	/* table 스타일 */
    td{padding-bottom:5px;}

    /* input 스타일 */
    input[type=text], #upfileList{
        width: 1200px;
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
    }
    #noticeTitle{height:30px;}
    input[type=checkbox]{
        width:10px;
        height:10px;
        margin-right:5px;
    }

    /* upfile 스타일 */
    #upfileList{
        height: 70px;
        padding:5px;
        overflow: auto;
    }

    /* button 스타일 */
    #upfile-btn{
        color:white;
        height:25px;
        width:60px;
        border:none;
        border-radius: 3px;
        padding:0;
        background: rgb(190, 190, 190);
    }

    #cancel-btn, #enroll-btn{
        background: rgb(190, 190, 190);
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
    }
    #enroll-btn{background: rgb(111, 80, 248);}
    
    button:hover{opacity: 0.7;}
</style>
</head>
<body>
	
	<jsp:include page="boardMenubar.jsp"/>

	<script>
        document.getElementsByClassName("menus")[0].className += ' clicked';
    </script>
    
    <div class="boardOuter">
        <br><h5><b>공지사항 작성</b></h5><br>
        <form action="" method="post" enctype="">
            <table>
                <tr>
                    <td>제목</td>
                    <td width="700"><input type="text" id="noticeTitle" name="" placeholder="제목을 입력해주세요." required></td>
                </tr>
                <tr>
                    <td>
                        첨부파일
                        <img src="resource/images/down-arrow.png" height="15px" width="15px" class="fileView" data-toggle="collapse" data-target="#upfileList">
                    </td>
                    <td>
                        <button type="button" id="upfile-btn">파일 첨부</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div id="upfileList" class="collapse">
                            noticeFile.pdf <br>
                            noticeFile2.pdf
                        </div> 
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;">내용</td>
                    <td>
                        
                        <textarea id="summernote" name="" class="require" required></textarea>
                    
                    
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="checkbox" id="important" name="">
                        <label for="important">중요</label>
                    </td>
                </tr>
            </table>
            <div align="center">
                <button type="button" class="btn" id="cancel-btn">취소</button>
                <button type="submit" class="btn" id="enroll-btn">작성</button>
            </div>
        </form>
    </div> 
    <script>
        $(".fileView").click(function(){
            if($(this).attr("src") == "resource/images/down-arrow.png"){
                $(this).attr("src", "resource/images/up-arrow.png");
            } else{
                $(this).attr("src", "resource/images/down-arrow.png");
            }
        })
    </script>

</body>
</html>