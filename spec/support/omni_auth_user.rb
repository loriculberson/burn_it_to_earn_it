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

end
