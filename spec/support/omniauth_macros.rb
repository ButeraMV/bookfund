module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:twitter] = {
      'uid' => '123545',
      'extra' => {
        'raw_info' => {
          'screen_name' => 'mock_user'
        }
      },
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret'
      }
    }
  end
end
