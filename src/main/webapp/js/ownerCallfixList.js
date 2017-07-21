	 $(function(){
	   initCommunitySelectList();
	});
	 

	function initOwnerCallfixModalDetail() {
		
		$('#ownerCallfix_id').val(null);
		$('#name').val(null);
		$('#organization').val(null);
		$('#object').val(null);
		$('#mobile').val(null);
		$('#callfix_desc').val(null);
		$('#status').val("0");
		$('#mobile').val(null);
		$('#responsible_person').val(null);
		$('#responsible_person_mobile').val(null);
		$('#remark').val(null);
		 
   	}
	 
	function popEmptyOwnerCallfixDetail() {
		initOwnerCallfixModalDetail();
		$("#addOwnerCallfix").modal("show");	
   	}
		 
	 function communityChange() {
		 $('#formId').submit();
	 }
	 
	 function popOwnerCallfixDetailById(ownerCallfixId){
		 $.post( rootUri + '/community/getOwnerCallfixDetailById.shtml',
				   {ownerCallfixId:ownerCallfixId},
			    function(result){
					if(result && result.model){
						$("#addOwnerCallfix").modal("show");
						
						$('#ownerCallfix_id').val(result.model.id);
						
						$('#name').val(result.model.name);
						$('#organization').val(result.model.organization);
						$('#object').val(result.model.object);
						$('#mobile').val(result.model.mobile);
						$('#callfix_desc').val(result.model.callfixDesc);
						$('#status').val("0");
						$('#mobile').val(result.model.mobile);
						$('#responsible_person').val(result.model.responsiblePerson);
						$('#responsible_person_mobile').val(result.model.responsiblePersonMobile);
						$('#remark').val(result.model.remark);
						
					}
			},'json');
	 }
	 
	 