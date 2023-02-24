module Features
    module SessionHelpers
        def sign_up_with(user)
            visit new_user_registration_path
            fill_in "email", with: user.email
            fill_in "password", with: user.password
            fill_in "password_confirmation", with: user.password_confirmation
            click_button("Sign up")
        end

        def sign_in_with(user)
            visit new_user_session_path
            fill_in "email", with: user.email
            fill_in "password", with: user.password
            click_button("Log in")
        end
    end
end