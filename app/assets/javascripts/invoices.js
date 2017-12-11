App.Invoices = {

    create: function () {
        var reports;

        $("#invoice_client_id").on("change", function () {
            $.get("/reports/unbilled_reports_by_client.json?client_id=" + $("#invoice_client_id").val()).done(function (data) {

                reports = data;
                $("#invoice_reports_ids").select2({
                    placeholder: 'Select the reports',
                    data: reports
                });

                $("#selection_multiple").attr("hidden", false)

            });
        });
        $("#invoice_reports_ids").on("change", function () {
            console.log(reports);


            selected = $("#invoice_reports_ids").val().map(element){
                return reports.map(elem)
            }

            // $("#reports_table").find('tbody').append("<tr><th>"+report.description+"</th><th>"+report.hours+"</th></tr>")
            $("#reports_table > tbody").html("");
            for (i = 0; i < data.length; i = i + 1) {
                row = $('<tr />');
                for (j = 1; j < data[i].length; j = j + 1) {
                    row.append($('<td />').html(data[i][j]));
                }
                console.log(row);
                $("#reports_table > tbody").append(row);
            }

        });


    },
    edit: function () {

    },

    form: function () {

    }


}
;


$(document).on("turbolinks:load", function () {

    if ($(".invoices.new").length > 0) {

        App.Invoices.create();
    }
});

