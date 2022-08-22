<%@page import="kr.or.annapharm.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}

<div class="replyLi" >
	<div class="user-block">
		<%-- <img src="<%=request.getContextPath()%>/member/getPicture.do?id={{chemistCode}}" class="img-circle img-bordered-sm"/> --%>
    </div>
<%--	<div class="timeline-item" >
  		<span class="time">



    		<i class="fa fa-clock"></i>{{prettifyDate chemistInAdopt}}
	 		<a class="btn btn-primary btn-xs {{chemistAnsCode}}-a" id="modifyReplyBtn" data-chemistAnsCode={{chemistAnsCode}}
				onclick="replyModifyModal_go('{{chemistAnsCode}}');"
				style="display:{{VisibleByLoginCheck chemistCode}};"
	    		data-chemistCode={{chemistCode}} data-toggle="modal" data-target="#modifyModal">Modify</a>



	</span>

  		<h3 class="timeline-header"><strong style="display:none;">{{chemistAnsCode}}</strong>{{chemistCode}}</h3>
  		<div class="timeline-body" id="{{chemistAnsCode}}-chemistInReply">{{chemistInReply}} </div>
	</div>  --%>
</div>

<div class="card">
<div class="rte00" style="background-color: #fff;">
<div style="position: relative; padding-bottom: 0px;" class="rte01">
			<div style="margin: 40px 70px; background-color: white; padding-bottom: 0px;">
				<div style="margin: 30px;">
					<!-- 게시글 작성자일 경우 출력된다. -->
					{{#eq chemistInAdopt 'N'}}
						{{#eq '${loginUser.memId}' '${annapharmIn.chemistInWriter}' }}
						<button type="button" id="select" class="btn btn-block btn-outline-primary" style="width: 100px; float: right; right: 100px;" onclick="change()">채택하기</button>
						{{else}}
						{{/eq}}
					{{else}}
					{{#eq chemistInAdopt 'Y'}}
					<!-- 채택 시 나오는 이미지 -->
				<div class="yre1" style="    display: inline-block; width: 70px; text-align: center; float: right;">
					<img id="img" src="<%=request.getContextPath()%>/resources/img/checked.png" style="    width: 50px; margin: 0px; right: 12%;  margin-right: 3px;">
					<span id="text" style="    font-size: 12px;  color: #2F88FF; width: 60px;  text-align: center; margin-top: 10px;  right: 11.6%; display: inline-block;">질문자 채택</span>
				</div>
					{{else}}
					{{/eq}}
					{{/eq}}
				    <p style="margin-top: 20px; margin-bottom: 50px; line-height: 22px;  display: inline-block;" id="{{chemistAnsCode}}-chemistInReply">
				       	{{chemistInReply}}
					</p>
						<span style="font-weight: bold; font-size: 17px; letter-spacing: -2px; padding-right: 10px; padding-top: 30px; display: inline-block;">{{memName}} 약사님 답변</span>
					<a href="" style="font-size: 12px;">{{pharmacyName}} / {{memTel}}</a>

					<div style=" float: right; bottom: 50px; position: absolute; right: 100px;" onclick="changeHeart('{{chemistAnsCode}}','{{chemistInCode}}','{{chemistCode}}', this)">
						좋아요&nbsp; <span class="p121">{{chemistAnsLike}}</span>
						<form role="form2" style="display: contents;">
							<input type="hidden" name="chemistInCode" value="{{chemistInCode}}"/>
							<input type="hidden" name="chemistInReplyCnt" value="${param.chemistInReplyCnt}"/>
							<input type="hidden" name="chemistAnsCode" value="{{chemistAnsCode}}"/>
						</form>
 							<%

	 							if((MemberVO)session.getAttribute("loginUser") != null){
	 								%>

									{{#eq likeCheck '1'}}
									<div class="heart_div" style="display: inline-block;">
										<i id="heart" class="fas fa-heart" style="margin-top: 5px; color: #ff0000; " ></i>
										<i id="noneHeart" class="far fa-heart" style="margin-top: 5px; display: none;"></i>
									</div>
									{{else}}
									<div class="heart_div" style="display: inline-block;">
										<i id="heart" class="fas fa-heart" style="margin-top: 5px; color: #ff0000;  display: none; display: none;" ></i>
										<i id="noneHeart" class="far fa-heart" style="margin-top: 5px;"></i>
									</div>

									{{/eq}}

							<%
									/* MemberVO mavo =	(MemberVO)session.getAttribute("loginUser");
								    mavo.getMemId(); */
	 							}
							%>

					</div>

					<hr>


					<span>{{ansDate}}</span>

{{#eq memId '${loginUser.memId}'}}
		<div class="rye1" style=" display: inline-block; float: right;">
	 		<a class="btn btn-primary btn-xs {{chemistAnsCode}}-a" id="modifyReplyBtn" data-chemistAnsCode={{chemistAnsCode}}
				onclick="replyModifyModal_go('{{chemistAnsCode}}','{{chemistInReply}}');"
	    		data-chemistCode={{chemistCode}} data-toggle="modal" data-target="#modifyModal" style=" padding: 6px 12px; border-radius: 5px; font-size: 14px; ">Modify</a>
 			<button type="button" class="btn btn-danger" id="replyDelBtn" onclick="replyRemove_go('{{chemistAnsCode}}',this);">DELETE</button>
		</div>
{{else}}
{{/eq}}

				</div>
			</div>
		</div>
</div>
</div>




{{/each}}
</script>


<script type="text/x-handlebars-template"  id="reply-pagination-template" >
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}} ">
	<a href="javascript:getPage('<%=request.getContextPath()%>/replies/${annapharmIn.chemistInCode}/{{this}}',{{this}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>
</script>


<script>





var replyPage=1;

window.onload=function(){

	
	
	 getPage("<%=request.getContextPath()%>/replies/${annapharmIn.chemistInCode}/"+replyPage);
	<%-- getPage("<%=request.getContextPath()%>/replies/list.do?chemistInCode=${annapharmIn.chemistInCode}&page="+replyPage);  --%>
	
	var s1 = document.querySelectorAll('.yre1');
	
	console.log(s1);
	for(var i = 0; i < s1.length; i++) {
	    if (s1.length > 0){
	    	/* s1[i].nextSibling.style.width = "85%"; */
	    	alert("하하");
	    	
	    }
	}
	
	
}
function getPage(pageInfo,page){
	if(page) replyPage = page;
	$.getJSON(pageInfo,function(data){
		printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
}


function printData(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$('.replyLi').remove();
	target.after(html);
}


Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"VisibleByLoginCheck":function(chemistCode){
		var result="none";
		if(chemistCode == "${loginUser.memId}") result="visible";
		return result;
	},
	"signActive":function(pageNum){
		if(pageNum == replyPage) return 'active';
	},
	"eq":function(arg1, arg2, options) {
		 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
	},
	"eq2":function(arg1, options) {
		 return (arg1 == "${loginUser.memId}") ? options.fn(this) : options.inverse(this);
	}
});


/* Handlebars.registerHelper("chemistCode",function(chemistCode){
    if(like>4){
        return "<span>축하합니다. 좋아요가 "+like+"개 이상입니다</span>";
    }else if(like <1){
        return "아직 좋아요가 없습니다.";
    }else{
        return like+"개의 좋아요가 있습니다.";
    }
}); */



/* pagination */
function printPagination(pageMaker,target,templateObject){
	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNumArray[i]=pageMaker.startPage+i;
	}
	pageMaker.pageNum=pageNumArray;
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;

	var template=Handlebars.compile(templateObject.html());
	var html = template(pageMaker);
	target.html("").html(html);
}

function replyRegist_go(e){
	var chemistInReply=$('#newChemistInReply').val();


	var data={
			"chemistInCode":"${annapharmIn.chemistInCode}",
			"chemistCode":"${loginUser.memId}",
			"chemistInReply":chemistInReply
	}

	$.ajax({
		url:"<%=request.getContextPath()%>/replies",
		type:"post",
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			console.log(data);
			alert('댓글이 등록되었습니다.');
			//replyPage=data; //페이지이동
			var qwq1 = document.querySelectorAll(".rte00");
			for(i=0; i<qwq1.length; i++){
				qwq1[i].innerHTML = "";
			}

			//e.parentNode.parentNode.parentNode.innerHTML = "";
			getPage("<%=request.getContextPath()%>/replies/${annapharmIn.chemistInCode}/"+replyPage); //리스트 출력
			$('#newChemistInReply').val("");
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}

//댓글 수정 modal
function replyModifyModal_go(chemistAnsCode, chemistInReply){
	//alert(chemistAnsCode);
	//alert($('div#'+chemistAnsCode+'-chemistInReply').text());
	//$('div#modifyModal div.modal-body #chemistInReply').val($('div#'+chemistAnsCode+'-chemistInReply').text());
	console.log(chemistInReply);
	$('div#modifyModal div.modal-header h4.modal-title').text(chemistAnsCode);
	$('div#modifyModal div.modal-content #chemistInReply').val(chemistInReply);

}

//댓글수정
function replyModify_go(){
	//alert("modify btn");
	var chemistAnsCode=$('div#modifyModal h4.modal-title').text();
	var chemistInReply=$('div#modifyModal #chemistInReply').val();

	var sendData={
			"chemistAnsCode":chemistAnsCode,
			"chemistInReply":chemistInReply
	}

	$.ajax({
		url:"<%=request.getContextPath()%>/replies/"+chemistAnsCode,
		type:"PUT",
		data:JSON.stringify(sendData),
		contentType:"application/json",
		hearders:{
			"X-HTTP-Method-Override":"PUT"
		},
		success:function(result){
			alert("수정되었습니다.");
			var qwq1 = document.querySelectorAll(".rte00");
			for(i=0; i<qwq1.length; i++){
				qwq1[i].innerHTML = "";
			}
			 getPage("<%=request.getContextPath()%>/replies/${annapharmIn.chemistInCode}/"+replyPage);
		},
		error:function(error){
			//alert('수정 실패했습니다.');
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}







function replyRemove_go(chemistAnsCode, e){
	//alert("delete btn");

	//var chemistAnsCode=$('.modal-title').text();

	$.ajax({
		url:"<%=request.getContextPath()%>/replies/${annapharmIn.chemistInCode}/"+chemistAnsCode+"/"+replyPage,
		type:"DELETE",
		hearders:{
			"X-HTTP-Method-Override":"DELETE"
		},
		success:function(page){
			alert("삭제되었습니다.");
/* 			$.getJSON(pageInfo,function(data){
				$(e).find("div.rte01").remove();
			}	 */
			//$(e).find("div.rte01").remove();

			//$(e).find("div.rte01").remove();

			//alsert(e.document.querySelector('div.rte00'));
			//var targetDiv = document.querySelector('div.rte00');
			e.parentNode.parentNode.parentNode.parentNode.innerHTML = "";
			//targetDiv.removeChild(document.querySelector('div.rte01'));

			//targetDiv.remove();

			<%-- getPage("<%=request.getContextPath()%>/replies/${annapharmIn.chemistInCode}/"+page); --%>
			replyPage=page;
		},
		error:function(error){
			alert('삭제 실패했습니다.');
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}



function change() {
	$("#select").hide();
	$("#img").show();
	$("#text").show();




	var formObj = $("form[role='form2']");
	var answer = confirm("채택하시겠습니까? 채택하면 변경 할 수없습니다.");
	if(answer){
		formObj.attr("action", "selection.do");
		formObj.attr("method", "post");
		formObj.submit();

	}


}



 function changeHeart(chemistAnsCode,chemistInCode,chemistCode, e) {
	 //console.log($(e).document.getElementById("noneHeart"));
	// var a = document.getElementById("noneHeart");

		if($(e).find("i#heart").css("display") == "none"){
			$(e).find("i#heart").css("display","")

			$(e).find("i#heart").show();
			$(e).find("i#noneHeart").hide();
		} else {
			$(e).find("i#heart").hide();
			$(e).find("i#noneHeart").show();
		}


<%--


	var data={
			"chemistAnsCode":chemistAnsCode,
			"chemistInCode":chemistInCode,
			"chemistCode": chemistCode
	}

	$.ajax({
		url:"<%=request.getContextPath()%>/replies",
		type:"post",
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			console.log(data);
			alert('댓글이 등록되었습니다.');
			//replyPage=data; //페이지이동
			var qwq1 = document.querySelectorAll(".rte00");
			for(i=0; i<qwq1.length; i++){
				qwq1[i].innerHTML = "";
			}

			//e.parentNode.parentNode.parentNode.innerHTML = "";
			getPage("<%=request.getContextPath()%>/replies/${annapharmIn.chemistInCode}/"+replyPage); //리스트 출력
			$('#newChemistInReply').val("");
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	}); --%>

	var data={
			"chemistAnsCode":chemistAnsCode,
			"chemistInCode":chemistInCode,
			"chemistCode": chemistCode
	}


	$.ajax({
		url:"<%=request.getContextPath()%>/replies/"+chemistAnsCode+"/"+chemistInCode+"/"+chemistCode,
		type:"post",
		data:JSON.stringify(data),
		contentType:"application/json",
		success:function(selectCheInRecom){
			//alert("수정되었습니다.");
<%-- 			var qwq1 = document.querySelectorAll(".rte00");
			for(i=0; i<qwq1.length; i++){
				qwq1[i].innerHTML = "";
			}
			 getPage("<%=request.getContextPath()%>/replies/${annapharmIn.chemistInCode}/"+replyPage);  --%>
			 var like = e.childNodes[1];
			 like.innerHTML = selectCheInRecom;

		},
		error:function(error){
			//alert('수정 실패했습니다.');
			AjaxErrorSecurityRedirectHandler(error.status);
		}
/* 		complete:function(){
			$('#modifyModal').modal('hide');
		} */
	});







}




</script>

<script>
//javascript 소스 코드
/* Handlebars.registerHelper({
	"eq":function(arg1, arg2, options) {
		 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
	}
}); */




//Handlebars 필터함수 및 필터
/* Handlebars.registerHelper({
	"unitFilter" : function(unit){
		var newUnit = unit.slice(0,-1).substr(1);
		return newUnit;
	},
	"componentFilter" : function(component){
		return component.replace(/\[(.*?)\]/gm,'').replaceAll('|',',');
	},
	"signActive" : function(pageNum){
		if(pageNum == nowPage) return 'active';
	},
	"classFilter": function(className){
		return className.replace("의약품","");
	},
	"startNum":function(page){
		return page*5-4;
	},
	"endNum":function(page){
		return page*5;
	},
	"ageRange":function(age){
		var range = age + "~" + (age + 9);
		return range;
	},
	"numToComma":function(num){
		var comma = num.toLocaleString('ko-KR');
		return comma;
	},
	"prettifyDateCompare":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		if(month < 10) month = '0' + month;
		var date=dateObj.getDate();
		if(date < 10) date = '0' + date;
		return year+"."+month+"."+date;
	},
	"inc":function(index){
		return index + 1;
	},
	"eq":function(arg1, arg2, options) {
		 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
	} */

// 	"starCheck": function(selectMd){
// 		if(select)
// 		return null;
// 	}
//});
</script>








