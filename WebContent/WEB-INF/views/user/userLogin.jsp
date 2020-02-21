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
	$j(document).ready(function() {
		$j("#submit").on("click",function() {
			if(formIdCheck()&&formPwCheck()){
				location.href="/board/boardList.do";
			}
		});
	
	});
	
	function formIdCheck() {
		var id = $j("#userId");
		var param = id.serialize();
		var r="";
		$j.ajax({
			url : "/user/userIdCheck.do",
			dataType : "json",
			type : "POST",
			data : param,
			async :false,
			success : function(data, textStatus, jqXHR) {
				if (data.duplicated == 0) {
					r=true;
				} else {
					alert("���� ID �Դϴ�.");
					r=false;
				}

			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("����");
				r=false;
			}
		});
		return r;

	}
	function formPwCheck() {
		var $frm = $j(':input');
		var param = $frm.serialize();
		alert(param);
		var r="";
		$j.ajax({
			url : "/user/userPwCheck.do",
			dataType : "json",
			type : "POST",
			data : param,
			async :false,
			success : function(data, textStatus, jqXHR) {
				if (data.success == 1) {
					r=true;
				} else {
					alert("��ġ�ϴ� id pw�� �����ϴ�");
					r=false;
				}

			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("����");
				r=false;
			}
		});
		return r;

	}
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