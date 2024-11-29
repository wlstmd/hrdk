<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보등록</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h3>후보등록</h3>
	<form name="frm1" method="post" action="hubo_join_ok.jsp">
		<table width="620" border="1" style="border-collapse: collapse;">
			<tr>
				<td width="40%" align="left">후보번호</td>
				<td width="60%" align="left">
				<input type="text" size="5" maxlength="1" name="no"></td>
			</tr>
			<tr>
				<td width="40%" align="left">이름</td>
				<td width="60%" align="left">
				<input type="text" size="15" maxlength="20" name="name"></td>
			</tr>
			<tr>
				<td width="40%" align="left">팀번호</td>
				<td width="60%" align="left">
				<select name="p_code">
						<option value="">==팀번호를 선택하세요==</option>
						<option value="P1">1반</option>
						<option value="P2">4반</option>
						<option value="P3">6반</option>
						<option value="P4">7반</option>
						<option value="P5">9반</option>
				</select></td>
			</tr>
			<tr>
				<td width="40%" align="left">학력</td>
				<td width="60%" align="left">
				<select name="school">
						<option value="">==학력을 선택하세요==</option>
						<option value="1">중졸</option>
						<option value="2">고졸</option>
						<option value="3">전문대졸</option>
						<option value="4">대졸</option>
						<option value="5">석사수료</option>
						<option value="6">석사취득</option>
						<option value="7">박사수료</option>
						<option value="8">박사취득</option>
				</select></td>
			</tr>
			<tr>
				<td width="40%" align="left">주민번호</td>
				<td width="60%" align="left">
				<input type="text" size="8" maxlength="6" name="jumin1"> - 
				<input type="text" size="8" maxlength="7" name="jumin2"></td>
			</tr>
			<tr>
				<td width="40%" align="left">전공학년반</td>
				<td width="60%" align="left">
				<input type="text" size="15" maxlength="20" name="major"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<input type="button" value="등록" onclick="valid_check()"></td>
			</tr>
		</table>
	</form>
	&emsp;&emsp;&emsp;
	<a href="index.jsp">홈으로</a>
	<%@ include file="footer.jsp"%>

	<script type="text/javascript">
		function valid_check() {
			if (document.frm1.no.value == "") {
				alert('후보번호를 입력하세요.');
				document.frm1.no.focus();
				return false;
			} else if (document.frm1.name.value == "") {
				alert('이름을 입력하세요.');
				document.frm1.name.focus();
				return false;
			} else if (!isNaN(document.frm1.name.value.charAt(0))) {
				alert('이름의 첫 글자는 숫자가 될 수 없습니다.');
				document.frm1.name.focus();
				return false;
			} else if (document.frm1.jumin1.value == "") {
				alert('주민번호를 입력하세요.');
				document.frm1.jumin1.focus();
				return false;
			} else if (document.frm1.jumin2.value == "") {
				alert('주민번호를 입력하세요.');
				document.frm1.jumin2.focus();
				return false;
			} else if (document.frm1.major.value == "") {
				alert('전공학년반을 입력하세요.');
				document.frm1.major.focus();
				return false;
			} else {
				document.frm1.submit();
			}
		}
	</script>
</body>
</html>