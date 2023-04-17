Rails.application.routes.draw do

  get("/forex", { :controller => "currency", :action => "select_currency" })
  get("/forex/:from_currency", { :controller => "currency", :action => "convert_currency" })
  get("/forex/:from_currency/:to_currency", { :controller => "currency", :action => "conversion_results" })
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
