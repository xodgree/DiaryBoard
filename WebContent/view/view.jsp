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
	<div class = "w3-container">
		<p>                          
			일기 제목: <%= diary.getTitle() %>
		</p>
		<p>
			일기 내용: <%=diary.getContent()  %>
		</p>
		
		<P>
		<!-- 수정 페이지로 이동할 때 num 가져감 -->
		<input type="button" onclick="document.location.href='updateForm.jsp?num=<%= num %>'" value="수정" />
		&nbsp;&nbsp;
		<!-- 삭제 페이지로 이동할때 num도 같이 갖고 감. -->
		<input type="button" name="btn_js_confirm" id="btn_js_confirm" onclick="btn_js_confirm_click(<%= num %>);" value="삭제" />
		&nbsp;&nbsp;
		<button type="button" onclick="location.href = 'list.jsp'">목록</button>
		&nbsp;&nbsp;
		</P>
	</div>
</div>

</body>
</html>