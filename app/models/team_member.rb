class TeamMember < ActiveRecord::Base
    belongs_to :team
    belongs_to :user
    
   
    
    def username=(username_in)
        user=User.find_by_username(username_in)
        self.user=user        
    end
    def username
        unless self.user.nil?
            self.user.username
        else
            nil
        end
    end



end
