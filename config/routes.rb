# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :issues, only: %i[index show] do
      resources :events, only: [:index]
    end
  end

  post '/', to: 'webhooks#receive'
end
