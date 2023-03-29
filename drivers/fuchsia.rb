# frozen_string_literal: true

require "selenium-webdriver"

options = Selenium::WebDriver::Firefox::Options.new
driver = Selenium::WebDriver.for(:firefox, options: options)

begin
  driver.get "https://slurpcode.github.io/slurp/"
  driver.find_element(tag_name: "body").send_keys "matrix", :return
  sleep(30)
  driver.find_element(tag_name: "body").send_keys "jedi", :return
  sleep(30)
  driver.find_element(tag_name: "body").send_keys "midnight", :return
  sleep(15)
  driver.find_element(tag_name: "body").send_keys "king", :return
  sleep(15)
  # driver.find_element(tag_name: "body").send_keys "winter", :return
  # sleep(15)
ensure
  driver.quit
end
