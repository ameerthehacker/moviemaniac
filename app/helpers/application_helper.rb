module ApplicationHelper
    def link_to_add_fields name, f, association
        new_object=f.object.send(association).klass.new
        fields=f.fields_for association, new_object do |builder|
            render(association.to_s.singularize + "_fields", :builder=>builder)
        end
        link_to name, '#', :class=>'btn btn-xs btn-success btn-add-' + association.to_s.singularize, :data=>{ :fields=>fields.gsub("\n", "") }
    end
    def avatar_url(user)
        gravatar_id=Digest::MD5.hexdigest(user.email.downcase)
        "http://gravatar.com/avatar/#{gravatar_id}.png"
    end
end
