/*

    la funzione setAmmount non è stata scritta molto bene, al suo interno vado a generare la tabella e sopratutto
    faccio delle richieste di dati che in realtà avrei già.
    Avendo tempo andremo a migliorare questo js


    Siammo coscenti che manca una inizzializzazione del form nell'edit del modello
 */


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

