#!/usr/bin/env ruby
# frozen_string_literal: true

# Need to finish `time`
# Wow, looks like there are still jobs for COBOL

require "csv"
require "fileutils"
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
    attr_accessor :keyword, :location, :range, :worktype, :delay, :time, :print_total

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
  end

  #
  # Return a structure describing the options.
  #
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

agent = Mechanize.new
agent.user_agent_alias = "Windows Chrome"
site = "https://www.seek.com.au"
page =
  agent.get(
    "#{site}/jobs",
    [
      ["keywords", options.keyword],
      ["where", options.location],
      ["daterange", options.range],
      ["worktype", options.worktype]
    ]
  )
results = []
results <<
  [
    "Title",
    "URL",
    "Advertiser",
    "Location",
    "Listing Date",
    "Salary",
    "Classification",
    "Sub Classification",
    # "Work Type",
    "Short Description",
    "Content"
  ]

if options.print_total
  # Using the CSS selector
  element = page.at('#SearchSummary > h1 > span[data-automation="totalJobsCount"]')
  job_count = element ? element.text : "0"
  puts "#{job_count} jobs found"
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
      content = get_script.gsub(/(.*"content\(\{\\"platform\\":\\"WEB\\"\}\)":")(.*?)(".*)/m, '\2')
      results <<
        [
          title,
          url,
          advertiser,
          location,
          listing_date,
          salary,
          classification,
          sub_classification,
          # work_type,
          short_description,
          content
        ]
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
