class HomeController < ApplicationController

  def index
    require 'net/http'
    require 'json'


    #Assign App Id and base currency from Open exchange:
    app_id = ENV['OPEN_API']
    base = "USD"

    #Grab data from Open Exchange
    @open_url = "https://openexchangerates.org/api/latest.json?app_id=#{app_id}&base=#{base}"
    @open_uri = URI(@open_url)
    @open_response = Net::HTTP.get(@open_uri)
    @open = JSON.parse(@open_response)

    #Grab data from coindesk
    @url = 'https://api.coindesk.com/v1/bpi/currentprice.json'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coindesk = JSON.parse(@response)
  end
end
