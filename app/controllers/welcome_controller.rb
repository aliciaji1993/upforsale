require 'rubygems'
require 'nokogiri'
require 'open-uri'

class WelcomeController < ApplicationController
  def index
  	address = "https://www.abercrombie.com/shop/us/womens-clearance/camille-tank-2329577_02"
  	address = "https://www.abercrombie.com/shop/us/womens-dresses-clearance/abra-bodycon-midi-dress-2146069_01"

  	page = Nokogiri::HTML(open(address))

  	@price = page.xpath("//meta[@property='og:price:amount']/@content")

  	@sizes = Array.new
  	page.xpath("//select[@class='size-select']/option[@data-size-name]/@data-size-name").each do |size|
  		@sizes.append(size.value)
  	end

  	@time = Time.new.inspect

  end
end

