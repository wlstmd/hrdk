<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원 등록</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div align="center">
		<h2>홈쇼핑 회원 등록</h2>
		<%
		Connection con = Connect.getConnection();
		Statement stmt = con.createStatement();

		String sql = "select custno from member_tbl_02 order by custno desc";

		ResultSet rs = stmt.executeQuery(sql);

		rs.next();

		int No = Integer.parseInt(rs.getString(1)) + 1;
		%>
		<form name="frm1" action="guest_join_ok.jsp" method="post">
			<table width="620" border="1">
				<tr>
					<td width="40%" align="center">회원번호(자동발생)</td>
					<td width="60%" align="left"><input type="text"
						value="<%=No%>" size="10" maxlength="6" name="custno"></input></td>
				</tr>
				<tr>
					<td width="40%" align="center">회원성명</td>
					<td width="60%" align="left"><input type="text" size="10"
						maxlength="20" name="custname"></input></td>
				</tr>
				<tr>
					<td width="40%" align="center">회원전화</td>
					<td width="60%" align="left"><input type="text" size="20"
						maxlength="13" name="phone"></input></td>
				</tr>
				<tr>
					<td width="40%" align="center">회원주소</td>
					<td width="60%" align="left"><input type="text" size="30"
						maxlength="60" name="address"></input></td>
				</tr>
				<tr>
					<td width="40%" align="center">가입일자</td>
					<td width="60%" align="left"><input type="text" size="10"
						maxlength="8" name="joindate"></input></td>
				</tr>
				<tr>
					<td width="40%" align="center">고객등급[A:VIP,B:일반,C:직원]</td>
					<td width="60%" align="left"><input type="text" size="10"
						maxlength="1" name="grade"></input></td>
				</tr>
				<tr>
					<td width="40%" align="center">도시코드</td>
					<td width="60%" align="left"><input type="text" size="10"
						maxlength="2" name="city"></input></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input
						style="margin-right: 2px" type="button" value="등록"
						onclick="valid_check()"> <input type="button" value="조회"
						onclick="location.href='guest_list.jsp'"></td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
	<script type="text/javascript">
		function valid_check() {
			if (document.frm1.custno.value == "") {
				alert("회원번호가 입력되지 않았습니다");
				document.frm1.custno.focus();
				return false;
			} else if (document.frm1.custname.value == "") {
				alert("회원성명이 입력되지 않았습니다");
				document.frm1.custname.focus();
				return false;
			} else if (document.frm1.phone.value == "") {
				alert("회원전화가 입력되지 않았습니다");
				document.frm1.phone.focus();
				return false;
			} else if (document.frm1.address.value == "") {
				alert("회원주소가 입력되지 않았습니다");
				document.frm1.address.focus();
				return false;
			} else if (document.frm1.joindate.value == "") {
				alert("가입일자가 입력되지 않았습니다");
				document.frm1.joindate.focus();
				return false;
			} else if (document.frm1.grade.value == "") {
				alert("고객등급이 입력되지 않았습니다");
				document.frm1.grade.focus();
				return false;
			} else if (document.frm1.city.value == "") {
				alert("도시코드가 입력되지 않았습니다");
				document.frm1.city.focus();
				return false;
			} else
				document.frm1.submit();
		}
	</script>
	<%@ include file="footer.jsp"%>
</body>
</html>