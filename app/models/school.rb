class School < ApplicationRecord
    belongs_to :school_director
    validates_uniqueness_of :school_uniq_id, :presence => true
    validates :school_name,:presence => true, :length => { :minimum => 5, :maximum => 30}
    has_many :teacher

end
