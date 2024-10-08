require 'json'

# Load the data from the JSON file
file_path = 'seek_data.json'
data = JSON.parse(File.read(file_path))

# Initialize an empty hash for the new structure
result = {}

current_category = nil

data.each do |key, value|
  if key.start_with?("all-")
    # Create a new category when we encounter an 'all-*' key
    current_category = value.sub(/^All\s+/, '')  # Remove the "All" prefix from the value
    result[current_category] = { "all" => key.split('-').last, "list" => [] }
  else
    # If we have a current category, add the key-value pair to the list
    if current_category
      # Remove trailing comma from the value if it exists
      cleaned_value = value.sub(/,\s*$/, '')
      result[current_category]["list"] << { key => cleaned_value }
    end
  end
end

# Output the new JSON structure
puts JSON.pretty_generate(result)

# Optionally, write the result to a new JSON file
File.write('new.json', JSON.pretty_generate(result))
