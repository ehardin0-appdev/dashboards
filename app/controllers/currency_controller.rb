class CurrencyController < ApplicationController

  def select_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")


    @array_of_currencies = @symbols_hash.keys
    render({ :template => "currency_templates/selection.html.erb"})
  end

  def convert_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")


    @array_of_currencies = @symbols_hash.keys

    #params are
    @from_currency = params.fetch("from_currency")

    # @raw_data = open("https://api.exchangerate.host/convert?from=USD&to=EUR").read
    # @parsed_data = JSON.parse(@raw_data)
    # @symbols_hash = @parsed_data.fetch("symbols")


    # @array_of_currencies = @symbols_hash.keys
    render({ :template => "currency_templates/conversion.html.erb"})
  end

  def conversion_results
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")


    @array_of_currencies = @symbols_hash.keys

    #params are
    @from_currency = params.fetch("from_currency")
    @to_currency = params.fetch("to_currency")
    
    @currency_conversion_raw = open("https://api.exchangerate.host/convert?from=#{@from_currency}&to=#{@to_currency}").read
    @currency_conversion_parsed = JSON.parse(@currency_conversion_raw)
    @info_hash = @currency_conversion_parsed.fetch("info")
    @rate_hash = @info_hash.fetch("rate")


    render({ :template => "currency_templates/results.html.erb"})
  end
end
