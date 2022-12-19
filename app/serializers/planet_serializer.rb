class PlanetSerializer < ActiveModel::Serializer
  attributes :id, :name, :distance_from_earth, :image, :nearest_star
end
