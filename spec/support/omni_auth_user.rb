module OmniAuthUser

  def mock_omniauth_user
    auth = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '123545',
      :info => {  :nickname => 'twitter_mock_user',
                  :image => nil
                },
      :credentials => { :token =>"222333444" }
    })
    OmniAuth.config.mock_auth[:twitter] = auth
  end

  def mock_omniauth_user_authenticated
    mock = mock_omniauth_user
    user = User.find_or_create_by(provider: mock["provider"], uid: mock["uid"], 
                                  nickname:mock["info"]["nickname"], 
                                  token: mock["credentials"]["token"] 
                                  )
    user.age = 35
    user.weight = 125
    user.save!
    user
  end

end
