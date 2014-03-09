module AvatarHelper
  def avatar_for(user, options={})
    content_tag :img, '', src: user.avatar_url, class: 'avatar'
  end
end
