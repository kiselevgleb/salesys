var $table = $('#fresh-table'),
    $alertBtn = $('#alertBtn'),
    full_screen = false;

// var d = new Date();
// var  mas = d.toLocaleDateString().split(".");
// document.getElementById('startDate').setAttribute("value", mas[2]+"-"+mas[1]+"-"+mas[0]);
// document.getElementById('endDate').setAttribute("value", mas[2]+"-"+mas[1]+"-"+mas[0]);

$().ready(function () {
    $table.bootstrapTable({
        toolbar: ".toolbar",

        // showRefresh: true,
        search: true,
        pagination: true,
        striped: true,
        pageSize: 8,
        pageList: [8, 10, 25, 50, 100],

        formatShowingRows: function (pageFrom, pageTo, totalRows) {
            //do nothing here, we don't want to show the text "showing x of y from..."
        },
        formatRecordsPerPage: function (pageNumber) {
            return pageNumber + " rows visible";
        },
        icons: {
            refresh: 'fa fa-refresh',
            toggle: 'fa fa-th-list',
            columns: 'fa fa-columns',
            detailOpen: 'fa fa-plus-circle',
            detailClose: 'fa fa-minus-circle'
        }
    });

    $(window).resize(function () {
        $table.bootstrapTable('resetView');
    });


    window.operateEvents = {
        'click .like': function (e, value, row, index) {
            alert('You click like icon, row: ' + JSON.stringify(row));
            console.log(value, row, index);
        },
        'click .edit': function (e, value, row, index) {
            alert('You click edit icon, row: ' + JSON.stringify(row));
            console.log(value, row, index);
        },
        'click .remove': function (e, value, row, index) {
            $table.bootstrapTable('remove', {
                field: 'id',
                values: [row.id]
            });

        }
    };

    $alertBtn.click(function () {
        alert("You pressed on Alert");
    });

});
//
//
// function operateFormatter(value, row, index) {
//     return [
//         '<a rel="tooltip" title="Like" class="table-action like" href="javascript:void(0)" title="Like">',
//         '<i class="fa fa-heart"></i>',
//         '</a>',
//         '<a rel="tooltip" title="Edit" class="table-action edit" href="javascript:void(0)" title="Edit">',
//         '<i class="fa fa-edit"></i>',
//         '</a>',
//         '<a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove">',
//         '<i class="fa fa-remove"></i>',
//         '</a>'
//     ].join('');
// }
//
// var context, form;
//
// function makeEditable(ctx) {
//     context = ctx;
//     context.datatableApi = $("#datatable").DataTable(
//         // https://api.jquery.com/jquery.extend/#jQuery-extend-deep-target-object1-objectN
//         $.extend(true, ctx.datatableOpts,
//             {
//                 "ajax": {
//                     "url": context.ajaxUrl,
//                     "dataSrc": ""
//                 },
//                 "paging": false,
//                 "info": true,
//                 "language": {
//                     "search": i18n["search"]
//                 }
//             }
//         ));
//
//     form = $('#detailsForm');
//     $(document).ajaxError(function (event, jqXHR, options, jsExc) {
//         failNoty(jqXHR);
//     });
//
//     // solve problem with cache in IE: https://stackoverflow.com/a/4303862/548473
//     $.ajaxSetup({cache: false});
//
//     var token = $("meta[name='_csrf']").attr("content");
//     var header = $("meta[name='_csrf_header']").attr("content");
//     $(document).ajaxSend(function (e, xhr, options) {
//         xhr.setRequestHeader(header, token);
//     });
// }
//
//
//
// var failedNote;

// function closeNoty() {
//     if (failedNote) {
//         failedNote.close();
//         failedNote = undefined;
//     }
// }
// function save() {
//     closeNoty();
//     $.ajax({
//         type: "POST",
//         url: context.ajaxUrl,
//         data: form.serialize()
//     }).done(function () {
//         $("#editRow").modal("hide");
//         context.updateTable();
//         successNoty("common.saved");
//     });
// }
// function add() {
//     $("#modalTitle").html(i18n["addTitle"]);
//     form.find(":input").val("");
//     $("#editRow").modal();
// }

$(document).ready(function () {
    closeNoty();

});

function add() {
    $("#editRow").show();
}
// function show() {
//     if (document.getElementById("errName").getAttribute("err")!=null){
//         $("#editRow").show();
//     }
// }
function closeNoty() {
    // if (document.getElementById("errName").getAttribute("usernameError").eq(null)){
        $("#editRow").hide();
    // }
}

function edit(name,id) {
    $("#editRow").show();
    document.getElementById('editName').setAttribute("value", name);
    // document.getElementById('editUserId').setAttribute("value", id);
}

