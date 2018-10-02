class HomeController < ApplicationController
  def index
  	require 'net/http'
  	require 'json'
  	@url ='https://api.coinmarketcap.com/v1/ticker/?convert=gbp&limit=50'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@coins = JSON.parse(@response)
  end
  
  def about
  end

  def search
  	require 'net/http'
  	require 'json'
  	@url ='https://api.coinmarketcap.com/v1/ticker/?convert=gbp&limit=50'
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