require 'csv'
require 'pry'



#read_file reads a CSV file, returns has with SKU, item name, and retail price ($$)----------------------------------------------------
def read_file(file_name)
  name_prices_array = []
  CSV.foreach(file_name, headers: true) do |row|
    #hash = Hash[row]
    row_hash = { "Name" => row["name"], "SKU" => row["SKU"], "Retail Price" => row["retail_price"]}
    name_prices_array << row_hash
  end
  #puts "Array: #{name_prices_array}"
  return name_prices_array
end
#puts read_file("products.csv")


#writes to a CSV file from a hash--------------------------------------------------
def writeCSV(hash)
  CSV.open("results.csv", "w") do |csv|
    csv << [$light_hash["SKU"], $light_quantity_global["quantity"]]
    csv << [$medium_hash["SKU"], $medium_quantity_global["quantity"]]
    csv << [$bold_hash["SKU"], $bold_quantity_global["quantity"]]
  end
end
#writeCSV
