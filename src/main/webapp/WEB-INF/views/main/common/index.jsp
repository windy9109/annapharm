<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="annapharmInList" value="${dataMap.annapharmInList }" />

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<style>
.section p, .intro p{
    font-size: 14px;
}

.section p *, .intro p *{
    color: #fff !important;
    font-size: 12px !important;
}

.section p img, .intro p img{
    display: none;
}
.c-heading__title *{
    color: #fff !important;
    font-size: 12px !important;
}
.anw a{
    background: #fff;
    color: #666 !important;
    padding: 10px;
    display: inline-block;
    margin-top: 10px;
    border-radius: 500px;
    cursor: pointer;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

       <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/fullpage.css">
       <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/examples.css">
<!-- 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Observer - fullPage.js</title>
	<meta name="author" content="Alvaro Trigo Lopez" />
	<meta name="description" content="fullPage.js using CSS3 transformations." />
	<meta name="keywords"  content="fullpage,jquery,anchor,links,inside,demo,css,css3" />
	<meta name="Resource-type" content="Document" />

 -->
    <style>
        /* Hidding sections under 960px width */
        @media screen and (max-width: 960px) {
            .hide-on-responsive{
                display: none;
            }
        }

.container{
    width: 50%;
        float: left;
    display: inline-block;
}

		#fullpage{
    		overflow: initial;
		}

        #fp-nav ul li a span,
        .fp-slidesNav ul li a span{
            background-color: #333;

        }


        .actions{
            position: absolute;
            z-index: 999;
            top: 40px;
            left: 50px;
        }
        .actions li{
            display: inline-block;
        }
        .actions button {
            padding: 0.93em 1.87em;
            background: #35495e;
            border-radius: 5px;
            border: 0;
            color: #fff;
            margin: 7px;
            font-size: 15px;
            cursor: pointer;
        }

        .actions button:hover {
            background: #fff;
            color: #35495e;
        }
        body:not(.sidebar-mini-md):not(.sidebar-mini-xs):not(.layout-top-nav) .main-footer{
            z-index: 9;
    position: inherit;
        }

        #nonLohinPrescription2{
       	    background-image: url("<%=request.getContextPath() %>/resources/img/Group118.png");
       	    background-size: cover;
		    border-radius: 50%;
		    width: 205px;
		    height: 205px;
		    position: absolute;
		    left: 545px;
		    top: 360px;
        }

        #nonLohinPrescription2:hover{
        	cursor: pointer;
        }
    </style>
</head>
<body>





<div id="fullpage">
    <div class="section" id="section0">
   		 <!--첫번째 슬라이드 -->
   		 <div id="nonLohinPrescription2" onclick="openNonLoginReadPrescription()">
   		 </div>
    </div>
	<div class="section" id="section1">
		<!-- 두번째 슬라이드 -->
	      <img src="<%=request.getContextPath() %>/resources/img/faq.png" class="section1_img">
			<!-- faq 미리보기1 시작-->
			<div class="container_wrap0">
				<div id="Accordion_wrap">
					<c:forEach items="${qnaList }" begin="0" end="2" var="list">
					     <div class="que">
					      <span>${list.qnaTitle }</span>
					     </div>
					     <div class="anw">
					      <span>${list.qnaReply }</span>
					     </div>
					</c:forEach>
				</div>
			<!-- faq 미리보기1 마침-->
			<!-- faq 미리보기2 시작-->
				<div id="Accordion_wrap">
				    <c:forEach items="${qnaList }" begin="3" end="6" var="list">
					     <div class="que">
					      <span>${list.qnaTitle }</span>
					     </div>
					     <div class="anw">
					      <span>${list.qnaReply }</span>
					     </div>
					</c:forEach>
				</div>
			</div>
			<!-- faq 미리보기2 마침-->
	</div>
	<div class="section hide-on-responsive" id="section2">
		<div class="last_left_wrap">
			<img src="<%=request.getContextPath() %>/resources/img/Group114.png" class="section3_img1">
			<a onClick="location.href='<%=request.getContextPath() %>/annapharmIn/list.do'" style="    cursor: pointer;">
				<img src="<%=request.getContextPath() %>/resources/img/Group113.png" class="section3_img2">
			</a>
		</div>
		<div class="last_right_wrap">
		<h3 class="title_sec01">
		<b>복약질문</b><span>BEST</span>
		</h3>
				<div id="Accordion_wrap">
				     <div class="que">
				      <span>${AnnapharmIn_main02.chemistInTitle}</span>
				     </div>
				     <div class="anw">
				      <span>${AnnapharmIn_main02.chemistInContent}</span>
				     	<a onClick="location.href='<%=request.getContextPath() %>/annapharmIn/detail.do?from=list&chemistInCode=${AnnapharmIn_main02.chemistInCode}&chemistInReplyCnt=1'">답변확인</a>
				     </div>
				      <div class="que">
				      <span>${AnnapharmIn_main03.chemistInTitle}</span>
				     </div>
				     <div class="anw">
				      <span>${AnnapharmIn_main03.chemistInContent}</span>
				      <a onClick="location.href='<%=request.getContextPath() %>/annapharmIn/detail.do?from=list&chemistInCode=${AnnapharmIn_main03.chemistInCode}&chemistInReplyCnt=1'">답변확인</a>
				      
				     </div>
				      <div class="que">
				      <span>${AnnapharmIn_main04.chemistInTitle}</span>
				     </div>
				     <div class="anw">
				      <span>${AnnapharmIn_main04.chemistInContent}</span>
				      <a onClick="location.href='<%=request.getContextPath() %>/annapharmIn/detail.do?from=list&chemistInCode=${AnnapharmIn_main04.chemistInCode}&chemistInReplyCnt=1'">답변확인</a>
				      
				     </div>
				</div>
		</div>
	</div>
<!-- 	<div class="section " id="section3">
		<div class="intro">
			<h1>Check it out!</h1>
			<p>You'll love it</p>
		</div>
	</div> -->



<!-- <script type="text/javascript" src="../dist/fullpage.js"></script>
<script type="text/javascript" src="examples.js"></script> -->

<script src="<%=request.getContextPath() %>/resources/dist/fullpage.js" ></script>
<script src="<%=request.getContextPath() %>/resources/dist/examples.js" ></script>
<script type="text/javascript">
    var myFullpage = new fullpage('#fullpage', {
        sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE', '#435b71', 'orange', 'blue', 'purple', 'yellow', '#435b71', 'orange', 'blue', 'purple', 'yellow' ],
        anchors: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'],
        controlArrows: false,
        navigation: true,
        slidesNavigation: true
    });
</script>

<!-- 로그인 없이 처방전 조회하기 -->
<script>

	function openNonLoginReadPrescription(){
		OpenWindow('nonLoginReadPrescript.do','최근 처방전 조회하기','634','270');
	}

</script>

<script type="text/javascript">
$(".que").click(function() {
   $(this).next(".anw").stop().slideToggle(300);
  $(this).toggleClass('on').siblings().removeClass('on');
  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
});
</script>


</div>
</body>
</html>