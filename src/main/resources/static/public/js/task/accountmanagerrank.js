$(function () {
    $("#jqGrid").jqGrid({
        url: '../accountmanagerrank/list',
        datatype: "json",
        colModel: [
            {label: '客户经理', name: 'accountManagerName', index: 'account_manager_name', width: 80},
            {label: '地市', name: 'city', index: 'city', width: 80},
            {label: '总任务数', name: 'taskNum', index: 'task_num', width: 80},
            {label: '成功数', name: 'taskSuccessNum', index: 'task_success_num', width: 80},
            {
                label: '成功率',
                name: 'taskSuccessRatio',
                index: 'task_success_ratio',
                width: 80,
                formatter: function (value, options, row) {
                    return (value * 100).toFixed(2) + '%';
                }
            },
            {label: '失败数', name: 'taskFailNum', index: 'task_fail_num', width: 80},
            {
                label: '失败率',
                name: 'taskFailRatio',
                index: 'task_fail_ratio',
                width: 80,
                formatter: function (value, options, row) {
                    return (value * 100).toFixed(2) + '%';
                }
            },
            {label: '未完成数', name: 'taskIncompleteNum', index: 'task_incomplete_num', width: 80},
            {
                label: '未完成率',
                name: 'taskIncompleteRatio',
                index: 'task_incomplete_ratio',
                width: 80,
                formatter: function (value, options, row) {
                    return (value * 100).toFixed(2) + '%';
                }
            },
            {label: '账期', name: 'accountDay', index: 'account_day', width: 80},
            {label: '报表时间', name: 'createDate', index: 'create_date', width: 80}
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order"
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        q: {
            keywords: null
        },
        showList: true,
        title: null,
        accountManagerRank: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.accountManagerRank = {};
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
        },
        saveOrUpdate: function (event) {
            var url = vm.accountManagerRank.id == null ? "../accountmanagerrank/save" : "../accountmanagerrank/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.accountManagerRank),
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        del: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../accountmanagerrank/delete",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.code == 0) {
                            alert('操作成功', function (index) {
                                $("#jqGrid").trigger("reloadGrid");
                            });
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        getInfo: function (id) {
            $.get("../accountmanagerrank/info/" + id, function (r) {
                vm.accountManagerRank = r.accountManagerRank;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
        }
    }
});