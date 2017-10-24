Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  scope :format => true, :constraints => { :format => 'json' } do
    post   "/login"       => "sessions#create"
    delete "/logout"      => "sessions#destroy"
  end

  resources :questions, except: [:update] do
    resources :answers, only: [:index, :create] do
    end
  end

  resources :responses, only: [:create] do
  end
end
