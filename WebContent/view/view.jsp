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
<%
 int num = Integer.parseInt(request.getParameter("num"));
 DiaryDBBean dbcontrol = new DiaryDBBean();
DiaryDataBean diary =  dbcontrol.viewDiary(num);

%>
<div class = "w3-card">
<div class = "w3-container w3-teal" > <h1>�ϱ⺸��</h1> </div>
	<div class = "w3-container">
		<p>                          
			�ϱ� ����: <%= diary.getTitle() %>
		</p>
		<p>
			�ϱ� ����: <%=diary.getContent()  %>
		</p>
		
		<P>
		<button type="button">����</button>
		<button type="button">����</button>
		<button type="button">���</button>
		</P>
	</div>
</div>

</body>
</html>