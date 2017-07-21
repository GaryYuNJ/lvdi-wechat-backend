	 $(function(){
	   initCommunitySelectList();
	  // initPublicInfoDetailPop();
	});
	 

	function initPublicInfoModalDetail() {
	 	$('#publicInfo_id').val(null);
		$('#title').val(null),
		$('#organization').val(null),
		$('#content').val(null),
		$('#selectStatus').val("1");
		$('#label').val("");
		$('#label_color').val("1");
   	}
	 
	function popEmptyPublicInfoDetail() {
		initPublicInfoModalDetail();
		$("#addPublicInfo").modal("show");	
   	}
		 
	 function communityChange() {
		 $('#formId').submit();
	 }
	 
	 function popPublicInfoDetailById(publicInfoId){
		 $.post( rootUri + '/community/getPublicInfoDetailById.shtml',
				   {publicInfoId:publicInfoId},
			    function(result){
					if(result && result.model){
						$("#addPublicInfo").modal("show");
						
					 	$('#publicInfo_id').val(result.model.id);
						$('#title').val(result.model.title);
						$('#organization').val(result.model.organization);
						$('#content').val(result.model.content);
						$('#selectStatus').val(result.model.status);
						$('#label').val(result.model.label);
						$('#label_color').val(result.model.labelColor);
					}
			},'json');
	 }
	 
	 