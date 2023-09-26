<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<body>

    <div class="login-area">
        <form>
            <table>
                <th>아이디</th>
					<td><input type="text" name="userId" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="userPwd" required></td>
				</tr>
				<tr>
					<th colspan="2">
					<button type="submit" class="btn btn-sm btn-info">로그인</button>
					<button type="button" onclick="enrollPage();" class="btn btn-sm btn-info">회원가입</button>
            </table>
        </form>


    </div>

	

</body>
</html>