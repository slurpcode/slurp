require 'mechanize'
require 'json'

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
#   sleep(1) # Add a small delay

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