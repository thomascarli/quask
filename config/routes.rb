Rails.application.routes.draw do

  resources :questions, except: [:update] do
    resources :answers, only: [:index, :create] do
    end
  end
end
