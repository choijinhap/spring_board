<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login</title>
</head>
<script type="text/javascript">

</script>
<body>
	<form class="userLogin" name="login" method="post">

		<table border="1" align="center">
			<tr>
				<td>id</td>
				<td><input type="text" size="20" name="userId" id="userId"></td>
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" maxlength="12" size="20" name="userPw" id="userPw"></td>
			</tr>
			
			<tr>
				<td align="right"><input id="submit" type="button" value="login">
				</td>
			</tr>
		</table>
	</form>


</body>
</html>