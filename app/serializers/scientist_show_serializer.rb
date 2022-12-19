class ScientistShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :field_of_study, :avatar, :planets, :missions

  has_many :planets
  # has_many :missions
end
