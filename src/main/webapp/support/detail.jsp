<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="container fecb shadow ml-2 r-12" id="customerApp">
    <div class="row">
    	<table class="table">
    		<thead>
    			<tr>
                <th width="80%" class="align-middle">
                    <h3>[{{vo.type}}]{{vo.subject}}</h3>
                </th>
                <th width="20%" class="align-middle">
                    {{vo.dbday}}
                </th>
            </tr>
    		</thead>
    	</table>
        <table class="table">
        	<thead>
             <tr >
            	<td width="20%" >여행 내역</td>
            	<td width="80%" style="color:#4eb8d1" >
            	{{vo.packaged}}
            	</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="2">
                    <pre  style="min-height:300px; width:100%; overflow:auto; white-space:pre-wrap; word-wrap:break-word; "
                    >{{vo.content}}
                    </pre>
                </td>
            </tr>
            <tr>
            	<td colspan="2" class="text-center">
            		문의 답변
            	</td>
            </tr>
             <tr>
                <td colspan="2">
                	<p v-if="vo.answer ===null">아직 답변이 없습니다</p>
                    <pre v-if="vo.answer!==null"  style="min-height:300px; width:100%; overflow:auto; white-space:pre-wrap; word-wrap:break-word; "
                    >{{vo.answer}}
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
<script>
	const customerApp = Vue.createApp({
		data(){
			return{
				vo:{},
				no:${no}
			}
		},
		mounted(){
			axios.get("../customer/detail_vue.do",{
				params:{
					no:this.no
				}
			})
			.then(res => {
				this.vo=res.data
			})
			.catch(err => {
				console.error(err)
			})
		}
	}).mount("#customerApp")
</script>
</body>
</html>