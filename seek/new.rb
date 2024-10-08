require 'mechanize'
require 'json'

def scrape_and_process
  # Initialize Mechanize agent
  agent = Mechanize.new
  agent.user_agent_alias = 'Windows Chrome'

  # Fetch the main page
  site = 'https://www.seek.com.au'
  page = agent.get(site)

  # Find the navigation element
  nav = page.at('nav')

  # Initialize a hash to store the results
  results = {}

  # Iterate through each `li` element within the `nav`
  nav.search('li').each do |li|
    # Click on the `li` element
    link = li.at('a')
    next unless link

    puts "Processing link: #{link['href']}"
    # sleep(1) # Add a small delay

    # Fetch the linked page
    linked_page = agent.click(link)

    # Find elements with `data-testid` attributes
    linked_page.search('*[data-testid]').each do |element|
      data_testid = element['data-testid']
      inner_text = element.text.strip
      puts "Found element with data-testid: #{data_testid}, text: #{inner_text}"
      # sleep(0.2) # Add a small delay
      results[data_testid] = inner_text
    end
  end

  # Write the results to a JSON file
  File.open('seek_data.json', 'w') do |file|
    file.write(JSON.pretty_generate(results))
  end

  puts 'Data has been scraped and saved to seek_data.json'

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

  # Write the result to a new JSON file
  File.write('new.json', JSON.pretty_generate(result))

  # Load the JSON data from the files
  file1_path = 'seek/job_ind.json'
  file2_path = 'seek/new.json'

  file1_content = File.read(file1_path)
  file2_content = File.read(file2_path)

  data1 = JSON.parse(file1_content)
  data2 = JSON.parse(file2_content)

  puts 'first 15 keys of file1'
  puts data1.keys.first(15)
  puts 'first 15 keys of file2'
  puts data2.keys.first(15)

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
    return true
  else
    puts 'errors found.'
    return false
  end
end

max_retries = 3
attempt = 0

while attempt < max_retries
  attempt += 1
  puts "Attempt #{attempt} of #{max_retries}"
  success = scrape_and_process
  break if success

  puts "Retrying in 30 seconds..."
  30.times do
    print "."
    sleep(1)
  end
  puts ""  # Move to the next line after waiting
end

# Delete the seek_data.json file and the new.json file if they exist
if success
  retries = 0
  max_retries = 3
  begin
    # Overwrite the contents of job_ind.json with the contents of new.json file
    new_data = File.read('seek/new.json')
    File.open('seek/job_ind.json', 'w') do |file|
      file.write(new_data)
    end

    # Delete the seek_data.json file and the new.json file if they exist
    File.delete('seek/seek_data.json') if File.exist?('seek/seek_data.json')
    File.delete('seek/new.json') if File.exist?('seek/new.json')

  rescue => e
    retries += 1
    if retries <= max_retries
      puts "An error occurred: #{e.message}. Retrying (#{retries}/#{max_retries})..."
      sleep(1) # Optional: wait for a second before retrying
      retry
    else
      puts "An error occurred: #{e.message}. Exceeded maximum retries."
      exit 1
    end
  end
else
  puts "Failed after #{max_retries} attempts."
  exit 1
end