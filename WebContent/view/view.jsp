<%@page import="board.DiaryDBBean"%>
<%@page import="board.DiaryDataBean"%>
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
<!-- 1.list.jsp���� num�� �޾Ƽ� 
	2. DiaryDBBean�� view �޼ҵ带 �����
	3. DiaryDBBean ��ü�� ������� form�� num�� �´� �����͸� �Ѹ�. 
	-->
<%
int num = Integer.parseInt(request.getParameter("num"));
DiaryDBBean dbcontrol = new DiaryDBBean();
DiaryDataBean diary =  dbcontrol.viewDiary(num);
%>

<script type="text/javascript" >
function   check(num) {
	 /* confirm(���ڿ�, �ʱⰪ) */
	  var check = confirm("�ϱ⸦ ����ðڽ��ϱ�?");
	  /* if(check == true) else false */
	  if(check){
		  /* ���� �޼ҵ带 ȣ����� db���� ������ �� list.jsp�� ���ư�.*/
		  window.location.href="deletePro.jsp?num=" + num; 
	  }else{
		  
	  }
}
	
</script>

<div class = "w3-card">
<div class = "w3-container w3-teal" > <h1>�ϱ⺸��</h1> </div>
	<form class="w3-container">
		<p>                          
			<label>�ϱ� ����: <%= diary.getTitle() %></label>
		</p>
		<p>
			<label>�ϱ� ����: <%= diary.getContent() %></label>  
		</p>
		
		<P>
		<input type = "button" value="����" onclick="document.location.href='updateForm.jsp?num=<%=num%>'"/>
		&nbsp;&nbsp;
		<!-- ���� �������� ���� num�� ��������. -->
		<input type = "button" value="����" onclick = "check(<%=num%>)"/>
		&nbsp;&nbsp;
		<input type = "button" value="���" onclick = "document.location.href='list.jsp'"/>
		&nbsp;&nbsp;
		</P>
	</form>
</div>
</body>
</html>