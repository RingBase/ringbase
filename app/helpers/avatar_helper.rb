require 'digest/md5'

module AvatarHelper

  DEFAULT_SIZE = 60 # px

  def avatar_for(user, options={})
    email = user.email.downcase
    hash  = Digest::MD5.hexdigest(email)
    src   = "http://www.gravatar.com/avatar/#{hash}"
    size  = options.delete(:size) || DEFAULT_SIZE
    src += "?s=#{size}"

    content_tag :img, '', src: src, class: 'avatar'
  end

end
