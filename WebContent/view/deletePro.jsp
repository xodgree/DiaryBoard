<%@page import="board.DiaryDBBean"%>
<%@page import="board.DiaryDataBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
/* view���� �Ѿ�� �Ķ���� num�� �ް� 
	DiaryDBBean ��ü�� ���� �Ķ���ͷ� num�� �־ ���� �޼ҵ� ���� �� �������� �̵��Ѵ�.
*/
int num = Integer.parseInt(request.getParameter("num"));
DiaryDBBean dbcontrol = new DiaryDBBean();
dbcontrol.delete(num);
response.sendRedirect("list.jsp");

%>

</body>
</html>