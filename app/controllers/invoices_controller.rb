class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]


  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @reports = Report.where(invoice_id: @invoice.id)
    @client = Client.find(@invoice.client_id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new( @client,view_context)
        send_data pdf.render,
                  filename: "Invoice_#{@invoice.date}.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new(vat: 22, hourly_cost: 15, invoice_number: Invoice.count+1)
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    puts "reports_ids: "
    puts params[:reports_ids]
    reports_ids = [1, 2]

    respond_to do |format|
      if @invoice.save
        Report.where(id: reports_ids).update_all(invoice_id: @invoice.id)
        format.html {redirect_to @invoice, notice: 'Invoice was successfully created.'}
        format.json {render :show, status: :created, location: @invoice}
      else
        format.html {render :new}
        format.json {render json: @invoice.errors, status: :unprocessable_entity}
      end
    end


  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html {redirect_to @invoice, notice: 'Invoice was successfully updated.'}
        format.json {render :show, status: :ok, location: @invoice}
      else
        format.html {render :edit}
        format.json {render json: @invoice.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html {redirect_to invoices_url, notice: 'Invoice was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invoice_params
    params.require(:invoice).permit(:date, :client_id, :invoice_number, :amount, :vat, :hourly_cost, :reports_ids)
  end
end
