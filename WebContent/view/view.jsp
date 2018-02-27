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
<!-- 1.list.jsp에서 num을 받아서 
	2. DiaryDBBean에 view 메소드를 만들고
	3. DiaryDBBean 객체를 만든다음 form에 num에 맞는 데이터를 뿌림. 
	-->
<%
int num = Integer.parseInt(request.getParameter("num"));
DiaryDBBean dbcontrol = new DiaryDBBean();
DiaryDataBean diary =  dbcontrol.viewDiary(num);
%>

<script type="text/javascript" >
function   check(num) {
	 /* confirm(문자열, 초기값) */
	  var check = confirm("일기를 지우시겠습니까?");
	  /* if(check == true) else false */
	  if(check){
		  /* 삭제 메소드를 호출시켜 db에서 삭제한 후 list.jsp로 돌아감.*/
		  window.location.href="deletePro.jsp?num=" + num; 
	  }else{
		  
	  }
}
	
</script>

<div class = "w3-card">
<div class = "w3-container w3-teal" > <h1>일기보기</h1> </div>
	<form class="w3-container">
		<p>                          
			<label>일기 제목: <%= diary.getTitle() %></label>
		</p>
		<p>
			<label>일기 내용: <%= diary.getContent() %></label>  
		</p>
		
		<P>
		<input type = "button" value="수정" onclick="document.location.href='updateForm.jsp?num=<%=num%>'"/>
		&nbsp;&nbsp;
		<!-- 삭제 페이지로 갈때 num을 보내야함. -->
		<input type = "button" value="삭제" onclick = "check(<%=num%>)"/>
		&nbsp;&nbsp;
		<input type = "button" value="목록" onclick = "document.location.href='list.jsp'"/>
		&nbsp;&nbsp;
		</P>
	</form>
</div>
</body>
</html>