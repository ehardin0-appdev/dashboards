class CurrencyController < ApplicationController

  def select_currency

    @c
    render({ :template => "currency_templates/selection.html.erb"})
  end

  def convert_currency
    render({ :template => "currency_templates/conversion.html.erb"})
  end
end
