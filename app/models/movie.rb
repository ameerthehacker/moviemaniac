class Movie < ActiveRecord::Base
    has_many :casts, :dependent=>:delete_all
    has_many :teams, :dependent=>:delete_all
    belongs_to :user
    
    validates :title, :presence=>true #, :length=>{ :maximum=>20, :minimum=>6 }
    validates :concept, :presence=>true #, :length=>{ :maximum=>50, :minimum=>20 }
    validates :casts, :presence=>true
    validates :teams, :presence=>true
    validates_associated :teams         
    validates_associated :casts

    accepts_nested_attributes_for :casts, :allow_destroy=>true
    accepts_nested_attributes_for :teams, :allow_destroy=>true
end
