Rails.application.routes.draw do
  devise_for :users,
    path: "",
    path_names: { sign_in: "login", sign_out: "logout", sign_up: "register", edit: "settings" },
    controllers: { registrations: "registrations" }

  root "static_pages#home"
end
