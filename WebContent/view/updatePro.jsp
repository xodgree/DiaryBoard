<%@page import="board.DiaryDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- updateForm���� �Ѱ��� ���� �ް� db�� �����Ͽ� ���� ������Ʈ�� �� redirect�� list.jsp ���ư�  -->
<%request.setCharacterEncoding("euc-kr"); %>

<!-- useBean�� �ϸ� �Ѿ�� �Ķ���͸� DriaryDataBean�� ��ü ���� �� ���� �־���? -->
<jsp:useBean id="diary" class= "board.DiaryDataBean">	
	<jsp:setProperty name = "diary" property="*"/>
</jsp:useBean>
<!-- DiaryDBBean ��ü ������ ������Ʈ �޼ҵ� ���� �ϰ� list.jsp�� �� -->
<%
DiaryDBBean dbControl = new DiaryDBBean();
dbControl.update(diary);
response.sendRedirect("list.jsp");
%>
</body>
</html>