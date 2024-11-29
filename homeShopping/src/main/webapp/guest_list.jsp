<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h2 align="center">회원목록조회/수정</h2>
	<table align="center" border="1">
		<tr>
			<td align="center" width="100">회원번호</td>
			<td align="center" width="100">회원성명</td>
			<td align="center" width="120">전화번호</td>
			<td align="center" width="300">주소</td>
			<td align="center" width="120">가입일자</td>
			<td align="center" width="120">고객등급</td>
			<td align="center" width="120">거주지역</td>
		</tr>
		<%
		Connection con = Connect.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String sql = "select custno, custname, phone, address, TO_CHAR(joindate, 'YYYY-MM-DD') as joindate, grade, city from member_tbl_02";
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
			String custno = rs.getString(1);
			String custname = rs.getString(2);
			String phone = rs.getString(3);
			String address = rs.getString(4);
			String joindate = rs.getString(5);
			String grade = rs.getString(6);
			switch (grade) {
			case "A":
				grade = "VIP";
				break;
			case "B":
				grade = "일반";
				break;
			case "C":
				grade = "직원";
				break;
			}
			String city = rs.getString(7);
		%>
		<tr>
			<td align="center"><a href="guest_edit.jsp?custno=<%=custno%>"><%=custno%></a></td>
			<td align="center"><%=custname%></td>
			<td align="center"><%=phone%></td>
			<td align="center"><%=address%></td>
			<td align="center"><%=joindate%></td>
			<td align="center"><%=grade%></td>
			<td align="center"><%=city%></td>
		</tr>
		<%
		}
		con.close();
		stmt.close();
		rs.close();
		%>
	</table>
	<%@ include file="footer.jsp"%>
</body>
</html>