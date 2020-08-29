class User < ApplicationRecord
    has_many :rfas

    has_many :email_lists, dependent: :destroy
    has_many :rfas, through: :email_lists
    accepts_nested_attributes_for :email_lists
    amoeba do
        enable
    end
end
