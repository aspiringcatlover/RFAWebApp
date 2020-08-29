class Rfa < ApplicationRecord


    #validations
    validates :project, presence: true
    validates :request_type, presence: true
    validates :number, presence: {message: "Number cannot be empty."}
    validates :sheet_name, presence: { message: "Type cannot be empty." }
    validates_uniqueness_of :ref, scope: %i[ref rev number], message: "RFA not unique, change either number or type entered."


    has_many_attached :attachments

    belongs_to :project

    has_many :email_lists, dependent: :destroy
    has_many :users, through: :email_lists
    accepts_nested_attributes_for :email_lists, allow_destroy: true

    #has_many :to_users, dependent: :destroy
    #has_many :users, through: :to_users
    #accepts_nested_attributes_for :to_users, allow_destroy: true

    #has_many :replied_by_users
    #has_many :users, :through => :replied_by_users

    #has_many :emailed_to_users
    #has_many :users, :through => :emailed_to_users

    #has_many :users causes amoeba dup to fail


    #for cloning of and creating of next revision of RFA
    amoeba do
        enable
        propagate
    end






    #scopes for filtering
    scope :completed, -> {where(completed: true)}
    scope :not_completed, -> {where(completed: false)}
    scope :lagging, ->{where(status: "LAGGING")}
    scope :approved, -> {where(status: "APPROVED")}


end
