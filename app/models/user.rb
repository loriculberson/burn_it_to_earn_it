class User < ActiveRecord::Base
  validates :first_name, :last_name, :weight, :email, presence: true
  validates_numericality_of :weight, minimum: 50
  validates_numericality_of :age, minimum: 10

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)
    user.nickname = data.info.nickname
    user.image_url = data.info.image
    user.token = data.credentials.token
    user.save

    user
  end

  def first_time?
    age.nil?
  end

  def missing_weight?
    weight.nil?
  end
end
