App.Invoices = {

    create: function () {

        $("#invoice_client_id").on("change", function () {

                $.get("/reports/unbilled_reports_by_client.json?client_id=" + $("#invoice_client_id").val()).done(function (data) {
                    console.log("lol", data);
                    $("#invoice_reports_ids").select2({
                        placeholder: 'Select the reports',
                        data: data
                    });

                    $("#selection_multiple").attr("hidden", false)

                });
            }
        )
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

