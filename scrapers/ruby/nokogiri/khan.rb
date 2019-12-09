#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

def get_energy_points(user)
  uri = URI.parse("https://www.khanacademy.org/profile/#{user}/")
  doc = Nokogiri::HTML(uri.open)
  res = doc.xpath('//script[contains(.,"prefersReducedMotion")]')
           .to_s.scan(/points":(\d+),"prefersReducedMotion/)
  res.size.positive? ? res : 'Not found'
end

puts get_energy_points('XSLTGod')
