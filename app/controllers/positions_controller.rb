class PositionsController < ApplicationController
  before_action :get_last, only: [:last, :more_x, :more_y]

  def last
    render :json => @position
  end

  def more_x
    @position.x = @position.x + 1
    render :json => @position.save
  end

  def more_y
    @position.y = @position.y + 1
    render :json => @position.save
  end

  def get_last
    @position = Position.last
    if !@position
      @position = Position.new
      @position.x = 0
      @position.y = 0
      @position.save
    end
  end

end
