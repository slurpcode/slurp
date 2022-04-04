#!/usr/bin/env ruby
# frozen_string_literal: true

# Reach your final destination

require "chroma"
require "csv"
require "fileutils"
require "kramdown"
require "prawn"
# require 'prawn/table'
require "yaml"

# chart types
chart_types = {"d3pie" => "d3pie",
               "chartjs" => "Chart.js",
               "google" => "Google Charts",
               "plotly" => "plotly.js",
               "all" => "All chart types"}

FileUtils.mkdir_p("site/assets/images/python")
FileUtils.copy_entry("assets", "site/assets")

# this repository is built with these technologies
built_with = {}
CSV.foreach("config/built_with.csv") do |row|
  built_with[:"#{row[0]}"] = row[1]
end

# site JavaScripts
site_scripts = %w[bootstrap/js/jquery.min.js bootstrap/js/bootstrap.min.js]
d3_scripts = %w[assets/js/d3/d3.js assets/js/d3pie.min.js]
google_scripts = %w[https://www.gstatic.com/charts/loader.js https://www.google.com/jsapi]
chartjs_script = %w[assets/js/Chart.min.js]
plotlyjs_script = %w[assets/js/plotly.min.js]

# runs Python from a shell command
def python_charts
  os = RbConfig::CONFIG["host_os"].downcase
  python = "python3"
  python = "python" unless os.include?("linux") || os.include?("darwin")

  # create Python charts for homepage
  `#{python} python/charts.py`
end

# create Python charts for homepage
python_charts

# make the site built with links into kramdown
def kramdown_links(links)
  s = ""
  links.each_with_index do |(key, value), index|
    s += "#{index + 1}. [#{key}](#{value}){:target=\\\"_blank\\\"}{:rel=\\\"noopener\\\"}\n\n"
  end
  s += '

"'
end

# function to open and read in file
def read_file(filename)
  file = File.open(filename, "r")
  data = file.read
  file.close
  data
end

# function
def ii(index)
  index.positive? ? index : ""
end

# Most popular word in the MIT Open source license
def mit_word_count
  read_file("../LICENSE").split.map { |x| x.gsub(/[^a-z0-9]/i, "").downcase }
                         .group_by { |x| x }.map { |k, v| [k, v.size] }.sort_by { |_, y| -y }
end

# returns the filename without its extension
def fir(arr)
  arr.first.split(".").first
end

# common function to write data to file
def write_file(filename, data)
  f = File.open(filename, "w")
  f.write(data)
  f.close
end

def config(built_with)
  # set up the config file
  config = read_file("config.yml").chomp("").chop + kramdown_links(built_with)
  # german
  config_de = read_file("config/de.yml").chomp("").chop + kramdown_links(built_with)

  write_file("site.yml", "#{config}\n\n#{config_de}")

  # load website config file
  site_config = YAML.safe_load(read_file("site.yml"))

  # create README from config file
  write_file("README.md", site_config["about"].gsub('{:target="_blank"}{:rel="noopener"}', ""))
  write_file("lang/README.de.md", site_config["aboutde"].gsub('{:target="_blank"}{:rel="noopener"}', ""))

  site_config
end

# create site config
site_config = config(built_with)

# current chart type
ct = chart_types[site_config["chart_type"]]

# GitHub buttons shown in the footer
def github_buttons(repository, username)
  [
    ["/#{repository}", "Star #{username}/#{repository} on GitHub", "Star", "star"],
    ["/#{repository}/subscription", "Watch #{username}/#{repository} on GitHub", "Watch", "eye"],
    ["/#{repository}/fork", "Fork #{username}/#{repository} on GitHub", "Fork", "repo-forked"]
  ]
end

# create the GitHub buttons
buttons = github_buttons(site_config["repository"], site_config["github_username"])

# create cloc data
# cloc = `cloc . --ignored=ignored.txt --skip-uniqueness --quiet`
cloc = ""

def log_data
  # create git log for histogram on homepage
  log = `git log --pretty=format:"%ad" --date=short`
  write_file("log.txt", log)

  logdata = read_file("log.txt")
  logdata = logdata.lines.group_by(&:strip).map { |k, v| [k, v.size] }
  logdata.unshift(%w[Date Amount])
end

# create git log data
# gitlogdata = log_data

# todo
# create histogram of git log data

# data for the d3pie file type report on home page
def file_extensions
  Dir.glob("**/*").map do |x|
    ext = File.extname(x)
    if ext == ""
      "folders"
    else
      ext[1..]
    end
  end
end

# create color spin
def colors(color, files, count)
  degrees = 360.0 / count
  files.map.with_index(1) do |f, i|
    color[:"#{f}"] = "red".paint.spin(degrees * i)
  end
end

# colors for the file extensions
exthash = {}
uniqfile = file_extensions.uniq
uniqfilesize = uniqfile.size
colors(exthash, uniqfile, uniqfilesize)

# colors for most of the schema charts
schema_colors = {}
schema_files = Dir["data/schema/*.xsd"].map { |x| File.basename(x) }
schema_count = schema_files.size
colors(schema_colors, schema_files, schema_count)

# extensions
allfiles = file_extensions.group_by { |x| x }.map { |k, v| [k, v.size] }

# function that generates the pie chart data
def generate_data
  tokens = []
  # loop over schema files
  Dir.glob("data/schema/*.xsd").map do |schema|
    data = read_file(schema)
    data.scan(/<xs:\w+|\w+="\w+"|\w+="xs:\w+"/).uniq do |x|
      tokens << x unless tokens.include? x
    end
    data.scan(/<xs:\w+ \w+="\w+"/).uniq do |x|
      tokens << x unless tokens.include? x
    end
  end
  # create main data array
  structure = []
  tokens.sort.map.with_index do |x, i|
    structure[i] = [x]
    Dir.glob("data/schema/*.xsd").map do |schema|
      filename = schema.split("/").last
      amount = read_file(schema).scan(x).size
      structure[i] << [filename, amount] unless amount.zero?
    end
  end
  structure
end

# common function that prints the chart title
def chart_title(chart_type, ind)
  "#{ind + 1} - #{chart_type}"
end

# get instance variable page i
def gp(page_number)
  instance_variable_get("@page#{page_number}")
end

# build all the website pages
def page_build(page, page_count, start=0)
  (start..page_count).map do |i|
    instance_variable_set("@page#{ii(i)}", instance_variable_get("@page#{ii(i)}") + page)
  end
end

# add navigation hyperlinks
def add_links(page_count, use_spacing=0)
  page = ""
  (0..page_count).map do |i|
    page += %(
          #{use_spacing.positive? ? '' : '  '}<li><a href="index#{ii(i)}.html">Page #{i + 1}</a></li>)
  end
  page
end

# remove special characters as they clash with JavaScript's naming conventions
def clean_chart(chart)
  chart.tr('<"=: ', "")
end

# add JavaScripts to each page
def add_scripts(scripts, chart_scripts)
  s = ""
  scripts.map do |script|
    s += %(
    <script src="assets/#{script}"></script>)
  end
  chart_scripts.map do |script|
    s += %(
    <script src="#{script}"></script>)
  end
  s
end

# function that draws the d3pie pie chart
def draw_d3pie_chart(type, which, data, num, colors, title, width, height,
                     mainlabelsize, titlesize, valuesize, tooltipsize,
                     segmentsize, pieouterradius, pieinnerradius, piedistance, linesenabled,
                     pulloutsegmentsize, titlefont, footerfont, footerfontsize, backgroundcolor,
                     footercolor)
  high = 1
  seen = []
  element = ""
  data.map do |x|
    if x[1] > high
      high = x[1]
      element = x[0]
    end
    seen << x[1]
  end
  footertext = if high > 1 && seen.size > 1 && seen.count(high) == 1
                 if type.zero?
                   "#{high} \"#{element}\"#{element == 'folders' ? '' : ' files'} occurred most frequently"
                 elsif type == 1
                   "#{high} maximum occurrences in file \"#{element}\""
                 else
                   "#{high} maximum occurrences for the word \"#{element}\""
                 end
               end

  s = "
    var pie = new d3pie('d3pie_chart_div_#{which}', {
        'header': {
            'title': {
                'text': '#{chart_title(title, num)}',
                'fontSize': #{titlesize},
                'font': '#{titlefont}'
            }
        },
        'footer': {
            'text': '#{footertext}',
            'color': '##{footercolor}',
            'fontSize': #{footerfontsize},
            'font': '#{footerfont}',
            'location': 'bottom-center'
        },
        'size': {
            'canvasWidth': #{width},
            'canvasHeight': #{height},
            'pieOuterRadius': '#{pieouterradius}',
            'pieInnerRadius': '#{pieinnerradius}'
        },

        'data': {
            'sortOrder': 'value-desc',
            'smallSegmentGrouping': {
                'enabled': true,
                'value': #{segmentsize}
            },
            'content': ["
  data.each do |x|
    s += if x[0].include?(".") || type != 2
           "{'label':'#{x[0].split('.').first}','value':#{x[1]},'color':'#{colors[:"#{x[0]}"]}'},"
         else
           "{'label':'#{x[0]}','value':#{x[1]},'color':'black'},"
         end
  end
  s.chop!
  s + "
            ]
        },
        callbacks: {
          onMouseoverSegment: function(info) {
            console.log('mouseover:', info);
          },
          onMouseoutSegment: function(info) {
            console.log('mouseout:', info);
          }
        },
        'labels': {
            'outer': {
                'pieDistance': #{piedistance}
            },
            'inner': {
                'format': 'value',
                'hideWhenLessThanPercentage': 3
            },
            'mainLabel': {
                'fontSize': #{mainlabelsize}
            },
            'percentage': {
                'color': '#ffffff',
                'decimalPlaces': 0
            },
            'value': {
                'color': '#ffffff',
                'fontSize': #{valuesize}
            },
            'lines': {
                'enabled': #{linesenabled}
            },
            'truncation': {
                'enabled': true
            }
        },
        'tooltips': {
            'enabled': true,
            'type': 'placeholder',
            'string': '{label}: {value}, {percentage}%',
            'styles': {
                'fadeInSpeed': 586,
                'backgroundOpacity': 0.7,
                'color': '#ffffff',
                'fontSize': #{tooltipsize}
            }
        },
        'effects': {
            'pullOutSegmentOnClick': {
                'effect': 'linear',
                'speed': 400,
                'size': #{pulloutsegmentsize}
            }
        },
        'misc': {
            'colors': {
                'background': '##{backgroundcolor}'
            },
            'gradient': {
                'enabled': true,
                'percentage': 100
            }
        }
    });\n"
end

# built with section on home page
def section_built_with(cloc, site_config)
  s = %(
      <div class="col-md-5">
        #{Kramdown::Document.new(site_config['about'].gsub('[English](README.md) [Deutsche](lang/README.de.md)',
                                                           '')).to_html}
      </div>
      <div class="col-md-7">
        <h3>#{site_config['homepage_subheading4']}</h3>
        <pre>
          <code>
            #{cloc}
          </code>
        </pre>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-12" id="d3pie_chart_div_homepage_all"></div>
    </div>
    <div class="row">
      <div class="col-sm-12" id="d3pie_chart_div_homepage_mit"></div>
    </div>)
  Dir["site/assets/images/python/*"].map do |image|
    s += %(
    <div class="row">
      <img class="img-responsive" src="#{image.split('site/').last}" alt="#{image.split('/').last.split('.').first.capitalize.split('-').join ' '}">
    </div>)
  end
  s
