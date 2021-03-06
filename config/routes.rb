Rails.application.routes.draw do
  resources :absences do
    post "/admin_action" => "absences#admin_action"
  end
  resources :employees
  resources :diaries
  resources :projects do
    post "/admin_action" => "projects#admin_action"
  end

  devise_for :users,
    path: "",
    path_names: { sign_in: "login", sign_out: "logout", sign_up: "register", edit: "settings" },
    controllers: { registrations: "registrations" }

  root "static_pages#home"
end
