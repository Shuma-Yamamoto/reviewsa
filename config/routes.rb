# frozen_string_literal: true

Rails.application.routes.draw do
  get 'review_thanks/index'
  get 'home/top'
  root "home#top"

  resources :univ_my_pages, only: :show
  resources :subjects, only: [:index, :show]
  resources :books, only: [:index, :show, :edit, :update]
  resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :review_thanks, only: :index

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
