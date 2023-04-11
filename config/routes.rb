Rails.application.routes.draw do

  get("/forex", { :controller => "currency", :action => "select_currency" })
  # get("/forex/:currencies"), { :controller => "currency", :action => "convert_currency" })
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
