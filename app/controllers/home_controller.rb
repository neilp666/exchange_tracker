class HomeController < ApplicationController

  def index
    require 'net/http'
    require 'json'
    #Grab data from coindesk
    @url = 'https://api.coindesk.com/v1/bpi/currentprice.json'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coindesk = JSON.parse(@response)
  end
end
