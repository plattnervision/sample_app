module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  # what is this doing?
  # assigns gravatar_id to the MD5 Hash of the lower case version
  # of the user.email.downcase(user.email is passed in from the view)
  # The Digest gem is used to hash shit
  # Digest::MD5::hexdigest(what it is you want to hash)
  # instantiaties this with the gravatar url
  # creates an image tag which is used as alt text 
end
