Rails.application.routes.draw do
  root 'top#index'
  post '', :to => 'top#index'
  post 'delete', :to => 'top#delete'
end
