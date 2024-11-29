<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h3>투표하기</h3>
	<form name="frm1" action="vote_ok.jsp" method="post">
		<table width="520" border="1">
			<tr>
				<td width="40%" align="left">주민번호</td>
				<td width="60%" align="left"><input type="text" size="20"
					maxlength="13" name="v_jumin">예)0403013000001</td>
			</tr>
			<tr>
				<td width="40%" align="left">성명</td>
				<td width="60%" align="left"><input type="text" size="20"
					maxlength="20" name="v_name"></td>
			</tr>
			<tr>
				<td width="40%" align="left">후보번호</td>
				<td width="60%" align="left"><select name="choice_no">
						<option value="">==후보번호 선택==</option>
						<option value="1">1번</option>
						<option value="2">2번</option>
						<option value="3">3번</option>
						<option value="4">4번</option>
						<option value="5">5번</option>
				</select></td>
			</tr>
			<tr>
				<td width="40%" align="left">투표시간</td>
				<td width="60%" align="left"><input type="text" size="20"
					maxlength="20" name="v_time"></td>
			</tr>
			<tr>
				<td width="40%" align="left">투표장소</td>
				<td width="60%" align="left"><input type="text" size="20"
					maxlength="20" name="v_area"></td>
			</tr>
			<tr>
				<td width="40%" align="left">유권자확인</td>
				<td width="60%" align="left"><input type="radio"
					name="v_confirm" value="Y">확인&nbsp;<input type="radio"
					name="v_confirm" value="N">미확인</td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button"
					value="투표하기" onclick="valid_check()"> <input type="button"
					value="다시쓰기" onclick="reset()"></td>
			</tr>
		</table>
	</form>
	&emsp;&emsp;&emsp;
	<a href="index.jsp">홈으로</a>
	<%@ include file="footer.jsp"%>

	<script type="text/javascript">
		function valid_check() {
			if (document.frm1.v_jumin.value == "") {
				alert('주민번호를 입력하지 않았습니다.')
				document.frm1.v_jumin.focus()
				return false;
			} else if (document.frm1.v_jumin.value.length != 13) {
				alert('주민번호는 13자리')
				document.frm1.v_jumin.focus()
				return false;
			} else if (document.frm1.v_name.value == "") {
				alert('성명을 입력하지 않았습니다.')
				document.frm1.v_jumin.focus()
				return false;
			} else if (document.frm1.choice_no.value == "") {
				alert('후보번호를 선택하지 않았습니다.')
				document.frm1.choice_no.focus()
				return false;
			} else if (document.frm1.v_time.value == "") {
				alert('투표시간을 입력하지 않았습니다.')
				document.frm1.v_time.focus()
				return false;
			} else if (document.frm1.v_area.value == "") {
				alert('투표장소를 입력하지 않았습니다.')
				document.frm1.v_area.focus()
				return false;
			} else if (document.frm1.v_confirm.value == "") {
				alert('유권자확인을 선택하지 않았습니다.')
				document.frm1.v_confirm.focus()
				return false;
			} else {
				document.frm1.submit();
			}
		}
		
		function reset() {
			self.location.href("vote.jsp");
		}
	</script>
</body>
</html>