class Team < ActiveRecord::Base
    belongs_to :movie
    has_many :team_members, :dependent=>:delete_all
     

    validates :role, :presence=>true
    validates :members, :presence=>true
    validate :members_exist
 

    def members=(usernames)
        users=usernames.split(",")
        team_members=self.team_members                
        unless self.new_record?
            team_members.delete_all            
        end
        users.each do |user|
            team_member=self.team_members.build
            team_member.username=user
            unless team_member.user.nil?
                team_member.save
            end
        end  
    end
    
    def members
        team_members=self.team_members
        usernames=[]
        team_members.each do |team_member|
            unless team_member.user.nil?
                usernames<<team_member.user.username
            else
                nil
            end
        end
        usernames.join(",")
    end

private
    def members_exist
        self.team_members.each do |member|
            if member.user.nil?
                errors.add(:members,"not found for one more usernames")
                false
            else
                true
            end
        end
    end
    
end
