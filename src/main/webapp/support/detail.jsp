<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="container">
    <div class="row">
        <table class="table">
            <tr>
                <td width="80%">
                    <h3>${vo.subject}</h3>
                </td>
                <td width="20%">
                    ${vo.dbday}
                </td>
            </tr>
            <tr>
                <td>
                    <textarea readonly style="min-height:300px; width:100%; overflow:auto; white-space:pre-wrap; 
                    word-wrap:break-word; resize:none;"
                    >${vo.content}
                    </textarea>
                </td>
            </tr>
        </table>
    </div>
</section>
</body>
</html>