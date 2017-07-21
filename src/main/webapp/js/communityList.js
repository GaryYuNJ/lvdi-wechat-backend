   //省信息
   function queryProvinceInfo() {
	   $.post( rootUri + '/community/queryAllProvinceInfo.shtml',
			{},
		    function(result){
			if(result && result.data && result.data.length){

				var html =[];
				$.each(result.data,function(){
					html.push('<option value="'+this.code+'">'+this.name+'</option>');
				});
				
				$("#province").html('<option value="0">-选择省-</option>' + html.join(""));
				
			}
		},'json');
	   
	   provinceChange();
   }
   
   function provinceChange() {
	   
	   var provinceCode = $("#province").val();
	   queryCityInfoByProvince(provinceCode, null);
	   
	   var cityCode = $("#city").val();
	   queryDistrictInfoByCity(cityCode, null);
   }
   
   function cityChange() {
	   
	   var cityCode = $("#city").val();
	   queryDistrictInfoByCity(cityCode, null);
   }
   
   //市信息
   function queryCityInfoByProvince(provinceCode, selectedSpecificCityCode) {
	   $.post( rootUri + '/community/queryCityInfoByProvince.shtml',
			{provinceCode:provinceCode},
		    function(result){
				if(result && result.data && result.data.length){

					var html =[];
					$.each(result.data,function(){
						html.push('<option value="'+this.code+'">'+this.name+'</option>');
					});
					
					$("#city").html('<option value="0">-选择市-</option>' + html.join(""));
					
					if(null != selectedSpecificCityCode && '' != selectedSpecificCityCode){
						$("#city").val(selectedSpecificCityCode);
					}
				}
		},'json');
   }
   
   //区域信息
   function queryDistrictInfoByCity(cityCode, selectedSpecificDistrictCode) {
	   $.post( rootUri + '/community/queryDistrictInfoByCity.shtml',
			{cityCode:cityCode},
		    function(result){
				
				if(result && result.data && result.data.length){

					var html =[];
					$.each(result.data,function(){
						html.push('<option value="'+this.code+'">'+this.name+'</option>');
					});
					
					$("#district").html('<option value="0">-选择区/县-</option>' + html.join(""));
					
					if(null != selectedSpecificDistrictCode && '' != selectedSpecificDistrictCode){
						$("#district").val(selectedSpecificDistrictCode);
					}
				}
		},'json');
   }
   
   
   //物业公司
   function queryAllPropertyCompany() {
	   $.post( rootUri + '/community/queryAllPropertyCompany.shtml',
			{},
		    function(result){
				if(result && result.data && result.data.length){

					var html =[];
					$.each(result.data,function(){
						html.push('<option value="'+this.id+'">'+this.name+'</option>');
					});
					
					$("#property_company").html('<option value="0">-选择物业公司-</option>' + html.join(""));
					
				}
		},'json');
   }
   
   //
   function popCommunityDetailById(id) {
	   $.post( rootUri + '/community/getCommunityDetailById.shtml',
			   {communityId:id},
		    function(result){
				if(result && result.model){
					
					$("#addCommunity").modal("show");
					
					$("#community_id").val(result.model.id);
					$("#community_name").val(result.model.name);
					$("#community_code").val(result.model.code);
					$("#community_addr").val(result.model.address);
					$("#property_company").val(result.model.propertyCompanyId);
					$("#update_user").val(result.model.updateUser);
					$("#update_time").val(result.model.updateTime);

					$("#province").val(result.model.provinceCode);
				    queryCityInfoByProvince($("#province").val(), result.model.cityCode);
				    
				    queryDistrictInfoByCity(result.model.cityCode, result.model.districtCode);
					
				}
		},'json');
   }
   
   function popEmptyCommunityDetail() {
	   initCommunityDetailPop();
	   $("#addCommunity").modal("show");
   }
   
   //初始化。
   function initCommunityDetailPop() {
		
	    $("#community_id").val("");
		$("#community_name").val("");
		$("#community_code").val("");
		$("#community_addr").val("");
		
		$("#update_user").val("");
		$("#update_time").val("");
		
		$("#province").val(0);
		$("#city").val(0);
		$("#district").val(0);
		$("#property_company").val(0);
		
   }
   
   