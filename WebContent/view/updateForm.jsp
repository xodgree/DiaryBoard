<!-- update form 
- view.jsp에서 넘어온 num을 가지고 조회를 하여 값을 받아서 각각에 넣어줌. 
- input하여 사용자에게 수정을 받음
- 입력을 누르면 updatePro.jsp로  감.
- 갈때 post로 입력받은거 다 갖고 감.
 -->
 
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
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	DiaryDBBean dbcon = new DiaryDBBean();
	DiaryDataBean diary = dbcon.viewDiary(num);
%>
<body>
<div class = "w3-card">
<div class = "w3-container w3-teal" > <h1>일기수정</h1> </div>
<!-- post방식으로 writePro에 파라미터를 보냅니다. -->
	<form class = "w3-container" method="post" action="updatePro.jsp">
		<input type = "hidden" name = "num" value = "<%=num %>">
		<p>                          
			<label>일기 제목: </label>
			<input type = "text" name = "title" value = "<%=diary.getTitle() %>"> 
		</p>
		<p>
			<label>일기 내용: </label>  
			<input type = "text" name = "content" value = "<%= diary.getContent() %>"> 
		</p>
		
		<P>
		<input type = "submit" value="수정">
		&nbsp;&nbsp;
		<input type = "reset" value = "취소">
		&nbsp;&nbsp;
		<input type = "button" value="목록" onclick = "document.location.href='list.jsp'"/>
		&nbsp;&nbsp;
		</P>
	</form>
</div>
</body>
</html>