class PositionSerializer < ActiveModel::Serializer
  attributes :id, :x, :y, :created_at, :updated_at
end
