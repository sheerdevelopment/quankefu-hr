Rails.application.routes.draw do
  resources :tenancies
  resources :certificates

  devise_for :users,
    path: "",
    path_names: { sign_in: "login", sign_out: "logout", sign_up: "register", edit: "settings" },
    controllers: { registrations: "registrations" }

  root "static_pages#home"
end
