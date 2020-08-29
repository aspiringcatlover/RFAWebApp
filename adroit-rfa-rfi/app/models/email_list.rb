class EmailList < ApplicationRecord
    belongs_to :rfa
    belongs_to :user
    accepts_nested_attributes_for :rfa, allow_destroy: true
    accepts_nested_attributes_for :user, allow_destroy: true

end
