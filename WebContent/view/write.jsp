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
<div class = "w3-container w3-teal" > <h1>����� ����</h1> </div>
<!-- post������� writePro�� �Ķ���͸� �����ϴ�. -->
	<form class = "w3-container" method="post" action="writePro.jsp">
	
		<p>                          
			<label>�ϱ� ����: </label>
			<input type = "text" name = "title"> 
		</p>
		<p>
			<label>�ϱ� ����: </label>  
			<input type = "text" name = "content"> 
		</p>
		
		<P>
		<input type = "submit" value="�ϱ��ۼ�">
		</P>
	</form>
</div>
</body>
</html>