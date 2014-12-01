Rails.application.routes.draw do

  post '/signup', to: 'users#create', as: 'signup_create'
  post '/evaluate_response', to: 'user_responses#evaluateResponse', as: 'evaluate_response'
  root 'welcome#index'
  get  '/new', to: 'welcome#newQuestionInstance', as: 'new_question_instance_helper'

  scope '/admin' do
    get '/', to: 'admin#index'
    scope '/difficulties' do
      get '/', to: 'difficulties#index', as: 'difficulties'
      get '/new', to: 'difficulties#new', as: 'new_difficulty'
      post '/', to: 'difficulties#create', as: 'create_difficulty'
      get '/:id', to: 'difficulties#show', as: 'difficulty'
      patch '/:id', to: 'difficulties#update', as: 'update_difficulty'
      delete '/:id', to: 'difficulties#destroy', as: 'destroy_difficulty'
      get '/:id/edit', to: 'difficulties#edit', as: 'edit_difficulty'
    end
    scope '/users' do
      get '/', to: 'users#index', as: 'users'
      get '/new', to: 'users#new', as: 'new_user'
      post '/', to: 'users#create', as: 'create_user'
      get '/:id', to: 'users#show', as: 'user'
      patch '/:id', to: 'users#update', as: 'update_user'
      delete '/:id', to: 'users#destroy', as: 'destroy_user'
      get '/:id/edit', to: 'users#edit', as: 'edit_user'
    end
    scope '/questions' do
      get '/', to: 'questions#index', as: 'questions'
      get '/new', to: 'questions#new', as: 'new_question'
      post '/', to: 'questions#create', as: 'create_question'
      get '/:id', to: 'questions#show', as: 'question'
      patch '/:id', to: 'questions#update', as: 'update_question'
      delete '/:id', to: 'questions#destroy', as: 'destroy_question'
      get '/:id/edit', to: 'questions#edit', as: 'edit_question'
    end
    scope '/choices' do
      get '/', to: 'choices#index', as: 'choices'
      get '/new', to: 'choices#new', as: 'new_choice'
      post '/', to: 'choices#create', as: 'create_choice'
      get '/:id', to: 'choices#show', as: 'choice'
      patch '/:id', to: 'choices#update', as: 'update_choice'
      delete '/:id', to: 'choices#destroy', as: 'destroy_choice'
      get '/:id/edit', to: 'choices#edit', as: 'edit_choice'
    end
    scope '/question_instances' do
      get '/', to: 'question_instances#index', as: 'question_instances'
      get '/new', to: 'question_instances#new', as: 'new_question_instance'
      post '/', to: 'question_instances#create', as: 'create_question_instance'
      get '/:id', to: 'question_instances#show', as: 'question_instance'
      patch '/:id', to: 'question_instances#update', as: 'update_question_instance'
      delete '/:id', to: 'question_instances#destroy', as: 'destroy_question_instance'
      get '/:id/edit', to: 'question_instances#edit', as: 'edit_question_instance'
    end
    scope '/user_responses' do
      get '/', to: 'user_responses#index', as: 'user_responses'
      get '/new', to: 'user_responses#new', as: 'new_user_response'
      post '/', to: 'user_responses#create', as: 'create_user_response'
      get '/:id', to: 'user_responses#show', as: 'user_response'
      patch '/:id', to: 'user_responses#update', as: 'update_user_response'
      delete '/:id', to: 'user_responses#destroy', as: 'destroy_user_response'
      get '/:id/edit', to: 'user_responses#edit', as: 'edit_user_response'
    end
  end
  
  resources :widgets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


get "leaderboard", to: "leaderboard#show_leaderboard", as: "leaderboard"
get "logout", to: "sessions#destroy", as: "logout"
get "login", to: "sessions#new", as: "login"
get "signup", to: "users#signup", as: "signup"
get "profile", to: "profile#index", as: "profile"

scope '/past' do
    get '/', to: 'past_questions#index', as: 'past_questions'
    get '/:id', to: 'past_questions#show', as: 'past_question'
end

resources :sessions

end
