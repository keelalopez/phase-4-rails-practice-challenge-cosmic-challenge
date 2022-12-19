class Mission < ApplicationRecord
    belongs_to :planet
    belongs_to :scientist

    validates_presence_of   :name, :planet_id, :scientist_id
    # ASK LINDSAY
    # validates :scientist_id, uniqueness: {scope: :mission_id}
    validates :scientist_id, uniqueness: true
end
