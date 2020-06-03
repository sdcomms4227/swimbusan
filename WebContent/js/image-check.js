function imgCheck(obj){
	if($(obj).parent().siblings("[name^=oldFile]")){
		var $alertHtml = $('<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>');
		
		if($(obj).val().length > 0){
			$alertHtml.insertBefore($(obj).parent()).fadeIn();
		}else{
			$(obj).parent().siblings(".alert").hide();
		}
	}
}