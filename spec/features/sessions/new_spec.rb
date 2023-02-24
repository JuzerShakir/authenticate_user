require "rails_helper"

RSpec.feature "On Login Page, a user", type: :feature do
    let!(:existing_user) { create :user }
    let!(:new_user) { build :user }

    scenario "can sign in" do
        sign_in_with(existing_user)
        expect(page.current_path).to eq(root_path)
        expect(page.status_code).to eq(200)
    end
    scenario "cannot sign in with an incorrect credentials" do
        sign_in_with(new_user)
        expect(page.current_path).to eq(new_user_session_path)
        expect(page).to have_content("Invalid Email or password.")
    end
end