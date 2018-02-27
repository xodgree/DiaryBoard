
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
<!-- view.jsp에서 넘어온 num파라미터를 받고 메소드 실행시켜서 DB로 보내서 쿼리날리고 list.jsp로 리다이렉트 -->
<% 
int num = Integer.parseInt(request.getParameter("num"));
	DiaryDBBean dbcon = new DiaryDBBean();
	dbcon.delete(num);
	response.sendRedirect("list.jsp");
%>
</body>
</html>