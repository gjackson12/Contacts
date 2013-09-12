require 'spec_helper'

feature "site visitor submits contact form", %Q{
  As a site visitor
  I want to contact DogHub staff
  So that I can tell them how awesome they are
  } do

  #Acceptance Criteria:
  # * I must specify a valid email address
  # * I must specify a subject
  # * I must specify a description
  # * I must specify a first name
  # * I must specify a last name

  scenario "I specify all required/valid information" do
    prev_contact_queries_count = Contact.count
    visit '/'
    click_link 'Contact Us'
    fill_in 'Email', with: 'graham.jackson07@gmail.com'
    fill_in 'Subject', with: 'Quick Question'
    fill_in 'Description', with: 'I am confused where you are located. Could you send me your address?'
    fill_in 'First name', with: 'Graham'
    fill_in 'Last name', with: 'Jackson'
    click_button 'Submit Inquiry'
    expect(page).to have_content('Your message has been received. We will get right back to you with an answer!')
    expect(Contact.count).to eql(prev_contact_queries_count + 1)
  end

   scenario "I do not specify all required/valid information" do
    prev_contact_queries_count = Contact.count
    visit '/'
    click_link 'Contact Us'
    click_button 'Submit Inquiry'
    expect(page).to have_content("can't be blank")
    expect(Contact.count).to eql(prev_contact_queries_count)
  end

   scenario "I do not specify a first name" do
    prev_contact_queries_count = Contact.count
    visit '/'
    click_link 'Contact Us'
    fill_in 'Email', with: 'graham.jackson07@gmail.com'
    fill_in 'Subject', with: 'Quick Question'
    fill_in 'Description', with: 'I am confused where you are located. Could you send me your address?'
    fill_in 'Last name', with: 'Jackson'
    click_button 'Submit Inquiry'
    expect(page).to have_content("Please enter your first name.")
    expect(Contact.count).to eql(prev_contact_queries_count)
   end

end