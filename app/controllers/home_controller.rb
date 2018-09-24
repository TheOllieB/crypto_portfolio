class HomeController < ApplicationController
  def index
  	require 'net/http'
  	require 'json'
  	@url ='https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=100'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@coins = JSON.parse(@response)
  	@my_coins= ["BTC","XRP","ADA","XLM", "STEEM"]
  end
  def about
  end

  def search
  	require 'net/http'
  	require 'json'
  	@url ='https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=100'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@search_coin = JSON.parse(@response)

  	@symbol = params[:sym]
  	if @symbol 
  		@symbol = @symbol.upcase
  	end

  	if @symbol == ""
  		@symbol = "Please enter a Currency!"
  	end

  end
end