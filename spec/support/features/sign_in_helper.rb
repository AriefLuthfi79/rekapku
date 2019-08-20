module Features
  def sign_in(user)
    visit new_session_path
    fill_in 'Email', with: user.email, match: :first
    fill_in 'Password', with: user.password
    click_on 'SIGN IN'
  end
end
