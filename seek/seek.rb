#!/usr/bin/env ruby
# frozen_string_literal: true

# Need to finish `time`
# Wow, looks like there are still jobs for COBOL

require "csv"
require "fileutils"
require "json"
require "mechanize"
require "optparse"
require "optparse/time"
require "paint"
require "rbconfig"
# require 'pp'

def wtype(worktype)
  case worktype
  when "full"
    242
  when "part"
    243
  when "contract"
    244
  when "casual"
    245
  when "242"
    242
  when "243"
    243
  when "244"
    244
  when "245"
    245
  else
    "242%2C243%2C244%2C245"
  end
end

def enwtype(worktype)
  case worktype
  when 242
    "full"
  when 243
    "part"
  when 244
    "contract"
  when 245
    "casual"
  else
    "all"
  end
end

# Custom OptionParser class
class Parser
  VERSION = "1.0.0"

  # Custom OptionParser ScriptOptions
  class ScriptOptions
    attr_accessor :keyword, :location, :range, :worktype, :delay, :time, :print_total, :lite, :classification, :subclassification, :categories, :discard_salary

    def define_options(parser)
      parser.banner = "Usage: #{Paint['seek.rb [options]', :red, :white]}"
      parser.separator ""
      parser.separator "Specific options:"

      # add additional options
      specify_keyword_option(parser)
      specify_location_option(parser)
      specify_range_option(parser)
      specify_worktype_option(parser)
      delay_execution_option(parser)
      execute_at_time_option(parser)
      print_total_number_option(parser)
      lite_option(parser)
      discard_salary_option(parser)
      categories_option(parser)

      parser.separator ""
      parser.separator "Common options:"
      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      parser.on_tail("-h", "--help", "Show this message") do
        puts parser
        exit
      end
      # Another typical switch to print the version.
      parser.on_tail("--version", "Show version") do
        puts VERSION
        exit
      end
    end

    def categories_option(parser)
      parser.on("--categories [BOOLEAN]", "If BOOLEAN is true or 'yes', prompt for job categories before searching") do |value|
        self.categories = %w[yes Yes YES true].include?(value.to_s) || value == true
      end
    end

    def specify_keyword_option(parser)
      parser.on(
        "-k",
        "--keyword keyword",
        'Keywords to search
                                               separators include:
                                               "and, or, not"'
      ) { |k| self.keyword = k }
    end

    def specify_location_option(parser)
      parser.on("-l", "--location location", "Suburb, city or region") do |l|
        self.location = l
      end
    end

    def specify_range_option(parser)
      parser.on(
        "-r",
        "--range range",
        'Listed time in days
                                                999 (default) or
                                                1, 3, 7, 14, 31 or
                                                any positive number'
      ) { |r| self.range = r }
    end

    def specify_worktype_option(parser)
      parser.on(
        "-w",
        "--worktype worktype",
        'Work type
                                                 all (default)
                                                 full or 242 (full time)
                                                 part or 243 (part time)
                                                 contract or 244 (contract/temp)
                                                 casual or 245 (casual/vacation)'
      ) { |w| self.worktype = wtype(w) }
    end

    def delay_execution_option(parser)
      # Cast 'delay' argument to a Float.
      parser.on("--delay N", Float, "Delay N seconds before executing") do |n|
        self.delay = n
      end
    end

    def execute_at_time_option(parser)
      # Cast 'time' argument to a Time object.
      parser.on(
        "-t",
        "--time [TIME]",
        Time,
        "Begin execution at given time"
      ) { |time| self.time = time }
    end

    def print_total_number_option(parser)
      parser.on("--print-total [BOOLEAN]", "Print the total number of jobs found and don't auto-open the CSV file if BOOLEAN is true or 'yes'") do |value|
        self.print_total = case value
                           when TrueClass, "yes", "Yes", "YES"
                             true
                           when FalseClass, NilClass, "no", "No", "NO"
                             false
                           else
                             value.to_s.casecmp("true").zero? || value.to_s.casecmp("yes").zero?
                           end
      end
    end

    def lite_option(parser)
      parser.on("--lite [BOOLEAN]", "If BOOLEAN is true or 'yes', do not include the content column in the CSV") do |value|
        self.lite = parse_boolean_option(value)
      end
    end

    def discard_salary_option(parser)
      parser.on("--discard-salary [BOOLEAN]", "If BOOLEAN is true or 'yes', do not include the salary column in the CSV") do |value|
        self.discard_salary = parse_boolean_option(value)
      end
    end

    private

    def parse_boolean_option(value)
      case value
      when TrueClass, "yes", "Yes", "YES"
        true
      when FalseClass, NilClass, "no", "No", "NO"
        false
      else
        value.to_s.casecmp("true").zero? || value.to_s.casecmp("yes").zero?
      end
    end
  end

  def parse(args)
    # The options specified on the command line will be collected in
    # *options*.

    @options = ScriptOptions.new
    @args =
      OptionParser.new do |parser|
        @options.define_options(parser)
        parser.parse!(args)
      end
    @options
  end

  attr_reader :parser, :options
