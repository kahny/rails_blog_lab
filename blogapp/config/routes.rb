Rails.application.routes.draw do
  root to: 'posts#index'
  get '/posts', to: 'posts#index'    #All will reference the controllers(:id, show, new etc).
  get '/posts/new', to:'posts#new'
  get '/posts/:id', to: "posts#show"

  #handle the submitted form
  post '/posts', to: 'posts#create' #create is convention

  #tag related
  get '/tags/:name', to: 'tags#show'

end
