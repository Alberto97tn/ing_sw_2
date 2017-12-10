class InvoicePdf
  include Prawn::View

  def initialize(client, view)
    super()
    @view = view
    @client = client
    header_table
    reports_table
    total_table
    footer
  end

  def header_table
    font 'Helvetica', style: :normal, size: 11
    data = [[titolo],
            ["<b>Cliente</b>: #{@client.fullname}"], # fine riga
            ["<b>Company</b>: #{@client.company_name}"], # fine riga
            ["<b>Email</b>: #{@client.email}"], # fine riga
            ["<b>Vat Number</b>: #{@client.vat_number}"], # fine riga
            ["<b>Phone Number</b>: #{@client.phone_number}"], # fine riga
            ["<b>Phone Address</b>: #{@client.address}"]] # fine riga # Fine colonna

    table(data, column_widths: [], cell_style: { inline_format: true }) do |t|
      t.cells.top_padding = 1
      t.cells.border_width = 0
      # t.row(0).border_top_with = 1
      # t.row(1).borders = [:bottom, :right, :left]
    end
    move_down 20
  end

  def titolo
    content = \
      "<font size='40' align=''><b>Fattura</b></font>"
    { content: content, colspan: 3 }
  end

  def reports_table
    data = [%w[Report Desription Hours Price]]


    table(data) do |t|
      t.cells.top_padding = 1
      t.cells.border_width = 1
      t.row(0).font_style = :bold
      t.row_colors = %w[DDDDDD FFFFFF]
      t.header = true
    end
  end

  def total_table; end

  def footer; end
end
