class Cast < ActiveRecord::Base
    belongs_to :movie
    belongs_to :user

    validates :role, :presence=>true
    validates :actor, :presence=>true
    validate :user_exist

    def actor
        unless self.user.nil?
            username=self.user.username
        else
            return nil
        end
    end
    def actor=(actor_in)
        self.user=User.find_by_username(actor_in)  
    end
private
    def user_exist
        if actor.nil?
            errors.add(:actor, "not found for one or more usernames")            
            false
        else
            true
        end
    end
end
