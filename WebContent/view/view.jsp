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
<%
 int num = Integer.parseInt(request.getParameter("num"));
 DiaryDBBean dbcontrol = new DiaryDBBean();
DiaryDataBean diary =  dbcontrol.viewDiary(num);

%>
<script type="text/javascript" language="javascript">
function btn_js_confirm_click(num){
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
	<div class = "w3-container">
		<p>                          
			�ϱ� ����: <%= diary.getTitle() %>
		</p>
		<p>
			�ϱ� ����: <%=diary.getContent()  %>
		</p>
		
		<P>
		<!-- ���� �������� �̵��� �� num ������ -->
		<input type="button" onclick="document.location.href='updateForm.jsp?num=<%= num %>'" value="����" />
		&nbsp;&nbsp;
		<!-- ���� �������� �̵��Ҷ� num�� ���� ���� ��. -->
		<input type="button" name="btn_js_confirm" id="btn_js_confirm" onclick="btn_js_confirm_click(<%= num %>);" value="����" />
		&nbsp;&nbsp;
		<button type="button" onclick="location.href = 'list.jsp'">���</button>
		&nbsp;&nbsp;
		</P>
	</div>
</div>

</body>
</html>