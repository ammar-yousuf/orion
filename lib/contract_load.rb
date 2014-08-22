require_relative "excel_load.rb"

class ContractLoad
	def self.run(file="sample.xls")
		result = ExcelLoad.open_excel_file(file)
  	update_contracts_table(result)
	end

	def self.update_contracts_table(result)
		puts result.inspect
	end
end
