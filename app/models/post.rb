class Post < ApplicationRecord
  after_create :send_new_post_email
  searchkick
  has_rich_text :content
  has_one_attached :image
  has_many :comments, dependent: :destroy
  enum tag: %i[xss sqli csrf ssrf rce lfi rfi idor]

  def send_new_post_email
    return if User.find_by(id: user_id).role != 'admin'

    @emails = Newsletter.all
    @emails.each do |email|
      PostNotifierMailer.new_post(self, email.email).deliver_now
    end
  end
end