end

example = Parser.new
options = example.parse(ARGV)
# pp options # example.options
# pp ARGV

sleep(options.delay) if options.delay
if options.keyword.nil?
  print 'Enter the keywords to search separators include: "and, or, not": '
  options.keyword = $stdin.gets.chomp
end
if options.location.nil?
  print "Enter the suburb, city or region: "
  options.location = $stdin.gets.chomp
end
if options.range.nil?
  print "Listed time in days 999 (default) or 1, 3, 7, 14, 31 or any positive number: "
  options.range = $stdin.gets.chomp
end
if options.worktype.nil?
  print 'Work type
            all (default)
            full or 242 (full time)
            part or 243 (part time)
            contract or 244 (contract/temp)
            casual or 245 (casual/vacation): '
  options.worktype = $stdin.gets.chomp
end
if options.print_total.nil?
  print "Only print the total number of jobs found? (yes/no): "
  options.print_total = $stdin.gets.chomp.casecmp("yes").zero?
end
if options.lite.nil?
  print "Discard the content column in the results? (yes/no): "
  options.lite = $stdin.gets.chomp.casecmp("yes").zero?
end
if options.discard_salary.nil?
  print "Discard the salary column in the results? (yes/no): "
  options.discard_salary = $stdin.gets.chomp.casecmp("yes").zero?
end

if options.categories.nil?
  print "Do you want to select job categories? (yes/no): "
  options.categories = $stdin.gets.chomp.casecmp("yes").zero?
end

if options.categories
  json_file_path = nil
  Dir.entries(__dir__).each do |file|
    if file.casecmp("job_ind.json").zero?
      json_file_path = File.join(__dir__, file)
      break
    end
  end

  if json_file_path && File.exist?(json_file_path)
    begin
      file_content = File.read(json_file_path)
      data = JSON.parse(file_content)
    rescue JSON::ParserError => e
      puts "Error parsing JSON: #{e.message}"
      exit
    end
  else
    puts "Error: job_ind.json not found in the script directory."
    exit
  end

  def get_main_selection(data)
    puts "Select main categories by number (comma-separated):"
    data.keys.each_with_index do |key, index|
      puts "#{index + 1}. #{key}"
    end
    main_choice = $stdin.gets.chomp.downcase
    main_choice.split(",").map(&:strip).map { |i| data.keys[i.to_i - 1] }
  end

  def get_sub_selection(data, selected_main_options)
    selected_options = {}

    selected_main_options.each do |key|
      obj = data[key]
      puts "You selected '#{key}'. Select suboptions by number (comma-separated), or type 'all' to select all:"
      obj["list"].each_with_index do |item, index|
        item_key = item.keys.first
        item_value = item.values.first
        puts "  #{index + 1}. #{item_value} (#{item_key})"
      end
      sub_choice = $stdin.gets.chomp.downcase
      selected_options[key] = {"all" => obj["all"], "list" => []}
      next unless sub_choice != "all"

      sub_choice.split(",").map(&:strip).each do |sub_index|
        selected_options[key]["list"] << obj["list"][sub_index.to_i - 1]
      end
    end

    selected_options
  end

  def create_output_object(selected_options)
    output_obj = {"class" => []}
    selected_options.each_value do |obj|
      if obj["list"].empty?
        output_obj["class"] << {obj["all"] => []}
      else
        grouped_items = obj["list"].group_by { |_item| obj["all"] }
        grouped_items.each do |all_key, items|
          output_obj["class"] << {all_key => items.map { |item| item.keys.first }}
        end
      end
    end
    output_obj
  end

  File.read(json_file_path)

  selected_main_options = get_main_selection(data)

  selected_options = get_sub_selection(data, selected_main_options)

  output_obj = create_output_object(selected_options)
  def extract_keys_and_values(output_obj)
    keys_arr = []
    vals_arr = []

    output_obj["class"].each do |item|
      item.each do |key, values|
        keys_arr << key
        vals_arr.concat(values)
      end
    end

    [keys_arr, vals_arr]
  end
  classification, subclassification = extract_keys_and_values(output_obj)

  classificationstr = classification.join(",")
  options.classification = classificationstr
  # puts "classification str: #{classificationstr}"
  unless subclassification.empty?
    subclassificationstr = subclassification.join(",")
    # puts "subclassification str: #{subclassificationstr}"
    options.subclassification = subclassificationstr
  end
