Paradime::Application.routes.draw do
  devise_for :users, path_names: { sign_up: 'register', sign_in: 'sign-in', sign_out: 'sign-out' }
  
  match '/listings/manage',  to: 'listings#manage'
  resources :listings do
    collection do
      match 'search' => 'listings#index', via: [:get], as: :search
    end
  end

  root to: 'static_pages#home'
  
  match '/how-it-works',  to: 'static_pages#how_it_works', as: '/how_it_works'
  match '/who-we-are',    to: 'static_pages#who_we_are', as: '/who_we_are'
end
