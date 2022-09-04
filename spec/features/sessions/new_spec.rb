require "rails_helper"

RSpec.feature "On Login Page, a visitor", type: :feature do
    let!(:existing_visitor) { create :visitor }
    let!(:new_visitor) { build :visitor }

    scenario "can sign in" do
        sign_in_with(existing_visitor)
        expect(page.current_path).to eq(root_path)
        expect(page.status_code).to eq(200)
    end
    scenario "cannot sign in with an incorrect credentials" do
        sign_in_with(new_visitor)
        expect(page.current_path).to eq(new_visitor_session_path)
        expect(page).to have_content("Invalid Email or password.")
    end
end