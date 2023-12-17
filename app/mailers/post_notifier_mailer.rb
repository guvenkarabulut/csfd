class PostNotifierMailer < ApplicationMailer
  def new_post(_post, user_email)
    mail(to: user_email,
         subject: 'New post created',
         content_type: 'text/html',
         body: render('post_notifier_mailer/new_post', locals: { post: _post }))
  end
end
