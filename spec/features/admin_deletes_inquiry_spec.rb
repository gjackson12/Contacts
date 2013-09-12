require 'spec_helper'

feature "delete a contact inquiry", %Q{
  As an admin
  I want to delete an inquiry
  So that I can remove spam or other undesirable inquiries
} do

  #Acceptance Criteria:
  # * I can remove an item from the listing of contact inquiries

  scenario "remove a contact inquiry" do
    record = FactoryGirl.create(:contact)
    visit '/'
    save_and_open_page
    click_link 'Delete inquiry'
    expect(page).to have_content("The inquiry has been deleted.")
  end

end