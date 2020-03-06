var d = new Date();
var  mas = d.toLocaleDateString().split(".");
document.getElementById('startDate').setAttribute("value", mas[2]+"-"+mas[1]+"-"+mas[0]);
document.getElementById('endDate').setAttribute("value", mas[2]+"-"+mas[1]+"-"+mas[0]);

var listAjaxUrl = "list/";

function clearFilter() {
    $("#filter")[0].reset();
    $.get(listAjaxUrl, updateTableByData);
}

function updateTableByData(data) {
    context.datatableApi.clear().rows.add(data).draw();
}

function updateFilteredTable() {

    $.ajax({
        type: "GET",
        url: listAjaxUrl + "filter",
        data: $("#filter").serialize()
    }).done(updateTableByData);
}