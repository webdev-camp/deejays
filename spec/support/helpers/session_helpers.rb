module Features
  module SessionHelpers
    def sign_up_with(email, password, confirmation)
      visit new_user_registration_path
      fill_in 'Full name', with: "some name"
      fill_in 'City', with: "some city"
      fill_in 'user[country]', with: "some place"
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', :with => confirmation
      click_button 'Sign up'
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'
    end

    def signed_user factory = :user
      user = FactoryGirl.create(factory)
      user.confirm
      login_as(user, :scope => :user)
      user
    end
  end
end
