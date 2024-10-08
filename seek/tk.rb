require 'json'

# Read the JSON file
file_path = 'seek_data.json'
data = JSON.parse(File.read(file_path))

# Identify keys to remove
keys_to_remove = data.keys.select do |key|
  key_without_all = key.sub(/^all-/, '')
  data.key?(key_without_all) && key.start_with?('all-')
end.map { |key| key.sub(/^all-/, '') }

# Remove the identified keys
keys_to_remove.each { |key| data.delete(key) }

# Write the modified data back to the JSON file
File.open(file_path, 'w') do |file|
  file.write(JSON.pretty_generate(data))
end

puts 'Keys have been removed and the JSON file has been updated.'