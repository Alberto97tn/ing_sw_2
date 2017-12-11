class InvoicePdf
  include Prawn::View

  def initialize(inovice, client, view)
    super()
    @view = view
    @invoice = inovice
    @client = client
    header_table
    reports_table_header
    reports_table_body
    total_table
    footer
  end

  def header_table
    font 'Helvetica', style: :normal, size: 11
    data = [[titolo],
            ["<b>Cliente</b>: #{@client.full_name}"], # fine riga
            ["<b>Company</b>: #{@client.company_name}"], # fine riga
            ["<b>Email</b>: #{@client.email}"], # fine riga
            ["<b>Vat Number</b>: #{@client.vat_number}"], # fine riga
            ["<b>Phone Number</b>: #{@client.phone_number}"], # fine riga
            ["<b>Phone Address</b>: #{@client.address}"], # fine riga # Fine colonna
            ["<b>Hourly cost</b>: #{@invoice.hourly_cost}$"]] # fine riga # Fine colonna

    table(data, column_widths: [], cell_style: {inline_format: true}) do |t|
      t.cells.top_padding = 1
      t.cells.border_width = 0
      # t.row(0).border_top_with = 1
      # t.row(1).borders = [:bottom, :right, :left]
    end
    move_down 20
  end

  def titolo
    content = \
      "<font size='40' align=''><b>Invoice</b></font>"
    {content: content, colspan: 3}
  end

  def reports_table_header
    data = [["Desription", "Hours", "Price"]]

    table(data, column_widths: [180, 180, 180]) do |t|
      t.cells.top_padding = 1
      t.cells.border_width = 1#{report.hours * @invoice.hourly_cost}
      t.row(0).font_style = :bold
      t.row_colors = %w[DDDDDD FFFFFF]
      t.header = true
    end
  end

  def reports_table_body
    @invoice.reports.each do |report|
      data = [[report.description, report.hours, "#{report.hours * @invoice.hourly_cost} $"]]
      table(data, column_widths: [180, 180, 180]) do |t|
        t.cells.top_padding = 1
        t.cells.border_width = 1
        t.header = true
      end
    end
  end

  def total_table
    data = [["Amount:", "#{@invoice.amount} $"],
            ["Amount with vat #{@invoice.vat}%", "#{@invoice.amount * (1 + @invoice.vat / 100)} $"]]
    table(data, column_widths: [100, 180], cell_style: {inline_format: true}, :position => :right) do |t|
      t.cells.top_padding = 1
      t.cells.border_width = 1
    end
  end

  def footer
    image "#{Rails.root}/app/assets/material-admin/img/manageImg.png", height: 50, at: [7, 45], vpostion: :bottom
  end
end
