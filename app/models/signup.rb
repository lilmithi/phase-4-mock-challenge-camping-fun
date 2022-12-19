class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity
    validates :time, length: {in: 0..23}
end
