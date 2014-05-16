require 'csv'
require 'pry'




#read_file reads a CSV file, returns has with SKU, item name, and retail price ($$)----------------------------------------------------
def read_file(file_name)
  name_prices_array = []
  CSV.foreach(file_name, headers: true) do |row|
    #hash = Hash[row]
    row_hash = { "name" => row["name"], "SKU" => row["SKU"], "Retail Price" => row["retail_price"]}
    name_prices_array << row_hash
  end
  #puts "Array: #{name_prices_array}"
  return name_prices_array
end
#puts read_file("products.csv")




#merge two arrays of hashes, to one array of hashes
def merge_arrays(original_array, array_quant_sub)
  original_array.each do |nested_hash1|
    array_quant_sub.each do |nested_hash2|
      if nested_hash1["name"] == nested_hash2["name"]
        nested_hash1["quantity"] = nested_hash2["quantity"]
        nested_hash1["subtotal"] = nested_hash2["subtotal"]
      end #end if statement
    end #end inner each loop of nested hashes2
  end #end each loop of nested hashes1
  return original_array
end
#puts merge_arrays([{"name"=>"Light", "SKU"=>"120945", "Retail Price"=>"5"},{"name"=>"Medium", "SKU"=>"679340", "Retail Price"=>"7.50"},{"name"=>"Bold", "SKU"=>"328745", "Retail Price"=>"9.75"}],[{"name"=>"Light", "quantity"=>2, "subtotal"=>10.0},{"name"=>"Medium", "quantity"=>3, "subtotal"=>22.5},{"name"=>"Bold", "quantity"=>4, "subtotal"=>39.0}])









