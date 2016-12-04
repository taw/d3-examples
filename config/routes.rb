Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", controller: "examples", action: "index"
  get "examples/:id", controller: "examples", action: "show"
end
