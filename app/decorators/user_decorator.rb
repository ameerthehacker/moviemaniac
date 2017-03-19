class UserDecorator < Draper::Decorator
  delegate_all

  def avatar
    if model.avatar_url.blank?
      h.image_url('default-user-avatar.jpg')
    else
      model.avatar_url
    end
  end
  def link_to_profile
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
