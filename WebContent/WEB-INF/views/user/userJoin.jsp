<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>join</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {
			$j("#submit").on("click",function() {
				if (formIdCheck() && formPwCheck()
					&& formNameCheck()
					&& formPhoneCheck()
					&& formPostNoCheck()) {
				var $frm = $j('.userJoin :input');
				var param = $frm.serialize();
				$j.ajax({
					url : "/user/userJoinAction.do",
					dataType : "json",
					type : "POST",
					data : param,
					success : function(data,textStatus,jqXHR) {
						location.href = "/board/boardList.do";
						},
					error : function(jqXHR,textStatus,errorThrown) {
						alert("실패");
						}
					});
				}
			});

		});

	function idCheck() {
		var id = $j("#userId");
		var param = id.serialize();
		$j.ajax({
			url : "/user/userIdCheck.do",
			dataType : "json",
			type : "POST",
			data : param,
			success : function(data, textStatus, jqXHR) {
				$j("#ckFlag").val(data.duplicated);
				$j("#ckId").val(id.val());
				if (data.duplicated == 0) {
					alert("중복된 id입니다");
				} else {
					alert("사용가능한 id입니다");
				}

			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("실패");
			}
		});

	}

	function formIdCheck() {
		if ($j("#ckFlag").val() == 1
				&& $j("#ckId").val() == $j("#userId").val()) {
			return true;
		} else if ($j("#ckId").val() != $j("#userId").val()) {
			alert("id 중복확인하세요");
			$j("#userId").focus();
			return false;
		} else {
			alert("중복된 id입니다");
			$j("#userId").focus();
			return false;
		}
	}

	function formPwCheck() {
		if ($j("#userPw").val().length < 6) {
			alert("pw길이는 6자 이상이어야합니다.");
			$j("#userPw").focus();
			return false;
		}
		if ($j("#userPw").val() == $j("#userPwCheck").val()) {
			return true;
		} else {
			$j("#userPwCheck").focus();
			alert("pw와 pw check가 다릅니다");
			return false;
		}
	}

	function formNameCheck() {
		if ($j("#userName").val() == "") {
			alert("name을 입력하세요");
			$j("#userName").focus();
			return false;
		} else
			return true;
	}

	function formPhoneCheck() {
		if ($j("#userPhone2").val().length != 4) {
			$j("#userPhone2").focus();
			alert("폰 번호 확인하세요");
			return false;
		} else if ($j("#userPhone3").val().length != 4) {
			$j("#userPhone3").focus();
			alert("폰 번호 확인하세요");
			return false;
		} else
			return true;
	}

	function formPostNoCheck() {
		var postNo = $j("#userAddr1").val();
		if (postNo.length != 7) {
			alert("postno는 6글자여야 합니다.");
			$j("#userAddr1").focus();
			return false;
		} else
			return true;
	}
	function inputPostNo(postNo) {
		var replacePostNo = postNo.value.replace("-", "");

		if (replacePostNo.length >= 6 && replacePostNo.length < 7) {
			var pre = replacePostNo.substring(0, 3);
			var post = replacePostNo.substring(3, 6);

			if (isFinite(pre + post) == false) {
				alert("문자는 입력하실 수 없습니다.");
				postNo.value = "";
				return false;
			}
			postNo.value = pre + "-" + post;
		} else if (replacePostNo.length > 6) {
			alert("6글자여야 합니다");
			var pre = replacePostNo.substring(0, 3);
			var post = replacePostNo.substring(3, 6);

			if (isFinite(pre + post) == false) {
				alert("문자는 입력하실 수 없습니다.");
				postNo.value = "";
				return false;
			}
			postNo.value = pre + "-" + post;
			return false;
		}
	}
</script>
<body>
	<input type="hidden" id="ckFlag" value="0">
	<input type="hidden" id="ckId" value="!@#!@$!@$!@#!@$!@#!">
	<form class="userJoin" name="join" method="post">

		<table align="center">
			<tr>
				<td align="right"><a href="/board/boardList.do">List</a></td>
			</tr>
		</table>
		<table border="1" align="center">
			<tr>
				<td>id</td>
				<td><input type="text" size="20" name="userId" id="userId"><input
					type="button" id="idCk" name="idCk" value="중복확인"
					onclick="javascript:idCheck()"></td>

			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" maxlength="12" size="20"
					name="userPw" id="userPw"></td>
			</tr>
			<tr>
				<td>pw check</td>
				<td><input type="password" maxlength="12" size="20"
					name="userPwCheck" id="userPwCheck"></td>
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" size="20" maxlength="10" name="userName"
					id="userName"></td>
			</tr>
			<tr>
				<td>phone</td>
				<td><select name="userPhone1">
						<c:forEach items="${comcodeList}" var="list">
							<option value="${list.codeId}">${list.codeName}</option>
						</c:forEach>
				</select> <input type="text" size="4" maxlength="4" name="userPhone2"
					id="userPhone2"> <input type="text" size="4" maxlength="4"
					name="userPhone3" id="userPhone3"></td>
			</tr>
			<tr>
				<td>postNo</td>
				<td><input type="text" size="20" maxlength="8" name="userAddr1"
					id="userAddr1" onKeyup="inputPostNo(this);"></td>
			</tr>
			<tr>
				<td>address</td>
				<td><input type="text" size="20" name="userAddr2"
					id="userAddr2"></td>
			</tr>
			<tr>
				<td>company</td>
				<td><input type="text" size="20" name="userCompany"
					id="userCompany"></td>
			</tr>
			<tr>
				<td align="right"><input id="submit" type="button" value="join">
				</td>
			</tr>
		</table>
	</form>


</body>
</html>