Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'positions/last' => "positions#last"
  post 'positions/more_x' => "positions#more_x"
  post 'positions/more_y' => "positions#more_y"



end
