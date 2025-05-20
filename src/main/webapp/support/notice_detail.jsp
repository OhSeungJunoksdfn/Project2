<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="container fecb shadow ml-2 r-12">
    <div class="row">
        <table class="table">
        	<thead>
            <tr>
                <th width="80%" class="align-middle">
                    <h3>${vo.subject}</h3>
                </th>
                <th width="20%" class="align-middle">
                    ${vo.dbday}
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="2">
                    <pre  style="min-height:300px; width:100%; overflow:auto; white-space:pre-wrap; word-wrap:break-word; "
                    >${vo.content}
                    </pre>
                </td>
            </tr>
            <tr>
            	<td colspan="2" class="text-right">
            		<input type="button" value="목록" class="btn btn-primary r-12" onclick="javascript:history.back()" >
            	</td>
            </tr>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>