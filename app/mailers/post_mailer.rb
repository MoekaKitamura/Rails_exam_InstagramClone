class PostMailer < ApplicationMailer
  def post_mailer(picture)
    @greeting = "Hi"
    @picture = picture

    mail to: "@picture.user.email", subject: "Your post was successfully created."
  end
end
