describe 'Sessions' do
  let(:user) { users(:basic) }

  it 'can log in' do
    visit root_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'abc123'

    find('[type=submit]').click

    expect(page).to have_content('.page-header', 'News Feed')
  end

  it 'ensures credentials are valid' do
    visit root_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'invalid'

    find('[type=submit]').click

    expect(page).to have_content('Invalid Email or password.')
    expect(page).to_not have_content('.page-header', 'News Feed')
  end

  it 'can log out' do
    login_as user

    visit root_path

    find("[href='#{destroy_user_session_path}']").click

    expect(page).to have_selector('form.new_user')
  end
end
