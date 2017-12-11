App.Invoices = {

    create: function () {

        /*function search(nameKey, myArray) {
            for (var i = 0; i < myArray.length; i++) {
                if (myArray[i].name === nameKey) {
                    return myArray[i];
                }
            }
        }*/

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
            App.Invoices.setAmmount();
        });
        $("#invoice_hourly_cost").on("change", function () {
            App.Invoices.setAmmount();
        });

    },

    setAmmount: function () {
        var hours = 0;
        var ids = $("#invoice_reports_ids").val();
        $("#reports_table > tbody").html("");
        for (i = 0; i < ids.length; i++) {
            $.get("/reports/" + ids[i] + ".json").done(function (report) {
                var row = $('<tr />');
                row.append($('<td />').html(report.description));
                row.append($('<td />').html(report.hours));
                $("#reports_table > tbody").append(row);

                hours += report.hours;
                ammount = hours * $("#invoice_hourly_cost").val();
                $("#invoice_amount").val(ammount);

            });
        }

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

