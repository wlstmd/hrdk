<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
html, body, .header h2, .nav h3 {
	padding: 0;
	margin: 0;
}

.header {
	background-color: gray;
	color: white;
	height: 50px;
	padding-top: 10px;
	text-align: center;
}

.nav {
	background-color: silver;
}

a {
	text-decoration: none;
	color: white;
}
</style>
</head>
<body>
	<div class="header">
		<h2>쇼핑몰 회원관리 ver 1.0</h2>
	</div>
	<div class="nav">
		<h3>
			&emsp;&emsp;&emsp;<a href="guest_join.jsp">회원등록</a>
			&emsp;&emsp;&emsp;<a href="guest_list.jsp">회원목록조회/수정</a>
			&emsp;&emsp;&emsp;<a href="guest_sales_list.jsp">회원매출조회</a>
			&emsp;&emsp;&emsp;<a href="index.jsp">홈으로.</a>
		</h3>
	</div>
</body>
</html>