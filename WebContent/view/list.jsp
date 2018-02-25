<%@page import="board.DiaryDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.DiaryDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


<!-- 데이터베이스 접속합니다.
데이터베이스에서 일기글을 받습니다. -->
<%
	//DiaryDBBean의 메소드를 쓰기 위하여 객체를 만듭니다.
	DiaryDBBean dbDiarys = new DiaryDBBean();
	
	/* DB에 접속하고 데이터를 가져옵니다. 가져온 데이터는 DiaryDataBean type의 arrayList Diarys입니다. 
	Diarys에는 DiaryDataBean 객체들이 DB의 데이터 수 만큼 들어있습니다. 
	return된 Diarys를 사용하기 위하여 Diarys변수에 담아줍니다.  
	*/
	ArrayList<DiaryDataBean> diarys = dbDiarys.getDiarys();

%>

<title>Insert title here</title>
</head>
<body>

<h1>일기 리스트</h1>
	<table>
		<tr> 
			<th>No</th>
			<th>일기제목</th>
			<th>날짜</th>
		</tr>
		<!-- 일기글 출력합니다. -->
		<% 
			// diary에는 DiaryDataBean 객체 한개씩 넣으려고 함.
			for(int i = 0; i < diarys.size(); i++){
				DiaryDataBean diary = diarys.get(i);
				%>
			<tr>
				<td><%= diary.getNum() %></td>
				<td><a href ="view.jsp?num=<%= diary.getNum()%>"><%= diary.getTitle() %></a></td>
				<td><%= diary.getRegdate() %></td>
				
			</tr>
			
				
		<% 
			}
		%>
		
		
	</table>
	<a href="write.jsp">일기쓰기</a>
</body>
</html>