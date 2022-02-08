require 'selenium-webdriver'

capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(accept_insecure_certs: true)
driver = Selenium::WebDriver.for :firefox, desired_capabilities: capabilities

begin
  driver.get 'https://fuchsia.surf/'
  driver.find_element(tag_name: 'body').send_keys 'matrix', :return
  sleep(30)
  driver.find_element(tag_name: 'body').send_keys 'jedi', :return
  sleep(60)
ensure
  driver.quit
end
