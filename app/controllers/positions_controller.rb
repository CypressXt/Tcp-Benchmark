class PositionsController < ApplicationController
  before_action :get_last, only: [:last, :more_x, :more_y, :less_x, :less_y]
  skip_before_action :verify_authenticity_token

  def root
    render 'frontend'
  end

  def last
    render :json => @position
  end

  def more_x
    position = Position.new
    position.x = @position.x + 1
    position.y = @position.y
    if position.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        PositionSerializer.new(position)
      ).serializable_hash
      ActionCable.server.broadcast 'positions_channel', serialized_data
      head :ok
    end
  end

  def more_y
    position = Position.new
    position.x = @position.x
    position.y = @position.y + 1
    if position.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        PositionSerializer.new(position)
      ).serializable_hash
      ActionCable.server.broadcast 'positions_channel', serialized_data
      head :ok
    end
  end

  def less_x
    position = Position.new
    position.x = @position.x - 1
    position.y = @position.y
    if position.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        PositionSerializer.new(position)
      ).serializable_hash
      ActionCable.server.broadcast 'positions_channel', serialized_data
      head :ok
    end
  end

  def less_y
    position = Position.new
    position.x = @position.x
    position.y = @position.y - 1
    if position.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        PositionSerializer.new(position)
      ).serializable_hash
      ActionCable.server.broadcast 'positions_channel', serialized_data
      head :ok
    end
  end

  def get_last
    @position = Position.last
    if !@position
      @position = Position.new
      @position.x = 0
      @position.y = 0
      @position.save
    end
    if @position.x == nil
      @position.x = 0
    end
    if @position.y == nil
      @position.y = 0
    end
  end

end
