class SchoolDirector < ApplicationRecord
    has_one :school
    validates :first_name, :last_name, :about, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :mobile_no,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }
    has_one_attached :image
end
