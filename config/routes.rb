Rails.application.routes.draw do

  get 'positions/last' => "positions#last"
  post 'positions/more_x' => "positions#more_x"
  post 'positions/more_y' => "positions#more_y"

end
