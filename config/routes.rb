Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'restaurants#index'

  # A visitor can add a new review to a restaurant
  # => GET "restaurants/38/reviews/new" (nested resources)
  # => POST "restaurants/38/reviews"

  # A visitor CANNOT update / delete any restaurant or review.

  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create]
    # GET restaurants/42/reviews/new
  end

  resources :reviews, only: [:show]
end


#                Prefix Verb URI Pattern                                       Controller#Action
#                  root GET  /                                                 restaurants#index
#    restaurant_reviews POST /restaurants/:restaurant_id/reviews(.:format)     reviews#create
# new_restaurant_review GET  /restaurants/:restaurant_id/reviews/new(.:format) reviews#new
#           restaurants GET  /restaurants(.:format)                            restaurants#index
#                       POST /restaurants(.:format)                            restaurants#create
#        new_restaurant GET  /restaurants/new(.:format)                        restaurants#new
#            restaurant GET  /restaurants/:id(.:format)                        restaurants#show
#                review GET  /reviews/:id(.:format)                            reviews#show
