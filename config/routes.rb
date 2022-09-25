# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'top#index'

  resources :top, only: :index
  resources :univ_my_pages, only: :show
  resources :subjects, only: [:index, :show]
  resources :books, only: [:index, :show, :edit, :update]
  resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :review_thanks, only: :index

  post 'favorite_books/:id', to: 'favorite_books#create', as: 'create_favorite_book'
  get 'favorite_books_list/:id', to: 'favorite_books#show', as: 'favorite_books_list'
  delete 'favorite_books/:id', to: 'favorite_books#destroy', as: 'destroy_favorite_book'

  post 'favorite_reviews/:id', to: 'favorite_reviews#create', as: 'create_favorite_review'
  get 'favorite_reviews_list/:id', to: 'favorite_reviews#show', as: 'favorite_reviews_list'
  delete 'favorite_reviews/:id', to: 'favorite_reviews#destroy', as: 'destroy_favorite_review'

  devise_for :university_students
  devise_for :examinees

  devise_scope :university_student do
    get '/university_students/sign_up' => 'university_students/registrations#new'
    get '/university_students/sign_in' => 'university_students/sessions#new'
    get '/university_students/sign_out' => 'university_students/sessions#destroy'
  end

  devise_scope :examinee do
    get '/examinees/sign_up' => 'examinees/registrations#new'
    get '/examinees/sign_in' => 'examinees/sessions#new'
    get '/examinees/sign_out' => 'examinees/sessions#destroy'
  end
end
