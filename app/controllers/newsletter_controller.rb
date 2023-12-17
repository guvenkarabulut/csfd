class NewsletterController < ApplicationController
  def create
    @newsletter = Newsletter.new(newsletter_params)
    puts "newsletter #{@newsletter.inspect}"
    if @newsletter.save
      redirect_to root_path, notice: 'You have successfully subscribed to our newsletter.'
    else
      redirect_to root_path, alert: 'You have already subscribed to our newsletter.'
    end
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
