$(function () {
    $("#jqGrid").jqGrid({
        url: '../chargeoverdue/list',
        datatype: "json",
        colModel: [			
			//{ label: 'id', name: 'id', index: 'ID', width: 50, key: true },
			{ label: '用户姓名', name: 'userName', index: 'user_name', width: 80 },
			{ label: '手机号码', name: 'userCode', index: 'user_code', width: 80 },
			{ label: '地址', name: 'address', index: 'address', width: 80 },
			{ label: '地市', name: 'city', index: 'city', width: 80 },
			{ label: '欠费金额', name: 'amount', index: 'amount', width: 80 },
			{ label: '账期', name: 'accountMonth', index: 'account_month', width: 80 },
			{ label: '创建时间', name: 'createDate', index: 'create_date', width: 80 }
			//{ label: '创建人', name: 'createUserId', index: 'create_user_id', width: 80 }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });

	new AjaxUpload('#upload', {
		action: '../chargeoverdue/upload',
		name: 'file',
		autoSubmit:true,
		responseType:"json",
		onSubmit:function(file, extension){
			if (!(extension && /^(xls|xlsx|csv)$/.test(extension.toLowerCase()))){
				alert('只支持excel和csv格式的图片！');
				return false;
			}
		},
		onComplete : function(file, r){
			if(r.code == 0){
				alert(r.url);
				vm.reload();
			}else{
				alert(r.msg);
			}
		}
	});
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			keywords: null
		},
		showList: true,
		title: null,
		chargeOverdue: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.chargeOverdue = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.chargeOverdue.id == null ? "../chargeoverdue/save" : "../chargeoverdue/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.chargeOverdue),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../chargeoverdue/delete",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get("../chargeoverdue/info/"+id, function(r){
                vm.chargeOverdue = r.chargeOverdue;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
				postData:{'keywords': vm.q.keywords},
				page:page
            }).trigger("reloadGrid");
		}
	}
});