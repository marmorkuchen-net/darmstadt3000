Rails.application.routes.draw do

  devise_for :users, path: 'participants', :controllers => { 'registrations': 'registrations' }

  root 'pages#show', id: 'home'

  resources :pages, :only => [ :show ]

  resources :requirements, :only => [ :update ]
  resources :collaborations, :only => [ :update ]

  get 'calendar', controller: :calendar, action: :index
  get 'blackboard', controller: :black_board, action: :index
  get 'activity', controller: :activity, action: :index
  get 'engagement', controller: :engagement, action: :index

  resources :users, :only => [ :show, :index ], path: 'participants'
  resources :locations, :only => [ :show, :index ]

  resources :productions, :path => 'program' do
    resources :events
  end

  resources :instruments
  resources :devices

  namespace :admin do

    root 'dashboard#index'

    resources :pages
    resources :users
    resources :locations

  end

end
