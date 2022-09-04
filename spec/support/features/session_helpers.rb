module Features
    module SessionHelpers
        def sign_up_with(visitor)
            visit new_visitor_registration_path
            fill_in "email", with: visitor.email
            fill_in "password", with: visitor.password
            fill_in "password_confirmation", with: visitor.password_confirmation
            click_button("Sign up")
        end
    end
end