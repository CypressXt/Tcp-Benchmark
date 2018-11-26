class PositionsController < ApplicationController

  def last
    position = Position.last
    render :json => position
  end

  def more_x
  end

  def more_y
  end

end
