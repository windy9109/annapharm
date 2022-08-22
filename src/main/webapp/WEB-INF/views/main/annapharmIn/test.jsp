<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{
	margin: 0px;
	padding: 0px;
}
.sort_list_group:after{
	display: table;
    clear: both;
    content: '';
}
.section_answer .heading_area {
	font-size: 13px;
}
.sort_list_group {
    position: relative;
    min-height: 33px;
}
.answer_wrap .sort_list_group {
    margin-top: 6px;
}
.sort_list_group_left {
    float: left;
}
.sort_list_group_right {
    float: right;
}
.blind{
    overflow: hidden;
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    clip: rect(0 0 0 0);
}
.view_type_list {
    float: left;
}
ul, li {
    list-style: none;
}
.view_type_list li {
    position: relative;
    float: left;
}
.view_type_list .type_preview {
    background-position: -31px 0;
}
.view_type_list li>a {
    display: inline-block;
    width: 26px;
    height: 25px;
    background: url(https://ssl.pstatic.net/static/kin/09renewal/new_master/ico_view_type.png);
    font-size: 0;
    line-height: 0;
    color: transparent;
    vertical-align: top;
}
.view_type_wrap .select_area {
    float: left;
    position: relative;
    z-index: 20;
    width: 72px;
    height: 23px;
    line-height: 23px;
    margin-left: 4px;
    border: 1px solid #cacccc;
    color: #4c4c4c;
}
.view_type_wrap .select_area .btn_select {
    padding-left: 5px;
}
.view_type_wrap .select_area a {
    color: #4c4c4c;
    text-decoration: none;
    font-size: 12px;
    letter-spacing: -1px;
}
.view_type_wrap .select_area .select_list {
    display: none;
    position: absolute;
    top: -1px;
    left: -1px;
    width: 100%;
    border: 1px solid gray;
    background: #fff;
}
a {
    color: #007bff;
    text-decoration: none;
    background-color: transparent;
}
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="sort_list_group _option">
			<div class="sort_list_group_left">
				<div class="view_type_wrap">
					<p class="blind">보기옵션 선택</p>

					<ul class="view_type_list _view_type_list" role="tablist">

						<!-- [D]
									1) 클로바앱 질문(선택안되게): is_disabled 클래스 추가 / aria-disabled="true" 추가
									2) tab 요소(ul.view_type_list > li > a) click 이벤트시 동작
										- 선택된 탭일 경우: on 클래스 추가 및 aria-selected="true"로 변경
										- 선택되지 않은 탭일 경우: on 클래스 제거 및 aria-selected="false"로 변경
										- 비활성화된 탭일 경우: is_disabled 클래스 추가 및 aria-disabled="true" 속성 추가
										- 활성화된 탭일 경우: is_disabled 클래스 제거 및 aria-disabled 속성 제거
									3) tab 요소(ul.view_type_list > li > a)와 하단 div.answer_list 요소 연결
										- 미리보기형 탭은 미리보기형 목록과, 제목형 탭은 제목형 목록과 각각 연결
										- a 요소의 aria-controls=""와 div 요소의 id=""에 동일한 id 값 제공
								-->
						<li class="_preview"><a href="#" role="button"
							aria-selected="false" aria-controls="questionListTypePreview"
							class="type_preview _previewTypeBtn"
							onclick="nhn.Kin.Utility.nClicks('nql_nlg.preview', '', '', event);">미리보기형</a></li>
						<li class="_onlyTitle"><a href="#" role="button"
							aria-selected="true" aria-controls="questionListTypeTitle"
							class="type_title _onlyTitleTypeBtn on"
							onclick="nhn.Kin.Utility.nClicks('nql_nlg.title', '', '', event);">제목형</a>
							<div class="tooltip _previewTypeTooltipLayer"
								style="display: none;">
								<span class="sp_common arrow"></span>
								<div class="inner">
									<p class="blind">안내</p>
									제목만 모아서 많은 질문을<br> 한 번에 볼 수 있어요! <a href="#"
										class="sp_common btn_close _previewTypeTooltipLayerClose">닫기</a>
								</div>
							</div></li>
					</ul>

					<div class="select_area _countPerPageSelectBox">
						<a href="#" class="btn_select _selectedCountPerPageValue">10개
							보기 <span class="ico_arrow sp_common"></span>
						</a>
						<p class="blind">보기 개수 선택</p>
						<ul class="select_list _countPerPageListArea">
							<li class="_countPerPage _param('5')"><a href="#"
								class="_countPerPageValue _param('5')">5개 보기</a></li>
							<li class="_countPerPage _param('10') on"><a href="#"
								class="_countPerPageValue _param('10')">10개 보기</a></li>
							<li class="_countPerPage _param('15')"><a href="#"
								class="_countPerPageValue _param('15')">15개 보기</a></li>
							<li class="_countPerPage _param('20')"><a href="#"
								class="_countPerPageValue _param('20') default">20개 보기</a></li>
							<li class="_countPerPage _param('25')"><a href="#"
								class="_countPerPageValue _param('25')">25개 보기</a></li>
							<li class="_countPerPage _param('30')"><a href="#"
								class="_countPerPageValue _param('30')">30개 보기</a></li>
							<li class="_countPerPage _param('50')"><a href="#"
								class="_countPerPageValue _param('50')">50개 보기</a></li>
						</ul>
					</div>
				</div>
			</div>


			<div class="sort_list_group_right">

				<p class="blind">정렬 옵션 선택</p>
				<ul class="sort_list_module _sortOptionList">
					<li class="_answer"><a href="#" role="button"
						aria-selected="false" class="_sort_option _param('answer')"
						onclick="nhn.Kin.Utility.nClicks('nql_nlg.answer', '', '', event);"><i
							class="ico_sort _sort_option _param('answer')"></i>답변적은순</a></li>
					<li class="_firstFlag is_active" style="display: list-item;"><a
						href="#" role="button" aria-selected="true"
						class="_sort_option _param('firstFlag')"
						onclick="nhn.Kin.Utility.nClicks('nql_nlg.newask', '', '', event);"><i
							class="ico_sort _sort_option _param('firstFlag')"></i>첫질문</a></li>
					<li class="_recent"><a href="#" role="button"
						aria-selected="false" class="_sort_option _param('recent')"
						onclick="nhn.Kin.Utility.nClicks('nql_nlg.latest', '', '', event);"><i
							class="ico_sort _sort_option _param('recent')"></i>최신순</a></li>
					<li class="_betPoint"><a href="#" role="button"
						aria-selected="false" class="_sort_option _param('betPoint')"
						onclick="nhn.Kin.Utility.nClicks('nql_nlg.point', '', '', event);"><i
							class="ico_sort _sort_option _param('betPoint')"></i>내공높은순</a></li>
				</ul>
			</div>
		</div>

		<h4 class="mt-5 ">Custom Content Above</h4>
		<ul class="nav nav-tabs" id="custom-content-above-tab" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				id="custom-content-above-home-tab" data-toggle="pill"
				href="#custom-content-above-home" role="tab"
				aria-controls="custom-content-above-home" aria-selected="true">Home</a>
			</li>
			<li class="nav-item"><a class="nav-link"
				id="custom-content-above-profile-tab" data-toggle="pill"
				href="#custom-content-above-profile" role="tab"
				aria-controls="custom-content-above-profile" aria-selected="false">Profile</a>
			</li>
			<li class="nav-item"><a class="nav-link"
				id="custom-content-above-messages-tab" data-toggle="pill"
				href="#custom-content-above-messages" role="tab"
				aria-controls="custom-content-above-messages" aria-selected="false">Messages</a>
			</li>
			<li class="nav-item"><a class="nav-link"
				id="custom-content-above-settings-tab" data-toggle="pill"
				href="#custom-content-above-settings" role="tab"
				aria-controls="custom-content-above-settings" aria-selected="false">Settings</a>
			</li>
		</ul>
		<div class="tab-custom-content">
			<p class="lead mb-0">Custom Content goes here</p>
		</div>
		<div class="tab-content" id="custom-content-above-tabContent">
			<div class="tab-pane fade show active" id="custom-content-above-home"
				role="tabpanel" aria-labelledby="custom-content-above-home-tab">
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin
				malesuada lacus ullamcorper dui molestie, sit amet congue quam
				finibus. Etiam ultricies nunc non magna feugiat commodo. Etiam odio
				magna, mollis auctor felis vitae, ullamcorper ornare ligula. Proin
				pellentesque tincidunt nisi, vitae ullamcorper felis aliquam id.
				Pellentesque habitant morbi tristique senectus et netus et malesuada
				fames ac turpis egestas. Proin id orci eu lectus blandit suscipit.
				Phasellus porta, ante et varius ornare, sem enim sollicitudin eros,
				at commodo leo est vitae lacus. Etiam ut porta sem. Proin porttitor
				porta nisl, id tempor risus rhoncus quis. In in quam a nibh cursus
				pulvinar non consequat neque. Mauris lacus elit, condimentum ac
				condimentum at, semper vitae lectus. Cras lacinia erat eget sapien
				porta consectetur.</div>
			<div class="tab-pane fade" id="custom-content-above-profile"
				role="tabpanel" aria-labelledby="custom-content-above-profile-tab">
				Mauris tincidunt mi at erat gravida, eget tristique urna bibendum.
				Mauris pharetra purus ut ligula tempor, et vulputate metus
				facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
				posuere cubilia Curae; Maecenas sollicitudin, nisi a luctus
				interdum, nisl ligula placerat mi, quis posuere purus ligula eu
				lectus. Donec nunc tellus, elementum sit amet ultricies at, posuere
				nec nunc. Nunc euismod pellentesque diam.</div>
			<div class="tab-pane fade" id="custom-content-above-messages"
				role="tabpanel" aria-labelledby="custom-content-above-messages-tab">
				Morbi turpis dolor, vulputate vitae felis non, tincidunt congue
				mauris. Phasellus volutpat augue id mi placerat mollis. Vivamus
				faucibus eu massa eget condimentum. Fusce nec hendrerit sem, ac
				tristique nulla. Integer vestibulum orci odio. Cras nec augue ipsum.
				Suspendisse ut velit condimentum, mattis urna a, malesuada nunc.
				Curabitur eleifend facilisis velit finibus tristique. Nam vulputate,
				eros non luctus efficitur, ipsum odio volutpat massa, sit amet
				sollicitudin est libero sed ipsum. Nulla lacinia, ex vitae gravida
				fermentum, lectus ipsum gravida arcu, id fermentum metus arcu vel
				metus. Curabitur eget sem eu risus tincidunt eleifend ac ornare
				magna.</div>
			<div class="tab-pane fade" id="custom-content-above-settings"
				role="tabpanel" aria-labelledby="custom-content-above-settings-tab">
				Pellentesque vestibulum commodo nibh nec blandit. Maecenas neque
				magna, iaculis tempus turpis ac, ornare sodales tellus. Mauris eget
				blandit dolor. Quisque tincidunt venenatis vulputate. Morbi euismod
				molestie tristique. Vestibulum consectetur dolor a vestibulum
				pharetra. Donec interdum placerat urna nec pharetra. Etiam eget
				dapibus orci, eget aliquet urna. Nunc at consequat diam. Nunc et
				felis ut nisl commodo dignissim. In hac habitasse platea dictumst.
				Praesent imperdiet accumsan ex sit amet facilisis.</div>
		</div>
		
		<div class="direct-chat-text">
			Is this template really for free? That's unbelievable!
		</div>
		
	</div>
</body>
</html>