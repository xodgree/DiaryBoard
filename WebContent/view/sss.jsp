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
<% int num = Integer.parseInt(request.getParameter("num"));
	DiaryDBBean dbcon = new DiaryDBBean();
	DiaryDataBean diary = dbcon.viewDiary(num);
%>
<div class = "w3-card">
<div class = "w3-container w3-teal" > <h1>일기수정</h1> </div>
<!-- 
원래의 값은 보여지도록 get하여 받고, input으로 받은 값은
 post방식으로보내고, num도 함께 넘긴다.
 다른방법으로는 숨겨서 가져갈수도 있다.(hide) 가지고 가면 Pro에서 폼전체를 <jsp:bean>을 이용하여 받아서 넣으니까 파라미터로 num을 따로 보낼필요가 없음. 
-->
	<form class = "w3-container" method="post" action="updatePro.jsp">
		<input type = "hidden" name = "num" value=" <%= num %>">
		<p>                          
			<label>일기 제목: </label>
			<input type = "text" name = "title" value=" <%= diary.getTitle()%>"> 
		</p>
		<p>
			<label>일기 내용: </label>  
			<input type = "text" name = "content" value="<%=diary.getContent() %>">
		</p>
		
		<P>
		<input type = "submit" value="수정"/>
		&nbsp;&nbsp;
		<input type = "reset" value="취소"/>
		&nbsp;&nbsp;
		<input type = "button" value="목록" onclick="document.location.href='list.jsp'"/>
		&nbsp;&nbsp;
		
		</P>
	</form>
</div>
</body>
</html>