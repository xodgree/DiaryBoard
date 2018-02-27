<%@page import="board.DiaryDataBean"%>
<%@page import="board.DiaryDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<div class = "w3-card">
<div class = "w3-container w3-teal" > <h1>일기수정</h1> </div>
<!-- 넘어온 num의 데이터를 받아서 input의 value에 넣는다. -->
<%
	int num = Integer.parseInt(request.getParameter("num"));
	DiaryDBBean dbcontrol = new DiaryDBBean();
	DiaryDataBean diary =  dbcontrol.viewDiary(num);
%>

<!-- 수정을 누르고 updatePro로 갈때 파라미터 num을 가져가야함. -> post로 input에 쓴것 다 가져감. -->
<form class = "w3-container" method="post" action="updatePro.jsp" >
	<!-- num은  사용자에게 입력받는게 아니니까 hidden으로 값 받아서 가져옴 -->
	<input type="hidden" name ="num" value ="<%=num%>">
		<p>                          
			<label>일기 제목: </label>
			<input type = "text" name = "title" value = "<%=diary.getTitle() %>"> 
		</p>
		<p>
			<label>일기 내용: </label>  
			<input type = "text" name = "content" value = "<%=diary.getContent() %>"> 
		</p>
		
		<P>
		<input type = "submit" value="수정"/> 
		&nbsp;&nbsp;
		<input type = "reset" value="다시작성"/>
		&nbsp;&nbsp;
		<input type = "button" onclick="location.href = 'list.jsp'" value="목록"/>
		&nbsp;&nbsp;
		</P>
	</form>
</div>
</body>
</html>