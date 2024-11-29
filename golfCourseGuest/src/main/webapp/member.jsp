<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<h2 align="center">회원정보조회</h2>
		<table border="1">
			<thead>
				<tr>
					<th>수강월</th>
					<th>회원번호</th>
					<th>회원명</th>
					<th>강의명</th>
					<th>강의장소</th>
					<th>수강료</th>
					<th>등급</th>
				</tr>
			</thead>
			<tbody>
				<%
				try {
					Connection con = Connect.getConnection();
					Statement stmt = con.createStatement();

					request.setCharacterEncoding("UTF-8");

					String sql = "SELECT c.REGIST_MONTH, m.C_NO, m.C_NAME, t.CLASS_NAME, c.CLASS_AREA, c.TUITION, m.GRADE " +
				             	 "FROM TBL_CLASS_202201 c " +
				             	 "JOIN TBL_MEMBER_202201 m ON c.C_NO = m.C_NO " +
				             	 "JOIN TBL_TEACHER_202201 t ON c.TEACHER_CODE = t.TEACHER_CODE " +
				             	 "ORDER BY c.REGIST_MONTH ASC";

					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) {
						String regist_month = rs.getString(1);
						String originDate = rs.getString("regist_month");
						String formattedDate = originDate.substring(0, 4) + "년" + originDate.substring(4, 6) + "월";
						
						String c_no = rs.getString(2);
						String c_name = rs.getString(3);
						String class_name = rs.getString(4);
						String class_area = rs.getString(5);
						String tuition = rs.getString(6);
						int originPrice = rs.getInt("tuition");
						String formattedPrice = String.format("\\%,d", originPrice);
						
						String grade = rs.getString(7);
				%>
				<tr>
					<td><%=formattedDate%></td>
					<td><%=c_no%></td>
					<td><%=c_name%></td>
					<td><%=class_name%></td>
					<td><%=class_area%></td>
					<td><%=formattedPrice%></td>
					<td><%=grade%></td>
				</tr>
				<%
				}
				rs.close();
				stmt.close();
				con.close();
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</tbody>
		</table>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>