# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/post_mailer/post_mailer
  def post_mailer
    PostMailer.post_mailer
  end

end
