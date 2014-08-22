#!/usr/bin/ruby -w

require 'roo'

module ExcelLoad
	def ExcelLoad.open_excel_file(file)
    input_file = File.join(Rails.root, 'db', 'populate', 'excel_data', file)
    s = Roo::Excel.new(input_file)
    s.default_sheet = s.sheets.first

    # Get a Hash version of the Spreadsheet, 1st sheet    
    result = read_each_row(s)
  end

  def ExcelLoad.read_each_row(sheet)
    sheet_headers = sheet.row(1)
    array_of_rows = []

    2.upto(sheet.last_row) do | row_number |
      row = sheet.row(row_number)
      new_row = {}

      sheet_headers.each_with_index do |header, index|
        new_row[header] = row.at(index)
      end
      
      array_of_rows << new_row      
    end
    array_of_rows
  end

end