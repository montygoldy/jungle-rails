class User < ActiveRecord::Base

  validates :last_name, :first_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }



  def self.authenticate_with_credentials(email, password)

    @user = User.find_by_email(email.downcase.strip)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
