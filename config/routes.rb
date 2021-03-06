# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, path: "" do
    namespace :v1, path: "", constraints: ApiConstraint.new(1, true) do
      resources :bucketlists, except: %i(edit new) do
        resources :items, only: %i(create destroy update)
      end

      scope :auth, path: "auth" do
        post "login" => "sessions#login"
        get "logout" => "sessions#logout"
      end

      scope :users, path: "users" do
        post "register" => "users#create"
      end
    end
  end
end
