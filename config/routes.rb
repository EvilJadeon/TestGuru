# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options :host => 'thejadeontestguru.herokuapp.com'

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
