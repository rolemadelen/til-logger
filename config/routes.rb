Rails.application.routes.draw do
  get "post/index" => "post#index"
  get "post/new" => "post#new"
  get "post/:id" => "post#show"
  post "post/create" => "post#create"

  root to: "post#index"
end
