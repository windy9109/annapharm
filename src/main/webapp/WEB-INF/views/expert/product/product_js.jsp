<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>

<script>
	function detailGo(mdNo){
		console.log(mdNo);
		$.ajax({
			url:"productDetail.do",
			data:{"mdNo" : mdNo},
			type:"post",
			success:function(res){
				console.log(res);
				OpenWindow('product_detail.do?from=product&mdNo='+mdNo,'상세보기',700,400);
			},
			error:function(){
				alert('Error...');
			}
		});	
	}
	
	function modifymark(obj){ // 재고 상세보기에서 수정했을시 해당 칸 빨간색 테두리주기
		obj.style.border = '1px solid red';
	}
	
	function detailModify(){
		$('.detailDate').attr("disabled", false);
		$('.detailPosition').attr("disabled", false);
		$('.detailOwnnumStandard')[0].removeAttribute("disabled");
 		
 		$(".detailOwnnumStandard").on('change',function(){
			$('.detailOwnnumStandard').val($(this).val()) ;
		});
	}
	
	function detailSave(){ //재고목록에서 재고 클릭후 수정하는 기능
		var detailQr = document.querySelectorAll(".detailQr");
		var detailDate = document.querySelectorAll(".detailDate");
		var detailPos = document.querySelectorAll(".detailPosition");
		var detailOwnnumS = document.querySelectorAll(".detailOwnnumStandard");
		var detailMdNo = document.querySelectorAll(".detailMdNo"); 
		var pharmacyCode = $('#sessionPharmacyCode').val();
		
		var arr = [];
// 		console.log(detailQr);
		for(var i = 0; i<detailQr.length; i++){
			var obj = "";
			var qr = detailQr[i].value;
			var date = detailDate[i].value;
			var position = detailPos[i].value;
			var os = detailOwnnumS[i].value;
			var mdNo = detailMdNo[i].id;
			 // 여기에다가 약국 코드 줘 기웅아
			obj += '{"pharmacyCode" : "' + pharmacyCode + '"';
			obj += ', "productQr" : "' + qr + '"';
			obj += ', "productDate" : "' + date + '"';
			obj += ', "productOwnnumStandard" : "' + os + '"';
			obj += ', "productPosition" : "' + position + '"';
			obj += ', "mdNo" : "' + mdNo + '"}';
			  
			arr.push(obj);
		}
// 		console.log(JSON.parse(JSON.stringify(arr)));
		console.log(arr);
		$.ajax({
			url:"update.do",
			data:JSON.stringify(arr),
			contentType : "application/json",
			type:"post",
			success:function(res){
// 				console.log(res.productOwnnumStandard);
// 				console.log(res.productPosition);
				alert('수정 되었습니다.');
				$('.detailDate').attr("disabled", true);
				$('.detailDate').css("border","");
				$('.detailPosition').attr("disabled", true);
				$('.detailOwnnumStandard')[0].setAttribute("disabled","disabled"); 
				$('.detailOwnnumStandard')[0].style.border=""; 
				opener.location.reload();
				window.close();
			},
			error:function(){
				alert('수정 실패했습니다.');
			}
		});
		
		$('.detailDate').attr("disabled", true);
		$('.detailPosition').attr("disabled", true);
	}
	
	function detailClose(){
		window.close();
	}
	
	function lackProduct(){
		window.open('lackProOrderWrite.do','발주서 작성','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
	}
	
</script>


















