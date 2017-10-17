Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  resources :questions, except: [:update] do
    resources :answers, only: [:index, :create] do
    end
  end

  resources :responses, only: [:create] do
  end
end
