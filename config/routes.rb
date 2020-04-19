Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "caesar_problem" => "pages#caesar_problem", as: :caesar_problem
  root "pages#caesar_problem"
  post "caesar_solve" => "pages#caesar_solve"
  get "caesar_show" => "pages#caesar_show", as: :caesar_show

  get "stock_problem" => "pages#stock_problem", as: :stock_problem
  get "stock_show" => "pages#stock_show", as: :stock_show
  post "stock_solve" => "pages#stock_solve"

  get "substrings_problem" => "pages#substrings_problem", as: :substrings_problem
  get "substrings_show" => "pages#substrings_show", as: :substrings_show
  post "substrings_solve" => "pages#substrings_solve"
end
