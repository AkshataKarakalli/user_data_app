Rails.application.routes.draw do
  namespace :api do 
    get 'get_users', action: :getUsers, controller: :users
    post 'add_user',action: :addUser, controller: :users
    get 'show_user',action: :showUser, controller: :users
    put 'update_user',action: :updateUser, controller: :users
    delete 'delete_user',action: :deleteUser, controller: :users
    get 'search', action: :searchUser, controller: :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
