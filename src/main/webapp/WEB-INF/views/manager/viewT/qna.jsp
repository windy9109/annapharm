<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 답변대기중인 문의사항 -->




<style>
.card-title{
	float:unset;
}
.conqt0{
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
               width: 140px;
    display: inline-block;
}

.table td{
text-align: center;
}

.p-01{
    width: 515px;
    display: inline-block;
    padding: 0;
    float: left;
    margin: 0;
    background: #fff;
}

.p-02{
width: 100px;
    display: inline-block;
    margin: 0;
    float: right;
    padding: 0;
    background: #fff;
}

.chat_ye0{
    line-height: 23.8px;
}

.ye0_er{
background: #999;
    color: #fff;
}

</style>
<div class="card" style="background: transparent; display: block;">

	<div class="card-body table-responsive p-01">
		<table class="table table-hover text-nowrap">
			<thead>
				<tr style="background: #E8F5FF;">
					<th>no</th>
					<th>분류</th>
					<th>제목</th>
					<th>문의자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			
				<tr>
					<td>5</td>
					<td class="m1 yeb0"><span>약사</span></td>
					<td class="conqt0">비밀번호를 까먹었어요!</td>
					<td>곽성상</td>
					<td>2022-06-30</td>
				</tr>
				<tr>
					<td>4</td>
					<td class="d1 yeb0"><span>의사</span></td>
					<td class="conqt0">고객센터비밀번호가 뭔가요?</td>
					<td>김민지</td>
					<td>2022.06.30</td>
				</tr>
				<tr>
					<td>3</td>
					<td class="w1 yeb0"><span>일반</span></td>
					<td class="conqt0">고객센터비밀번호가 뭔가요?</td>
					<td>김민지</td>
					<td>2022.06.30</td>
				</tr>
				<tr>
					<td>2</td>
					<td class="j1 yeb0"><span>전체</span></td>
					<td class="conqt0">고객센터비밀번호가 뭔가요?</td>
					<td>김민지</td>
					<td>2022.06.30</td>
				</tr>
				<tr>
					<td>1</td>
					<td class="m1 yeb0"><span>약사</span></td>
					<td class="conqt0">고객센터비밀번호가 뭔가요?</td>
					<td>김민지</td>
					<td>2022.06.30</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	
	
	<div class="card-body table-responsive p-02">
		<table class="table table-hover text-nowrap">
			<thead>
				<tr style="background: #E8F5FF;">
					<th>분류</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="chat_ye0 ye0_er"><span>약사</span></td>
				</tr>
				<tr>
					<td class="chat_ye0"><span>의사</span></td>
				</tr>
				<tr>
					<td class="chat_ye0"><span>일반</span></td>
				</tr>
				<tr>
					<td class="chat_ye0"><span>전체</span></td>
				</tr>
			</tbody>
		</table>
	</div>

</div>