Rails.application.routes.draw do
  root to: "post#index"
  get "/index" => "post#index"
  get "/index/:search" => "post#index"
  get "/index/tag/:tag" => "post#index"
  get "/archive" => "post#indexArchive"
  get "/tag/:tag" => "post#tag"
  get "/search/:search" => "post#search"
  get "post/:id/archive" => "post#archive"

  post "post/:id/update" => "post#update"
  get "post/:id/edit" => "post#edit"

  get "post/new" => "post#new"
  get "post/:id" => "post#show"
  post "post/create" => "post#create"
end
