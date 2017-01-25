Rails.application.routes.draw do
 
  # get 'static_pages/home'
  root 'static_pages#home'

  # get 'static_pages/about'
  get '/about', to: 'static_pages#about'

  resources :clubs, :meetings, :choices, :books

  # get 'choices/index'

  # get 'choices/show'

  # get 'choices/new'

  # get 'choices/create'

  # get 'choices/edit'

  # get 'choices/update'

  # get 'choices/destroy'

  # get 'meetings/index'

  # get 'meetings/show'

  # get 'meetings/new'

  # get 'meetings/create'

  # get 'meetings/edit'

  # get 'meetings/update'

  # get 'meetings/destroy'

  # get 'clubs/index'

  # get 'clubs/show'

  # get 'clubs/new'

  # get 'clubs/create'

  # get 'clubs/edit'

  # get 'clubs/update'

  # get 'clubs/destroy'

  # get 'books/index'

  # get 'books/show'

  # get 'books/new'

  # get 'books/create'

  # get 'books/edit'

  # get 'books/update'

  # get 'books/destroy'

  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

end
