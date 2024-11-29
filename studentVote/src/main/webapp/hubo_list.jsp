<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section style="min-height: 400px;">
		<h2 align="left">후보조회</h2>
		<table border="1" width="650px;">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>반</td>
				<td>파트너</td>
				<td>학력</td>
				<td>주민번호</td>
				<td>전공학년반</td>
				<td>전화번호</td>
			</tr>
			<%
			try {
				Connection con = Connect.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = null;

				String sql = "select no, name, p_class, p_partner, school, jumin, major, p_tel1, p_tel2, p_tel3 "
				+ "from tbl_register r join tbl_partner p on r.code = p.p_code order by no asc";
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String no = rs.getString(1);
					String name = rs.getString(2);
					String p_class = rs.getString(3);
					String p_partner = rs.getString(4);
					String school = rs.getString(5);
					switch (school) {
					case "1": {
				school = "중졸";
				break;
					}
					case "2": {
				school = "고졸";
				break;
					}
					case "3": {
				school = "전문대졸";
				break;
					}
					case "4": {
				school = "대졸";
				break;
					}
					case "5": {
				school = "석사수료";
				break;
					}
					case "6": {
				school = "석사취득";
				break;
					}
					case "7": {
				school = "박사수료";
				break;
					}
					case "8": {
				school = "박사취득";
				break;
					}
					}
					String jumin = rs.getString(6);
					jumin = jumin.substring(0, 6) + "-" + jumin.substring(6);
					String major = rs.getString(7);
					String phone = rs.getString(8) + "-" + rs.getString(9) + "-" + rs.getString(10);
			%>
			<tr>
				<td><%=no%></td>
				<td><%=name%></td>
				<td><%=p_class%></td>
				<td><%=p_partner%></td>
				<td><%=school%></td>
				<td><%=jumin%></td>
				<td><%=major%></td>
				<td><%=phone%></td>
			</tr>
			<%
			}
			stmt.close();
			con.close();
			rs.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</table>
		&emsp;&emsp;&emsp;<a href="index.jsp">홈으로</a>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>