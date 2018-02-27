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
<!-- updateForm에서 넘겨준 값을 받고 db에 연결하여 값을 업데이트한 후 redirect로 list.jsp 돌아감  -->
<%request.setCharacterEncoding("euc-kr"); %>

<!-- useBean을 하면 넘어온 파라미터를 DriaryDataBean에 객체 생성 후 쏙쏙쏙 넣어줌? -->
<jsp:useBean id="diary" class= "board.DiaryDataBean">	
	<jsp:setProperty name = "diary" property="*"/>
</jsp:useBean>
<!-- DiaryDBBean 객체 생성후 업데이트 메소드 실행 하고 list.jsp로 들어감 -->
<%
DiaryDBBean dbControl = new DiaryDBBean();
dbControl.update(diary);
response.sendRedirect("list.jsp");
%>
</body>
</html>