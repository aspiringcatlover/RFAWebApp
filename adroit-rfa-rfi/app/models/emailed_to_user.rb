class EmailedToUser < ApplicationRecord
    belongs_to :rfa
    belongs_to :user
end
