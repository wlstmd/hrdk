<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest Join Ok</title>
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
		String sql = "INSERT INTO member_tbl_02 VALUES(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);

		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	%>
	<script type="text/javascript">
		alert("회원등록이 완료되었습니다.");
		self.location.href = "index.jsp";
	</script>
	<%
	} catch (Exception e) {
	%>
	<script type="text/javascript">
		alert("회원등록이 실패되었습니다.");
		self.location.href = "guest_join.jsp";
	</script>
	<%
	}
	%>
</body>
</html>