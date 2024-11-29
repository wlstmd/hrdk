<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
html, body, header h2{
	padding: 0;
	margin: 0;
}

header {
	background-color: black;
	color: white;
	height: 100px;
	padding-top: 10px;
	text-align: center;
    line-height: 85px;
}

nav {
	background-color: gray;
	height: 50px; 
	display: flex;
	align-items: center;
}

a {
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
	<header>
		<h2>골프연습장 회원관리 프로그램 ver 1.0</h2>
	</header>
	<nav>
		<h3>
				 &emsp;<a href="teacher.jsp">강사조회</a> 
			&emsp;&emsp;<a href="insert.jsp">수강신청</a> 
			&emsp;&emsp;<a href="member.jsp">회원정보조회</a> 
			&emsp;&emsp;<a href="result.jsp">강사매출현황</a>
			&emsp;&emsp;<a href="index.jsp">홈으로</a>
		</h3>
	</nav>
</body>
</html>