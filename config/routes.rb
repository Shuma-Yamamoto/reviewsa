Rails.application.routes.draw do
  devise_for :university_students
  devise_for :examinees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
