Rails.application.routes.draw do

  resources :questions do, except: [:update]
    resources :answers do, only: [:index, :create]
    end
  end
end
