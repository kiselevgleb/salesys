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

var urlVar = window.location.search;
if (urlVar.split("&").length >= 3) {
    // var mas = urlVar.split("&").split("=");
    var starthous = urlVar.split("&")[2].split("=")[1].split("%3A")[0];
    var startmin = urlVar.split("&")[2].split("=")[1].split("%3A")[1];
    var endhous = urlVar.split("&")[3].split("=")[1].split("%3A")[0];
    var endtmin = urlVar.split("&")[3].split("=")[1].split("%3A")[1];

    document.getElementById('startDate').setAttribute("value", urlVar.split("&")[0].split("=")[1]);
    document.getElementById('endDate').setAttribute("value", urlVar.split("&")[1].split("=")[1]);
    document.getElementById('startTime').setAttribute("value", starthous + ":" + startmin);
    document.getElementById('endTime').setAttribute("value", endhous + ":" + endtmin);}
else
    {
        var d = new Date();
        var mas = d.toLocaleDateString().split(".");
        document.getElementById('startDate').setAttribute("value", mas[2] + "-" + mas[1] + "-" + mas[0]);
        document.getElementById('endDate').setAttribute("value", mas[2] + "-" + mas[1] + "-" + mas[0]);
        Array.from(document.querySelectorAll(".form-control1")).forEach(element => element.style.color = "#C3C3C3");
        // document.querySelectorAll(".form-control1").style.color = "grey";
    }
