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
<div class = "w3-container w3-teal" > <h1>�ϱ����</h1> </div>
<!-- �Ѿ�� num�� �����͸� �޾Ƽ� input�� value�� �ִ´�. -->
<%
	int num = Integer.parseInt(request.getParameter("num"));
	DiaryDBBean dbcontrol = new DiaryDBBean();
	DiaryDataBean diary =  dbcontrol.viewDiary(num);
%>

<!-- ������ ������ updatePro�� ���� �Ķ���� num�� ����������. -> post�� input�� ���� �� ������. -->
<form class = "w3-container" method="post" action="updatePro.jsp" >
	<!-- num��  ����ڿ��� �Է¹޴°� �ƴϴϱ� hidden���� �� �޾Ƽ� ������ -->
	<input type="hidden" name ="num" value ="<%=num%>">
		<p>                          
			<label>�ϱ� ����: </label>
			<input type = "text" name = "title" value = "<%=diary.getTitle() %>"> 
		</p>
		<p>
			<label>�ϱ� ����: </label>  
			<input type = "text" name = "content" value = "<%=diary.getContent() %>"> 
		</p>
		
		<P>
		<input type = "submit" value="����"/> 
		&nbsp;&nbsp;
		<input type = "reset" value="�ٽ��ۼ�"/>
		&nbsp;&nbsp;
		<input type = "button" onclick="location.href = 'list.jsp'" value="���"/>
		&nbsp;&nbsp;
		</P>
	</form>
</div>
</body>
</html>