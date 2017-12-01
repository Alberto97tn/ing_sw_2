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
    font 'Helvetica', style: :normal, size: 12
    data = [[titolo],
            ["<b>Nome</b>: #{@client.name}", " <b>Cognome</b>: #{@client.surname}",
             "<b>Classe</b>: #{@client.company_name}"]]
    table(data, column_widths: [180, 180, 180], cell_style: {inline_format: true}) do |t|
      t.cells.top_padding = 1
      t.cells.border_width = 0
      #  t.row(0).border_top_with = 1
      #  t.row(1).borders = [:bottom, :right, :left]
    end
  end

  def titolo
    content = \
      "<font size='20' align='center'><b>Storico Studente</b></font>"
    {content: content, colspan: 3}
  end
  def reports_table

  end

  def total_table

  end

  def footer

  end


end
