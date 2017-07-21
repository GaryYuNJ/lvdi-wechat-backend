	 $(function(){
	   initCommunitySelectList();
	  // initLostInfoDetailPop();
	   //$("#pickup_time").datetimepicker();
	   
	   //$( "#pickup_time" ).datepicker( formatDate).attr("readonly", "readonly").css({"background-color":"#FFFFFF"});
	   
	   
	   
	});
	 

	function initLostInfoModalDetail() {
		
		$('#lostInfo_id').val(null);
		$('#object_name').val(null);
		$('#pickup_user_name').val(null);
		$('#datepicker').val(null);
		$('#pickup_location').val(null);
		$('#desc').val(null);
		$('#mobile').val(null);
		$('#claim_location').val(null);
		$('#selectStatus').val("0");
		$('#lost_user_name').val(null);
		$('#lost_user_mobile').val(null);
		$('#lost_user_id').val(null);
		$('#remark').val(null);
		 
   	}
	 
	function popEmptyLostInfoDetail() {
		initLostInfoModalDetail();
		$("#addLostInfo").modal("show");	
   	}
		 
	 function communityChange() {
		 $('#formId').submit();
	 }
	 
	 function popLostInfoDetailById(lostInfoId){
		 $.post( rootUri + '/community/getLostInfoDetailById.shtml',
				   {lostInfoId:lostInfoId},
			    function(result){
					if(result && result.model){
						$("#addLostInfo").modal("show");
						
						$('#lostInfo_id').val(result.model.id);
						$('#object_name').val(result.model.objectName);
						$('#pickup_user_name').val(result.model.pickupUserName);
						$('#datepicker').val(getDateString(result.model.time));
						$('#pickup_location').val(result.model.pickupLocation);
						$('#desc').val(result.model.desc);
						$('#mobile').val(result.model.mobile);
						$('#claim_location').val(result.model.claimLocation);
						$('#selectStatus').val(result.model.status);
						$('#lost_user_name').val(result.model.lostUserName);
						$('#lost_user_mobile').val(result.model.lostUserMobile);
						$('#lost_user_id').val(result.model.lostUserId);
						$('#remark').val(result.model.remark);
						
						$('#update_time').val(getDateTimeString(result.model.updateTime));
						
					}
			},'json');
	 }
	 
	 