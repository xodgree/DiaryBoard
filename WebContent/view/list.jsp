<%@page import="board.DiaryDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.DiaryDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


<!-- �����ͺ��̽� �����մϴ�.
�����ͺ��̽����� �ϱ���� �޽��ϴ�. -->
<%
	//DiaryDBBean�� �޼ҵ带 ���� ���Ͽ� ��ü�� ����ϴ�.
	DiaryDBBean dbDiarys = new DiaryDBBean();
	
	/* DB�� �����ϰ� �����͸� �����ɴϴ�. ������ �����ʹ� DiaryDataBean type�� arrayList Diarys�Դϴ�. 
	Diarys���� DiaryDataBean ��ü���� DB�� ������ �� ��ŭ ����ֽ��ϴ�. 
	return�� Diarys�� ����ϱ� ���Ͽ� Diarys������ ����ݴϴ�.  
	*/
	ArrayList<DiaryDataBean> diarys = dbDiarys.getDiarys();

%>

<title>Insert title here</title>
</head>
<body>

<h1>�ϱ� ����Ʈ</h1>
	<table>
		<tr> 
			<th>No</th>
			<th>�ϱ�����</th>
			<th>��¥</th>
		</tr>
		<!-- �ϱ�� ����մϴ�. -->
		<% 
			// diary���� DiaryDataBean ��ü �Ѱ��� �������� ��.
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
	<a href="write.jsp">�ϱ⾲��</a>
</body>
</html>