end

agent = Mechanize.new
agent.user_agent_alias = "Windows Chrome"
site = "https://www.seek.com.au"
params = [
  ["keywords", options.keyword],
  ["where", options.location],
  ["daterange", options.range],
  ["worktype", options.worktype]
]
if options.categories
  params << ["classification", options.classification]
  params << ["subclassification", options.subclassification] if options.subclassification
end
page = agent.get("#{site}/jobs", params)
results = [
  ["Title", "URL", "Advertiser", "Location", "Listing Date"] +
    (options.discard_salary ? [] : ["Salary"]) +
    ["Classification", "Sub Classification", "Short Description"] +
    (options.lite ? [] : ["Content"])
]

if options.print_total
  # Using the CSS selector
  element = page.at('#SearchSummary > h1 > span[data-automation="totalJobsCount"]')
  job_count = element ? element.text : "0"
  puts job_count.empty? ? "No jobs found" : "#{job_count} jobs found"
else

  loop do
    # for each page # html = page.body
    jobs = page.search("article")
    jobs.each do |job|
      title = job.xpath("@aria-label")
      url =
        site + job.xpath('descendant::a[@data-automation="jobTitle"]/@href').to_s
      advertiser =
        job.xpath('descendant::a[@data-automation="jobCompany"]/text()')
      location = job.xpath('descendant::a[@data-automation="jobLocation"][1]/parent::span//text()')
      listing_date =
        job.xpath('descendant::span[@data-automation="jobListingDate"]/text()')
      salary =
        job.xpath('descendant::span[@data-automation="jobSalary"]/span/text()')
      classification =
        job.xpath('descendant::a[@data-automation="jobClassification"]/text()')
      sub_classification =
        job.xpath('descendant::a[@data-automation="jobSubClassification"]/text()')
      short_description =
        job.xpath(
          'descendant::span[@data-automation="jobShortDescription"]//text()'
        ).text.split.join(" ")

      # get details from job ad page
      ad = agent.get(url)
      # at selects the first using CSS selectors
      # work_type = ad.at('dd[data-automation="job-detail-work-type"]').text
      # listing_date = ad.at('dd[data-automation="job-detail-date"]').text if listing_date.empty?
      get_script = ad.at('script[data-automation="server-state"]').text
      salary = get_script.gsub(/(.*"jobSalary":")(.*?)(".*)/m, '\2') if salary.empty? && get_script.include?("jobSalary")
      content = options.lite ? nil : get_script.gsub(/(.*"content\(\{\\"platform\\":\\"WEB\\"\}\)":")(.*?)(".*)/m, '\2')
      resultsrow = [
        title,
        url,
        advertiser,
        location,
        listing_date
      ]
      resultsrow << salary unless options.discard_salary
      resultsrow += [
        classification,
        sub_classification,
        # work_type,
        short_description
      ]
      resultsrow << content unless options.lite
      results << resultsrow
    end

    if (link = page.link_with(text: "Next")) # As long as there is still a next page link
      page = link.click
    else
      # If no link left, then break out of loop
      break
    end
  end

  if results.size > 1
    keyword = options.keyword.tr(" ", "-")
    location = options.location.tr(" ", "-") unless options.location.empty?
    range = "range-#{options.range}" unless options.range.empty?
    options.worktype = enwtype(options.worktype)
    # worktype = "worktype-#{options.worktype}" unless options.worktype.empty?
    # filename = [keyword, location, range, worktype].compact.join("-").downcase
    filename = [keyword, location, range].compact.join("-").downcase
    filename = "jobs" if filename.empty?
    filename = filename[1..] if filename[0] == "-"
    FileUtils.mkdir_p("jobs")
    CSV.open("jobs/#{filename}.csv", "w+") do |csv_file|
      results.each { |row| csv_file << row }
    end
    puts "#{results.size - 1} jobs found"

    # determine the current operating system
    host_os = RbConfig::CONFIG["host_os"]

    case host_os
    when /cygwin|mingw|mswin/
      exec(%(start "" "jobs/#{filename}.csv"))
    when /linux/
      exec(%(xdg-open "jobs/#{filename}.csv"))
    when /darwin/
      exec(%(open "jobs/#{filename}.csv"))
    end
  end
end
