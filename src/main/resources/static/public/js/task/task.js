$(function () {
    $("#jqGrid").jqGrid({
        url: '../task/list',
        datatype: "json",
        colModel: [
			{ label: '任务创建时间', name: 'createDate', index: 'create_date', width: 80 },
			{ label: '任务创建人', name: 'createUserName', index: 'create_user_name', width: 80 },
			{ label: '欠费人', name: 'userName', index: 'user_name', width: 80 },
            { label: '客户经理工号', name: 'accountManagerNo', index: 'account_manager_no', width: 80 },
            { label: '客户经理', name: 'accountManagerName', index: 'account_manager_name', width: 80 },
			{ label: '任务状态', name: 'result', index: 'result', width: 80 ,formatter: function(value, options, row){
                if(value == 0){
                    return '<span class="label label-danger">待处理</span>';
                }
                else if(value == 1){
                    return '<span class="label label-success">成功</span>';
                }
                else if(value == 2){
                    return '<span class="label label-info">用户拒绝</span>';
                }
                else if(value == 3){
                    return '<span class="label label-warning">未联系上</span>';
                }
                else if(value == 4){
                    return '<span class="label label-primary">其它</span>';
                }
            }},
			{ label: '备注', name: 'remark', index: 'remark', width: 80 }
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
});

var vm = new Vue({
	el:'#rrapp',
	data:{
        q:{
            userName: null
        },
		showList: true,
		title: null,
		task: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.task = {};
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
			var url = vm.task.id == null ? "../task/save" : "../task/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.task),
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
				    url: "../task/delete",
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
			$.get("../task/info/"+id, function(r){
                vm.task = r.task;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                postData:{'userName': vm.q.userName},
                page:page
            }).trigger("reloadGrid");
		}
	}
});