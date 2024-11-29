<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest Edit Ok</title>
</head>
<body>
	<%
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");

	try {
		Connection con = Connect.getConnection();
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, custno);

		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	%>
	<script type="text/javascript">
		alert("회원정보수정이 완료되었습니다.");
		self.location.href = "guest_list.jsp";
	</script>
	<%
	} catch (Exception e) {
	%>
	<script type="text/javascript">
	alert("회원정보수정이 실패되었습니다.");
	self.location.href = "guest_edit.jsp?custno=<%=custno%>";
	</script>
	<%
	}
	%>
</body>
</html>