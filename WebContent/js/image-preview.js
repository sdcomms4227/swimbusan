function imgPreview(obj, allowType) {
	var $preview = $(obj).parent().siblings(".preview");

	if ($preview.length) {
		$preview.remove();
	}

	if (obj.files && obj.files[0]) {
		var fileType = obj.files[0].type.split("/")[0];

		if (fileType == "image") {
			$preview = $("<div class='preview' />");
			$preview.appendTo($(obj).parent().parent());

			var reader = new FileReader();
			reader.readAsDataURL(obj.files[0]);

			reader.onload = function(ProgressEvent) {
				$preview.css("background-image", "url("
						+ ProgressEvent.target.result + ")");
			}
		} else {
			if (allowType == "image") {
				alert("이미지 파일만 첨부하실 수 있습니다.");
				obj.value = "";
			}
		}
	}
}