<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원 정보 수정</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h2 align="center">홈쇼핑 회원 정보 수정</h2>
	<%
	String custno = request.getParameter("custno");

	try {
		Connection con = Connect.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String sql = "select custno, custname, phone, address, TO_CHAR(joindate, 'YYYY-MM-DD') as joindate, grade, city from member_tbl_02 where custno='"
		+ custno + "'";
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
			String custname = rs.getString(2);
			String phone = rs.getString(3);
			String address = rs.getString(4);
			String joindate = rs.getString(5);
			String grade = rs.getString(6);
			String city = rs.getString(7);
	%>
	<form name="frm1" action="guest_edit_ok.jsp" method="post">
		<table width="620" border="1" align="center">
			<tr>
				<td width="40%" align="center">회원번호</td>
				<td width="60%" align="left"><input type="text"
					value="<%=custno%>" size="10" maxlength="6" name="custno" readonly /></td>
			</tr>
			<tr>
				<td width="40%" align="center">회원성명</td>
				<td width="60%" align="left"><input type="text" size="10"
					value="<%=custname%>" maxlength="20" name="custname"></input></td>
			</tr>
			<tr>
				<td width="40%" align="center">회원전화</td>
				<td width="60%" align="left"><input type="text" size="20"
					value="<%=phone%>" maxlength="13" name="phone"></input></td>
			</tr>
			<tr>
				<td width="40%" align="center">회원주소</td>
				<td width="60%" align="left"><input type="text" size="30"
					value="<%=address%>" maxlength="60" name="address"></input></td>
			</tr>
			<tr>
				<td width="40%" align="center">가입일자</td>
				<td width="60%" align="left"><input type="text" size="10"
					value="<%=joindate%>" maxlength="8" name="joindate"></input></td>
			</tr>
			<tr>
				<td width="40%" align="center">고객등급[A:VIP,B:일반,C:직원]</td>
				<td width="60%" align="left"><input type="text" size="10"
					value="<%=grade%>" maxlength="1" name="grade"></input></td>
			</tr>
			<tr>
				<td width="40%" align="center">도시코드</td>
				<td width="60%" align="left"><input type="text" size="10"
					value="<%=city%>" maxlength="2" name="city"></input></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input style="margin-right: 2px"
					type="button" value="수정" onclick="valid_check()"> <input
					type="button" value="조회" onclick="location.href='guest_list.jsp'"></td>
			</tr>
		</table>
	</form>
	<%
	}
	rs.close();
	stmt.close();
	con.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
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