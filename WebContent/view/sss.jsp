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
<div class = "w3-container w3-teal" > <h1>�ϱ����</h1> </div>
<!-- 
������ ���� ���������� get�Ͽ� �ް�, input���� ���� ����
 post������κ�����, num�� �Բ� �ѱ��.
 �ٸ�������δ� ���ܼ� ���������� �ִ�.(hide) ������ ���� Pro���� ����ü�� <jsp:bean>�� �̿��Ͽ� �޾Ƽ� �����ϱ� �Ķ���ͷ� num�� ���� �����ʿ䰡 ����. 
-->
	<form class = "w3-container" method="post" action="updatePro.jsp">
		<input type = "hidden" name = "num" value=" <%= num %>">
		<p>                          
			<label>�ϱ� ����: </label>
			<input type = "text" name = "title" value=" <%= diary.getTitle()%>"> 
		</p>
		<p>
			<label>�ϱ� ����: </label>  
			<input type = "text" name = "content" value="<%=diary.getContent() %>">
		</p>
		
		<P>
		<input type = "submit" value="����"/>
		&nbsp;&nbsp;
		<input type = "reset" value="���"/>
		&nbsp;&nbsp;
		<input type = "button" value="���" onclick="document.location.href='list.jsp'"/>
		&nbsp;&nbsp;
		
		</P>
	</form>
</div>
</body>
</html>