end

# function to make the list of GitHub buttons
def add_github_buttons(arr)
  s = ""
  arr.map do |button|
    s += %(
          <li>
            <a class="github-button" href="https://github.com/slurpcode#{button[0]}")
    s += %( data-icon="octicon-#{button[3]}" ) unless button[3] == ""
    s += %( data-size="large" data-show-count="true" aria-label="#{button[1]}">#{button[2]}</a>
          </li>)
  end
  s
end

# common function to add the apple icons
def add_apple_icons(icon_path)
  icons = Dir.glob("#{icon_path}apple-icon-[0-9]*.png").map do |apple_icon|
    icon_size = apple_icon.split(".").first.split("-").last
    %(
    <link rel="apple-touch-icon" sizes="#{icon_size}" href="#{apple_icon}">)
  end
  icons.sort_by { |x| x.split(".").first.split("-").last.split("x").first.to_i }.join
end

# common function to add the icons
def add_icons
  icon_path = "assets/images/icons/"
  s = add_apple_icons(icon_path)
  b = '<link rel="icon" type="image/png" sizes="'
  j = %(" href="#{icon_path})
  s + %(
    #{b}192x192#{j}android-icon-192x192.png">
    #{b}32x32#{j}favicon-32x32.png">
    #{b}96x96#{j}favicon-96x96.png">
    #{b}16x16#{j}favicon-16x16.png">
    <link rel="manifest" href="#{icon_path}manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="#{icon_path}ms-icon-144x144.png">)
end

# common function to escape double quotes
def escape(text)
  text.gsub('"', '\"')
end

# common function for each Google chart
def draw_google_chart(type, which_chart, data, chart_string, chart_values,
                      chart_title, chart_div, width, height)
  %(
        function drawChart#{which_chart}() {
          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn("string", "#{escape(chart_string)}");
          data.addColumn("number", "#{chart_values}");
          data.addRows(#{data});
          // Set chart options
          var options = {"title": "#{escape(chart_title)}",
                         is3D: #{type.zero?},
                         pieHole: #{type},
                         "pieSliceText": "value",
                         "width": #{width},
                         "height": #{height},
                         "titleTextStyle": {"color": "black"}};
          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById("chart_div_#{chart_div}"));
          chart.draw(data, options);
        }\n)
end

# function to draw the Chart.js charts
def draw_chartjs_chart(type, canvas_id, data, colors, title, titlefontsize, responsive)
  %(
      var ctx = document.getElementById("chartjs_canvas#{canvas_id}");
      var myChart = new Chart(ctx, {
        type: '#{type}',
        data: {
            labels: #{data.map { |x| fir(x) }},
            datasets: [{
                label: '#{title}',
                data: #{data.map(&:last)},
                backgroundColor: #{data.map { |x| colors[:"#{x[0]}"].to_s }}
            }]
        },
        options: {
            responsive: #{responsive},
            title : {
              display: true,
              text: '#{title}',
              fontSize: #{titlefontsize}
            }
        }
      });
  )
end

# function to draw the plotly.js charts
def draw_plotly_chart(chart_div, data, title, height, width, type)
  %(
    var data = [{
      values: #{data.map(&:last)},
      labels: #{data.map { |x| fir(x) }},
      hole: #{type},
      type: 'pie'
    }];

    var layout = {
      title: '#{title}',
      titlefont: {
        size: 12,
        color: 'black'
      },
      height: #{height + (data.size * 15)}, // Each legend entry is 15 high.
      width: #{width},
      showlegend: true,
          legend: {
          "orientation": "h"
        }
      };

    Plotly.newPlot('plotly_chart_div_#{chart_div}', data, layout);
  )
end

# strip p tags from Kramdown output for headings
def gs(text)
  text.gsub(%r{</?p>}, "").strip
end

# replaces 'd3pie' with one of 'Google Charts', 'Chart.js', 'plotly.js' or 'd3pie' or 'All chart types'
# used in h1 on the main charting pages
def site_type(chart_pages_heading, chart_type)
  gs(Kramdown::Document.new(chart_pages_heading.gsub(/d3pie/, chart_type)).to_html)
end

# data variable
structure = generate_data
# home page plus other pages with 50 charts per page
page_count = (structure.size / 50) + 1

# common HTML page header include
def page_header(site_config, page_count)
  # start common page region
  page = %(<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head;
         any other head content must come *after* these tags -->
    <title>#{site_config['title']}</title>)
  page += add_icons
  page += %(
    <meta name="description" content="#{site_config['description']}">
    <meta name="theme-color" content="##{site_config['theme_color']}">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-theme.min.css">
    <style>
      .container-fluid { padding: 0px; }
      .navbar, .navbar-default { margin-bottom: 0; padding: 5pt; background-color: ##{site_config['theme_color']}; font-size: 12pt; }
      .navbar, .navbar-default li a { color: ##{site_config['text_color']} !important; }
      .navbar-default .navbar-brand { margin-left: 20px !important; color: ##{site_config['logo_text_color']}; font-size: 18pt; font-weight: bold; }
      .navbar-brand:hover { background-color: #{site_config['nav_hover_color']} !important; }
      div[id^="d3pie_chart_div_"], canvas { margin-bottom: 100px; }
      footer { background-color: ##{site_config['theme_color']}; min-height: 200px;}
      footer ul a { color: ##{site_config['text_color']} !important; font-size: 13pt; }
      footer .container { margin-left: 15px; }
      .built { text-decoration: none !important; }
      .selected { background-color: #{site_config['nav_selected_color']}; font-weight: bold; }
      .navbar-default li:hover a { background-color: #{site_config['nav_hover_color']} !important; }
      h1 { text-align: center; background-color: ##{site_config['theme_color']}; padding: 14px; color: ##{site_config['text_color']}; }
      pre { white-space: pre-wrap; word-wrap: break-word; }
      .homepage { padding: 5px 30px 5px 30px; }
      .logo { float: left; }
      .oll { padding-left: 1em; }
      h2#other { text-align: center; }
      .plotlypie { height: 625px; }
    </style>
  </head>
  <body>
    <!-- Static navbar -->
    <nav class="navbar navbar-default" id="head1">
      <div class="container-fluid">
        <div class="navbar-header">
          <a href="index.html"><img src="assets/images/logo.png" alt="Ruby Powered" class="logo"></a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.html">#{site_config['nav_heading']}</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">)
  page += add_links(page_count)
  page += %(
          </ul>
        </div>
      </div>
    </nav>
    <div class="container-fluid">)
  (0..page_count).map do |i|
    instance_variable_set("@page#{ii(i)}", page)
  end
end

# start common page region
page_header(site_config, page_count)

# start home page stats
@page += %(
    <h1>#{gs(Kramdown::Document.new(site_config['homepage_heading']).to_html)}</h1>
    <div class="row homepage">)
# add built with links to home page
@page += section_built_with(cloc, site_config)
# main page variable
page = ""
# create main page heading
if site_config["chart_type"] == "all"
  (0..page_count - 1).map do |i|
    type = case i % 8
           when 0..1
             "d3pie"
           when 2..3
             "plotly"
           when 4..5
             "google"
           else
             "chartjs"
           end
    t = site_type(site_config["chart_pages_heading"], chart_types[type])
    instance_variable_set("@page#{i + 1}", instance_variable_get("@page#{i + 1}") + %(
      <h1>#{t}</h1>))
  end
else
  page = %(
      <h1>#{site_type(site_config['chart_pages_heading'], ct)}</h1>)
end
# continue to build all the pages
page_build(page, page_count, 1)
# restart page
page = %(
      <h2 id="other">#{site_config['other_heading']}</h2>)
# continue to build all the pages
page_build(page, page_count, 1)

# add chart divs to each page
structure.map.with_index do |chart, i|
  data0 = clean_chart(chart[0])
  i = (i / 50) + 1
  instance_variable_set("@page#{i}",
                        "#{gp(i)}\n      " +
                        case site_config["chart_type"]
                        when "all"
                          case (i - 1) % 8
                          when 0..1 # d3pie
                            %(
      <div class="col-lg-4 col-md-6 col-sm-12" id="d3pie_chart_div_#{data0}"></div>)
                          when 2..3 # plotly
                            %(
      <div class="col-lg-4 col-md-6 col-sm-12 plotlypie" id="plotly_chart_div_#{data0}"></div>)
                          when 4..5 # google
                            %(
      <div class="col-lg-4 col-md-6 col-sm-12" id="chart_div_#{data0}"></div>)
                          else # chartjs
                            %(
      <div class="col-lg-4 col-md-6 col-sm-12">
        <canvas id="chartjs_canvas#{data0}" width="400" height="350"></canvas>
      </div>)
                          end
                        when "chartjs"
                          %(
      <div class="col-lg-4 col-md-6 col-sm-12">
        <canvas id="chartjs_canvas#{data0}" width="400" height="350"></canvas>
      </div>)
                        else
                          chart_type = site_config["chart_type"] == "plotly" ? " plotlypie" : ""
                          chart_type_id =
                            case site_config["chart_type"]
                            when "google"
                              "chart_div_"
                            when "plotly"
                              "plotly_chart_div_"
                            else
                              "d3pie_chart_div_"
                            end
                          %(
      <div class="col-lg-4 col-md-6 col-sm-12#{chart_type}" id="#{chart_type_id}#{data0}"></div>)
                        end)
end

# site built time for footer and sitemap.xml
sitebuildtime = Time.now.strftime "%FT%T%:z"

# creates HTML footer for all pages before the scripts are inserted
def footer(buttons, page_count, sitebuildtime, site_config)
  s = %(
    </div>
    <footer>
      <div class="container">
        <ul class="list-unstyled">)
  # add GitHub buttons
  s += add_github_buttons(buttons)
  # add general page links
  s += add_links(page_count, 1)
  # add rest of page
  s + %(
          <li class="nuchecker">
            <a target="_blank" rel="noopener">#{site_config['valid_html']}</a>
          </li>
          <li><a href="#head1">#{site_config['back_to_top']}</a></li>
          <li><a class="built">#{site_config['last_update']}#{sitebuildtime}</a></li>
        </ul>
        <a href="https://info.flagcounter.com/9VsC"
           target="_blank" rel="noopener">
          <img src="https://s01.flagcounter.com/countxl/9VsC/bg_FFFFFF/txt_000000/border_CCCCCC/columns_2/maxflags_250/viewers_0/labels_1/pageviews_0/flags_0/percent_0/"
               alt="Flag Counter">
        </a>
        <a id="theend"></a>
      </div>
    </footer>)
end

# restart common page region
page = footer(buttons, page_count, sitebuildtime, site_config)
# continue to build all the websites pages
page_build(page, page_count)
# restart common page
page = ""

# add all the websites external JavaScript files
def add_website_scripts(type, site_scripts, d3_scripts, google_scripts, chartjs_script, plotly_script)
  case type
  when "d3pie"
    add_scripts(site_scripts, d3_scripts)
  when "google"
    add_scripts(site_scripts, google_scripts)
  when "chartjs"
    add_scripts(site_scripts, chartjs_script)
  else
    add_scripts(site_scripts, plotly_script)
  end
end
# add the scripts to each page
if site_config["chart_type"] == "all"
  @page += add_website_scripts("d3pie", site_scripts, d3_scripts, [], [], [])
  (1..page_count).map do |i|
    instance_variable_set("@page#{i}", gp(i) +
      case (i - 1) % 8
      when 0..1 # d3pie
        add_website_scripts("d3pie", site_scripts, d3_scripts, [], [], [])
      when 2..3 # plotly
        add_website_scripts("plotly", site_scripts, [], [], [], plotlyjs_script)
      when 4..5 # google
        add_website_scripts("google", site_scripts, [], google_scripts, [], [])
      else # chartjs
        add_website_scripts("chartjs", site_scripts, [], [], chartjs_script, [])
      end)
  end
else
  page = add_website_scripts(site_config["chart_type"], site_scripts, d3_scripts, google_scripts, chartjs_script,
                             plotlyjs_script)
end

# continue to build all the pages
page += '
    <script>'
# continue to build the websites pages
page_build(page, page_count)
# restart common page
page = ""
# add Google charts JavaScript to the pages that need it
case site_config["chart_type"]
when "all"
  (0..page_count).map do |i|
    next unless [5, 6].include? i % 8

    instance_variable_set("@page#{i}",
                          gp(i) + %(
        google.charts.load("current", {"packages":["corechart"]});\n))
  end
when "google"
  page = %(
        google.charts.load("current", {"packages":["corechart"]});\n)
end
# continue to build the websites pages
page_build(page, page_count)

# add the charts JavaScript
if site_config["chart_type"] == "all"
  # home page
  @page += draw_d3pie_chart(0, "homepage_all", allfiles, 0, exthash, "Branch count of files grouped by file extension", 600, 600, 15, 24, 16, 16, 1,
                            "70%", "35%", 50, false, 35, "open sans", "open sans", 18, "white", "ff0000")
  @page += draw_d3pie_chart(2, "homepage_mit", mit_word_count, 1, exthash, "Most frequent words in the GPL3.0 License", 600, 600, 15, 24, 16, 16, 2,
                            "70%", "35%", 50, true, 35, "open sans", "open sans", 18, "white", "ff0000")

  structure.map.with_index do |chart, ind|
    data0 = clean_chart(chart[0])
    data1 = chart[1..]
    i = (ind / 50) + 1

    case (i - 1) % 8
    when 0..1 # d3pie
      type = i & 1 == 1 ? 0 : "35%"
      instance_variable_set("@page#{i}",
                            gp(i) +
                                draw_d3pie_chart(1, data0, data1, ind, schema_colors, chart[0],
                                                 490, 425, 11, 13, 12,
                                                 12, 3, "75%", type, 20,
                                                 true, 10, "Arial Black",
                                                 "Arial Black", 12, "fff", 999))
    when 2..3 # plotly
      type = i & 1 == 1 ? 0 : 0.4
      instance_variable_set("@page#{i}",
                            gp(i) + draw_plotly_chart(data0, data1, chart_title(chart[0], ind), 400, 400, type))
    when 4..5 # google
      data1 = data1.map { |x| [fir(x), x.last] }
      v = "Values"
      type = i & 1 == 1 ? 0 : 0.4
      instance_variable_set("@page#{i}",
                            gp(i) + "        google.charts.setOnLoadCallback(drawChart#{data0});\n" + draw_google_chart(
                              type, data0, data1, chart[0], v, chart_title(chart[0], ind), data0, 400, 400
                            ))
    else # chartjs
      type = i & 1 == 1 ? "pie" : "doughnut"
      instance_variable_set("@page#{i}",
                            gp(i) + draw_chartjs_chart(type, data0, data1, schema_colors, chart_title(chart[0], ind),
                                                       15, false))
    end
  end
else
  if site_config["chart_type"] == "d3pie"
    # home page two charts
    @page += draw_d3pie_chart(0, "homepage_all", allfiles, 0, exthash, "Branch count of files grouped by file extension", 600, 600, 15, 24, 16, 16, 1,
                              "70%", "35%", 50, false, 35, "open sans", "open sans", 18, "white", "ff0000")
    @page += draw_d3pie_chart(2, "homepage_mit", mit_word_count, 1, exthash, "Most frequent words in the MIT License", 600, 600, 15, 24, 16, 16, 1,
                              "70%", "35%", 50, true, 35, "open sans", "open sans", 18, "white", "ff0000")
  end
  # add all the javascript for each pie chart to the main chart pages
  structure.map.with_index do |chart, ind|
    data0 = clean_chart(chart[0])
    data1 = chart[1..]
    i = (ind / 50) + 1
    case site_config["chart_type"]
    when "d3pie"
      type = i & 1 == 1 ? 0 : "35%"
      instance_variable_set("@page#{i}",
                            gp(i) + draw_d3pie_chart(1, data0, data1, ind, schema_colors, chart[0],
                                                     490, 425, 11, 13, 12,
                                                     12, 3, "75%", type, 20,
                                                     true, 10, "Arial Black",
                                                     "Arial Black", 12, "fff", 999))
    when "google"
      data1 = chart[1..].map { |x| [fir(x), x.last] }
      v = "Values"
      type = i & 1 == 1 ? 0 : 0.4
      instance_variable_set("@page#{i}",
                            gp(i) + "        google.charts.setOnLoadCallback(drawChart#{data0});\n" + draw_google_chart(
                              type, data0, data1, chart[0], v, chart_title(chart[0], ind), data0, 400, 400
                            ))

    when "chartjs"
      type = i & 1 == 1 ? "pie" : "doughnut"
      instance_variable_set("@page#{i}",
                            gp(i) + draw_chartjs_chart(type, data0, data1, schema_colors, chart_title(chart[0], ind),
                                                       15, false))
    else
      type = i & 1 == 1 ? 0 : 0.4
      instance_variable_set("@page#{i}",
                            gp(i) + draw_plotly_chart(data0, data1, chart_title(chart[0], ind), 400, 400, type))
    end
  end
end

# restart common page
page = %(
        $(document).ready(function () {
           "use strict";
           var last = $(location).attr("href").split("/").pop().split(".")[0].replace(/index/, "");
           var tab = 1;
           if (last !== "") {
             tab = parseInt(last) + 1;
           }
           $(".navbar-nav li:nth-child(" + tab + ")").addClass("selected");
           tab--;
           if (tab === 0) {
             tab = "";
           }
           $(".nuchecker a").attr("href", "https://validator.w3.org/nu/?doc=https%3A%2F%2Fslurpcode.netlify.com%2Findex" + tab + ".html");
      });
    </script>
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>)
# finish building all the pages
page_build(page, page_count)

# builds sitemap.xml, robots.txt and writes them and all the sites HTML pages to files
def build_site(page_count, sitebuildtime, url, sitemap_url)
  # write all the HTML pages to files and build the site map
  sitemap = %(<?xml version="1.0" encoding="UTF-8"?>
<urlset
  xmlns="#{sitemap_url}"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="#{sitemap_url}
  #{sitemap_url}/sitemap.xsd">
  <url>
    <loc>#{url}</loc>
    <lastmod>#{sitebuildtime}</lastmod>
    <priority>1.00</priority>
  </url>)
  (0..page_count).map do |i|
    file = File.open("site/index#{ii(i)}.html", "w")
    file.write(instance_variable_get("@page#{ii(i)}"))
    file.close
    sitemap += %(
  <url>
    <loc>#{url}index#{ii(i)}.html</loc>
    <lastmod>#{sitebuildtime}</lastmod>
    <priority>0.80</priority>
  </url>)
  end
  sitemap += '
</urlset>'
  file = File.open("site/sitemap.xml", "w")
  file.write(sitemap)
  file.close
  file = File.open("site/robots.txt", "w")
  file.write("Sitemap: #{url}sitemap.xml")
  file.close
end

# Final Destination 10 ??!!?!!
# https://en.wikipedia.org/wiki/Final_Destination
# http://www.imdb.com/list/ls000699250/
#
build_site(page_count, sitebuildtime, site_config["url"], site_config["maps"])

# f = File.open('index.html', 'r')
# text = f.read
# f.close
# doc = Kramdown::Document.new(text, :input => 'html')
# puts doc.to_html
# g = File.open('latex.tex', 'w')
# g.write(doc.to_latex)
# g.close
