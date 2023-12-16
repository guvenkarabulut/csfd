class PostNotifierMailer < ApplicationMailer
  def new_post(post, user)
    @post = post
    mail(to: user,
         subject: 'New post created',
         content_type: 'text/html',
         body: '<h1>Hi, a new post has been created</h1>')
  end
end
