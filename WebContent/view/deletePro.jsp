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
/* view에서 넘어온 파라미터 num을 받고 
	DiaryDBBean 객체를 만들어서 파라미터로 num을 넣어서 삭제 메소드 실행 후 메인으로 이동한다.
*/
int num = Integer.parseInt(request.getParameter("num"));
DiaryDBBean dbcontrol = new DiaryDBBean();
dbcontrol.delete(num);
response.sendRedirect("list.jsp");

%>

</body>
</html>