<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="w-100 shadow r-12 secb ml-3 p-3" style="min-height:300px">
	<h3>문의하기</h3>
	<table class="table">
		<tbody>
			<tr>
				<th class="align-middle text-center" width=20%>문의유형</th>
				<td width=80% class="input-group">
				<select class=" border text-center"
                   		name="type" required>
            		<option value="" disabled selected>== 문의 유형 ==</option>
            		<option value="자유글">관광지</option>
            		<option value="관광지">렌트카</option>
            		<option value="호텔">호텔</option>
            		<option value="맛집">항공</option>
            		<option value="렌트">기타</option>
          		</select>
         	 </td>
			</tr>
			<tr>
				<th class="align-middle text-center" width=20%>작성자</th>
				<td width=80% >
					${sessionScope.name }
				</td>
			</tr>
			<tr>
				<th class="align-middle text-center"  width=20%>여행패키지</th>
				<td width=80% class="input-group">
				<select class="form-control border text-center r-12"
                   		name="type" required>
            		<option value="" disabled selected>== 여행 패키지 선택 ==</option>
            		
          		</select>
				</td>
			</tr>
			<tr>
				<th class="align-middle text-center" width=20%>제목</th>
				<td width=80% class="input-group" >
					<input type="text" class="form-control r-12" >
				</td>
			</tr>
			<tr>
				<th class="align-middle text-center" width=20%>문의 내용</th>
				<td width=80% class="input-group" >
					<textarea class="r-12 p-2" style="outline: none;resize: none;width:100%;height:200px;border: 1px solid rgb(206, 212, 218);" ></textarea>
				</td>
			</tr>
			
		</tbody>
	</table>
		<div class="col-12 text-right">
          <button type="button" class="btn btn-primary r-12">글쓰기</button>
        </div>
</div>
</body>
</html>