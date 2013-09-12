require 'spec_helper'

feature "view all contact inquiries", %Q{
  As an admin
  I want to review contact inquiries
  So that I can respond or take action
} do

  #Acceptance Criteria:
  # * I can see a list of all contact inquiries

  scenario "I see a list of all contact inquiries" do
    record1 = FactoryGirl.create(:contact)
    record2 = FactoryGirl.create(:contact, 
      email:'jennifer.caulk0203@gmail.com', 
      first_name:"Jeninfer", 
      last_name:"Jackson", 
      subject: "What services do you provide?", 
      description: "Can you tell me what services your provide?" )
    visit '/'
    expect(page).to have_content(record1.email)
    expect(page).to have_content(record2.email)
  end

end