<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style type="text/css">
.table td, .table th {
	padding: 0.75rem;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
	font-size: 12px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.table th {
	align-content: center;
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	min-height: 1px;
	padding: 0.5rem;
	padding-top: 0px;
}

.card-header {
	margin-bottom: 0.5rem;
}

ul {
	margin-bottom: 0;
}

table {
	table-layout: fixed;
}




.card-footer {
	padding: 0.5rem 1.25rem;
	background-color: rgba(0, 0, 0, .03);
	border-top: 0solidrgba(0, 0, 0, .125);
}
</style>
</head>

<title></title>

<body>
	<div class="content-wrapper">
		<div class="row m-0">
			<div class="col-lg-6 border" style="height: 960px;">
				<div class="row-6 m-0">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">약이름 검색</h3>
						</div>

						<div class="card-body">
							<div class="row m-0 pb-2">
								<input value="타이" class="form-control form-control-sm col-3 mr-2"
									style="display: inline;" />
								<button class="btn btn-sm btn-default">검색하기</button>
							</div>
							<table class="table table-hover table-bordered"
								style="border-top: 1px solid #dee2e6;">
								<colgroup>
									<col width="45%" />
									<col width="29%" />
									<col width="10%" />
									<col width="16%" />
									<col width="20%" />
								</colgroup>
								<thead class="text-center">
									<tr>
										<th>약이름</th>
										<th>성분명</th>
										<th>구분</th>
										<th>함량/단위</th>
										<th>주성분코드</th>
									</tr>
								</thead>
								<tbody class="text-left">
									<tr>
										<td>타이드정</td>
										<td>티로프라이드염산염</td>
										<td>전문</td>
										<td>0.1g/정</td>
										<td>240301ATB</td>
									</tr>

									<tr>
										<td>타이론정</td>
										<td>티로프라이드염산염</td>
										<td>전문</td>
										<td>0.1g/정</td>
										<td>240301ATB</td>
									</tr>
									<tr>
										<td>타이로정</td>
										<td>티로프라이드염산염</td>
										<td>전문</td>
										<td>0.1g/정</td>
										<td>240301ATB</td>
									</tr>
									<tr>
										<td>타이로정</td>
										<td>티로프라이드염산염</td>
										<td>전문</td>
										<td>0.1g/정</td>
										<td>240301ATB</td>
									</tr>
									<tr>
										<td>글립타이드정</td>
										<td>설글리코타이드</td>
										<td>전문</td>
										<td>0.2g/정</td>
										<td>233102ATB</td>
									</tr>
									<tr>
										<td>스타이렌정</td>
										<td>애엽95%에탄올연</td>
										<td>전문</td>
										<td>0.07/정</td>
										<td>430102ATB</td>
									</tr>
									<tr>
										<td>타이레놀8시간이알서방정</td>
										<td>아세트아미노펜</td>
										<td>일반</td>
										<td>0.65/정</td>
										<td>101430ATR</td>
									</tr>
								</tbody>
							</table>


						</div>
						<!-- 						<div class="card-body table-responsive"> -->
						<!-- 							<div class="row m-0 pb-2"> -->
						<!-- 								<input class="form-control form-control-sm col-3 mr-2" -->
						<!-- 									style="display: inline;" /> -->
						<!-- 								<button class="btn btn-sm btn-default">검색하기</button> -->
						<!-- 							</div> -->
						<!-- 							<table class="table table-hover table-bordered text-nowrap" style="border-top: 1px solid #dee2e6;"> -->
						<!-- 								<colgroup> -->
						<!-- 									<col width="45%" /> -->
						<!-- 									<col width="30%" /> -->
						<!-- 									<col width="10%" /> -->
						<!-- 									<col width="25%" /> -->
						<!-- 									<col width="10%" /> -->
						<!-- 								</colgroup> -->
						<!-- 								<thead class="text-center"> -->
						<!-- 									<tr> -->
						<!-- 										<th>약이름</th> -->
						<!-- 										<th>성분명</th> -->
						<!-- 										<th>구분</th> -->
						<!-- 										<th>함량/단위</th> -->
						<!-- 										<th>주성분코드</th> -->
						<!-- 									</tr> -->
						<!-- 								</thead> -->
						<!-- 								<tbody class="text-left"> -->
						<!-- 									<tr> -->
						<!-- 										<td>타이드정</td> -->
						<!-- 										<td>티로프라이드염산염</td> -->
						<!-- 										<td>전문</td> -->
						<!-- 										<td>0.1g/정</td> -->
						<!-- 										<td>240301ATB</td> -->
						<!-- 									</tr> -->

						<!-- 									<tr> -->
						<!-- 										<td>타이론정</td> -->
						<!-- 										<td>티로프라이드염산염</td> -->
						<!-- 										<td>전문</td> -->
						<!-- 										<td>0.1g/정</td> -->
						<!-- 										<td>240301ATB</td> -->
						<!-- 									</tr> -->
						<!-- 									<tr> -->
						<!-- 										<td>타이로정</td> -->
						<!-- 										<td>티로프라이드염산염</td> -->
						<!-- 										<td>전문</td> -->
						<!-- 										<td>0.1g/정</td> -->
						<!-- 										<td>240301ATB</td> -->
						<!-- 									</tr> -->
						<!-- 									<tr> -->
						<!-- 										<td>타이로정</td> -->
						<!-- 										<td>티로프라이드염산염</td> -->
						<!-- 										<td>전문</td> -->
						<!-- 										<td>0.1g/정</td> -->
						<!-- 										<td>240301ATB</td> -->
						<!-- 									</tr> -->
						<!-- 									<tr> -->
						<!-- 										<td>글립타이드정</td> -->
						<!-- 										<td>설글리코타이드</td> -->
						<!-- 										<td>전문</td> -->
						<!-- 										<td>0.2g/정</td> -->
						<!-- 										<td>233102ATB</td> -->
						<!-- 									</tr> -->
						<!-- 									<tr> -->
						<!-- 										<td>스타이렌정</td> -->
						<!-- 										<td>애엽95%에탄올연</td> -->
						<!-- 										<td>전문</td> -->
						<!-- 										<td>0.07/정</td> -->
						<!-- 										<td>430102ATB</td> -->
						<!-- 									</tr> -->
						<!-- 									<tr> -->
						<!-- 										<td>타이레놀8시간이알서방정</td> -->
						<!-- 										<td>아세트아미노펜</td> -->
						<!-- 										<td>일반</td> -->
						<!-- 										<td>0.65/정</td> -->
						<!-- 										<td>101430ATR</td> -->
						<!-- 									</tr> -->
						<!-- 								</tbody> -->
						<!-- 							</table> -->
						<!-- 						</div> -->
						<div class="card-footer">
							<ul class="pagination pagination-sm justify-content-center">
								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</div>

					</div>
				</div>

				<div class="row-6 m-0">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">주성분 검색</h3>
						</div>

						<div class="card-body table-responsive">
							<div class="row m-0 pb-2">
								<input value="염산염" class="form-control form-control-sm col-3 mr-2"
									style="display: inline;" />
								<button class="btn btn-sm btn-default">검색하기</button>
							</div>
							<table class="table table-hover table-bordered text-nowrap"
								style="border-top: 1px solid #dee2e6;">
								<colgroup>
									<col width="10%" />
									<col width="40%" />
									<col width="20%" />
									<col width="15%" />
									<col width="15%" />
								</colgroup>
								<thead class="text-center">
									<tr>
										<th>분류</th>
										<th>성분명</th>
										<th>주성분코드</th>
										<th>함량/단위</th>
										<th>투여방법</th>
									</tr>
								</thead>
								<tbody class="text-left">
									<tr>
										<td>114</td>
										<td>티로프라이드염산염</td>
										<td>240301ATB</td>
										<td>0.1g/정</td>
										<td>내복</td>
									</tr>

									<tr>
										<td>112</td>
										<td>독세핀염산염</td>
										<td>149203ATB</td>
										<td>3.39mg/정</td>
										<td>내복</td>
									</tr>
									<tr>
										<td>112</td>
										<td>독세핀염산염</td>
										<td>149204ATB</td>
										<td>6.78mg/정</td>
										<td>내복</td>
									</tr>
									<tr>
										<td>112</td>
										<td>플루라제팜염산염</td>
										<td>161801ATB</td>
										<td>15mg/정</td>
										<td>내복</td>
									</tr>
									<tr>
										<td>114</td>
										<td>트라마돌염산염</td>
										<td>242302ATR</td>
										<td>0.15g/정</td>
										<td>내복</td>
									</tr>
									<tr>
										<td>114</td>
										<td>트라마돌염산염</td>
										<td>242304ATR</td>
										<td>0.2g/정</td>
										<td>내복</td>
									</tr>
									<tr>
										<td>114</td>
										<td>트라마돌염산염</td>
										<td>242301ATR</td>
										<td>0.1g/정</td>
										<td>내복</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<ul class="pagination pagination-sm justify-content-center">
								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</div>

					</div>
				</div>

			</div>

			<div class="col-lg-6 border" style="height: 960px;">
				<div class="card">
					<div class="card-header form-inline">
						<h3 class="card-title">제조사별 매입가 비교</h3>
						<button class="btn btn-sm btn-default mb-0 ml-2 float-right">비교하기</button>

					</div>

					<div class="card-body table-responsive" style="height: 500px;">
						
						<table class="table table-bordered table-head-fixed text-nowrap" style="height: 500px;">
							<colgroup>
								<col width="9%" />
								<col width="58%" />
								<col width="17%" />
								<col width="12%" />
								<col width="25%" />
								<col width="9%" />
							</colgroup>
							<thead class="text-center" style="font-size: 14px;">
								<tr>
									<th><i class='fas fa-star'></i></th>
									<th>약명</th>
									<th>제약사</th>
									<th>구분</th>
									<th>금액</th>
									<th></th>
									<th>box</th>
								</tr>
							</thead>
							<tbody class="text-center" style="font-size: 14px;">
								<tr>
									<td class="text-left"><i class='fas fa-star'></i></td>
									<td class="text-left">타이레놀8시간이알서방정타이레놀8시간이알서방정타이레놀8시간이알서방정</td>
									<td class="text-left">한국얀센</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								
								<tr>
									<td class="text-left"><i class='fas fa-star'></i></td>
									<td class="text-left">씨스펜8시간이알서방정</td>
									<td class="text-left">한미약품</td>
									<td>일반</td>
									<td class="text-right">50</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">엔시드이알서방정650mg</td>
									<td class="text-left">한림제약</td>
									<td>일반</td>
									<td class="text-right">50</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">세토펜이알서방정</td>
									<td class="text-left">삼아제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">타세놀8시간이알서방정</td>
									<td class="text-left">부광약품</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">타스펜이알서방정650밀리그람</td>
									<td class="text-left">대우제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">타이리콜8시간이알서방정</td>
									<td class="text-left">하나제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">타이펜8시간이알서방정</td>
									<td class="text-left">영풍제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='fas fa-star'></i></td>
									<td class="text-left">트라몰서방정650밀리그람</td>
									<td class="text-left">코오롱제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">티메롤이알서방정</td>
									<td class="text-left">서울제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='fas fa-star'></i></td>
									<td class="text-left">펜잘이알서방정</td>
									<td class="text-left">종근당</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">아니스펜8시간이알서방정</td>
									<td class="text-left">제뉴파마</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">이알펜서방정</td>
									<td class="text-left">경보제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='fas fa-star'></i></td>
									<td class="text-left">타미스펜이알서방정</td>
									<td class="text-left">한국글로벌제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">아세노펜이알서방정</td>
									<td class="text-left">일화</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">아세트엠8시간이알서방정650밀리그램</td>
									<td class="text-left">마더스제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">타이레펜8시간이알서방정650밀리그램</td>
									<td class="text-left">휴비스트제약</td>
									<td>일반</td>
									<td class="text-right">60</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">세타펜8시간이알서방정650밀리그램</td>
									<td class="text-left">보령바이오파마</td>
									<td>일반</td>
									<td class="text-right">60</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td class="text-left"><i class='far fa-star'></i></td>
									<td class="text-left">타이몰8시간이알서방정650밀리그램</td>
									<td class="text-left">동구바이오제약</td>
									<td>일반</td>
									<td class="text-right">60</td>
									<td><input type="checkbox" /></td>
								</tr>

							</tbody>
						</table>
					</div>



				</div>
				
				<div class="card">
					<div class="card-header form-inline">
						<h3 class="card-title">선택한 약 목록</h3>
						<button class="btn btn-sm btn-default mb-0 ml-2 float-right">발주하기</button>
					</div>

					<div class="card-body table-responsive" style="height: 300px;">
						
						<table class="table table-bordered table-head-fixed text-nowrap">
							<colgroup>
								<col width="9%"/>
								<col width="58%"/>
								<col width="17%"/>
								<col width="12%"/>
								<col width="25%"/>
							</colgroup>
							<thead class="text-center" style="font-size: 14px;">
								<tr>
									<th><i class='fas fa-star'></i></th>
									<th>약명</th>
									<th>제약사</th>
									<th>구분</th>
									<th>금액</th>
									<th></th>
								</tr>
							</thead>
							<tbody class="text-center" style="font-size: 14px;">
								<tr>
									<td class="text-left"><i class='fas fa-star'></i></td>
									<td class="text-left">타이레놀8시간이알서방정타이레놀8시간이알서방정타이레놀8시간이알서방정</td>
									<td class="text-left">한국얀센</td>
									<td>일반</td>
									<td class="text-right">51</td>
								</tr>
								
								<tr>
									<td class="text-left"><i class='fas fa-star'></i></td>
									<td class="text-left">씨스펜8시간이알서방정</td>
									<td class="text-left">한미약품</td>
									<td>일반</td>
									<td class="text-right">50</td>
								</tr>
								<tr>
									<td class="text-left"><i class='fas fa-star'></i></td>
									<td class="text-left">트라몰서방정650밀리그람</td>
									<td class="text-left">코오롱제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
								</tr>
								<tr>
									<td class="text-left"><i class='fas fa-star'></i></td>
									<td class="text-left">펜잘이알서방정</td>
									<td class="text-left">종근당</td>
									<td>일반</td>
									<td class="text-right">51</td>
								</tr>
								<tr>
									<td class="text-left"><i class='fas fa-star'></i></td>
									<td class="text-left">타미스펜이알서방정</td>
									<td class="text-left">한국글로벌제약</td>
									<td>일반</td>
									<td class="text-right">51</td>
								</tr>
							</tbody>
						</table>
					</div>



				</div>


			</div>


		</div>
	</div>
</body>