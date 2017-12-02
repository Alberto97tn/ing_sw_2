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
           console.log($("#invoice_reports_ids").val());
        });
    },
    edit: function () {

    }
    ,

    form: function () {

    }


}
;


$(document).on("turbolinks:load", function () {

    if ($(".invoices.new").length > 0) {

        App.Invoices.create();
    }
});

