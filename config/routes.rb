Rails.application.routes.draw do

  get 'positions/last' => "positions#last"
  post 'positions/more_x' => "positions#more_x"
  post 'positions/more_y' => "positions#more_y"
  post 'positions/less_x' => "positions#less_x"
  post 'positions/less_y' => "positions#less_y"

end
