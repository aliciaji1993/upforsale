require 'rubygems'
require 'nokogiri'
require 'open-uri'

class WelcomeController < ApplicationController
  def index
  	address = "https://www.abercrombie.com/shop/us/womens-clearance/camille-tank-2329577_02"
  	address = "https://www.abercrombie.com/shop/us/womens-dresses-clearance/abra-bodycon-midi-dress-2146069_01"

  	page = Nokogiri::HTML(open(address))

  	@current_price = page.xpath("//meta[@property='og:price:amount']/@content")

  	list_price = page.xpath("//div[@class='price']/h4[contains(concat(' ', @class, ' '), ' list-price ')]/text()").text
  	@list_price = list_price.match(/\$(.*)/)[1]

  	@sizes = Array.new
  	page.xpath("//select[@class='size-select']/option[@data-size-name]/@data-size-name").each do |size|
  		@sizes.append(size.value)
  	end

  	@time = Time.new.inspect

  end
end

