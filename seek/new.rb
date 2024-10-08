require "fileutils"
require "json"
require "mechanize"

def initialize_agent
  agent = Mechanize.new
  agent.user_agent_alias = "Windows Chrome"
  agent
end

def fetch_main_page(agent, site)
  agent.get(site)
end

def scrape_navigation(agent, nav)
  results = {}
  nav.search("li").each do |li|
    link = li.at("a")
    next unless link

    puts "Processing link: #{link['href']}"
    linked_page = agent.click(link)

    linked_page.search("*[data-testid]").each do |element|
      data_testid = element["data-testid"]
      inner_text = element.text.strip
      puts "Found element with data-testid: #{data_testid}, text: #{inner_text}"
      results[data_testid] = inner_text
    end
  end
  results
end

def write_to_json(file_path, data)
  File.write(file_path, JSON.pretty_generate(data))
end

def read_json(file_path)
  JSON.parse(File.read(file_path))
end

def remove_keys(data)
  keys_to_remove = data.keys.select do |key|
    key_without_all = key.sub(/^all-/, "")
    data.key?(key_without_all) && key.start_with?("all-")
  end.map { |key| key.sub(/^all-/, "") }

  keys_to_remove.each { |key| data.delete(key) }
  data
end

def transform_data(data)
  result = {}
  current_category = nil

  data.each do |key, value|
    if key.start_with?("all-")
      current_category = value.sub(/^All\s+/, "")
      result[current_category] = {"all" => key.split("-").last, "list" => []}
    elsif current_category
      cleaned_value = value.sub(/,\s*$/, "")
      result[current_category]["list"] << {key => cleaned_value}
    end
  end
  result
end

def count_keys(data)
  count = 0
  data.each_value do |value|
    count += 1
    count += count_keys(value) if value.is_a?(Hash)
  end
  count
end

def compare_and_update(file1_path, file2_path)
  data1 = read_json(file1_path)
  data2 = read_json(file2_path)

  puts "first 15 keys of file1"
  puts data1.keys.first(15)
  puts "first 15 keys of file2"
  puts data2.keys.first(15)

  total_keys1 = count_keys(data1)
  total_keys2 = count_keys(data2)

  if total_keys2 >= total_keys1
    write_to_json(file1_path, data2) if total_keys2 == total_keys1
    puts "No errors found."
    true
  else
    puts "Errors found."
    false
  end
end

def scrape_and_process
  agent = initialize_agent
  site = "https://www.seek.com.au"
  page = fetch_main_page(agent, site)
  nav = page.at("nav")

  results = scrape_navigation(agent, nav)
  write_to_json("seek/seek_data.json", results)
  puts "Data has been scraped and saved to seek/seek_data.json"

  data = read_json("seek/seek_data.json")
  data = remove_keys(data)
  write_to_json("seek/seek_data.json", data)
  puts "Keys have been removed and the JSON file has been updated."

  transformed_data = transform_data(data)
  write_to_json("seek/new.json", transformed_data)
  puts JSON.pretty_generate(transformed_data)

  compare_and_update("seek/job_ind.json", "seek/new.json")
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
  puts "" # Move to the next line after waiting
end

# Delete the seek/seek_data.json file and the seek/new.json file if they exist
if success
  retries = 0
  max_retries = 10
  begin
    # Overwrite the contents of seek/job_ind.json with the contents of seek/new.json file
    new_data = File.read("seek/new.json")
    File.write("seek/job_ind.json", new_data)

    # Delete the seek/seek_data.json file and the seek/new.json file if they exist
    FileUtils.rm_f("seek/seek_data.json")
    FileUtils.rm_f("seek/new.json")
  rescue StandardError => e
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
