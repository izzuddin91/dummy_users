class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  # e.g., User.authenticate('josh@codedivision.com', 'apples123')
  def self.authenticate(email, password)
    byebug
    @user = User.where(email: email, password: password).first

    # if email and password correspond to a valid user, return that user
    if @user.present?
      @user
    # otherwise, return nil
    else
      nil
    end
  end

end
