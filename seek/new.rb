require 'json'

# Load the JSON data from the files
file1_path = 'seek/job_ind.json'
file2_path = 'seek/new.json'

file1_content = File.read(file1_path)
file2_content = File.read(file2_path)
# output first 15 key of file1
puts 'heres the first 15 keys of file1'
puts file1_content[0..15]
# output first 15 key of file2
puts 'heres the first 15 keys of file2'
puts file2_content[0..15]
data1 = JSON.parse(file1_content)
data2 = JSON.parse(file2_content)

# Function to count all keys and subkeys in the JSON data
def count_keys(data)
  count = 0
  data.each do |key, value|
    count += 1
    count += count_keys(value) if value.is_a?(Hash)
  end
  count
end

# Count the keys in both JSON data
total_keys1 = count_keys(data1)
total_keys2 = count_keys(data2)

# Compare the total number of keys
if total_keys2 >= total_keys1
  # If they are equal, update job_ind.json with the content of new.json
  if total_keys2 == total_keys1
    File.open(file1_path, 'w') do |file|
      file.write(JSON.pretty_generate(data2))
    end
  end
  puts 'No errors found.'
  puts 0 
  exit 0
else
  puts 'No errors found.'
  puts 1
  exit 1
end