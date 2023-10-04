<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>자유게시판 작성하기</title>
		<style>
		  td {
		      padding : 2px;
		  }
		</style>
	</head>
	<body>
		<%@ include file = "../common/menubar.jsp" %>
		<div class="outer" id="content">
			<div style="height: 250px"></div>
			<form enctype="multipart/form-data" action="<%=contextPath%>/insert.fb" method="post">
				<table class="table table-borderless table-sm" align="center" style="width: 50%">
					<thead>
						<tr>
							<th width="100"></th>
							<th width="100"></th>
							<th width="100"></th>
							<th width="100"></th>
							<th width="100"></th>
							<th width="100"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3">
								<div class="input-group input-group-sm">
									<div class="input-group-prepend">
										<span
											class="input-group-text"
											data-toggle="tooltip"
											title="닉네임을 입력해주세요."
											>닉네임</span
										>
									</div>
									<input type="text" class="form-control" name="nickname" />
								</div>
							</td>
							<td colspan="3">
								<div class="input-group input-group-sm">
									<div class="input-group-prepend">
										<span
											class="input-group-text"
											data-toggle="tooltip"
											title="비밀번호를 잊어버리면 글 수정 및 삭제가 불가능합니다."
											>비밀번호</span
										>
									</div>
									<input type="password" class="form-control" name="password" />
								</div>
							</td>
						</tr>
						 <tr>
                            <td colspan ="6">
                                   <div class="input-group">
                                        <div class="input-group-prepend">
                                         <span class="input-group-text">제목</span>
                                         </div>
                                        <input type="text" class="form-control" name="title">
                                    </div>
                            </td>
                           </tr>
						<tr>
							<td colspan="6">
								<div class="form-group">
									<label for="comment">글 작성: </label>
									<textarea class="form-control" rows="10" id="article" name="content"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="customFile" />
									<label class="custom-file-label" for="customFile">파일 첨부</label>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<button type="submit" class="btn btn-primary btn-block">작성글 등록</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<%@ include file = "../common/footer.jsp" %>
		<script>
			$(() => {
				$('[data-toggle="tooltip"]').tooltip();
				$(".custom-file-input").on("change", function () {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
				});
			});
		</script>
	</body>
</html>
