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

end
