require "rails_helper"

RSpec.feature "Create a flower", :type => :feature do
  let!(:family){ Family.create(name: 'Astor')}
  scenario "User creates a new flower" do
    visit "/flowers/new"

    fill_in "Name", :with => "Tulip"
    fill_in "Color", :with => "Blue"
    click_button "Save"

    # Checking to see if the strong params are going thru
    params = ActionController::Parameters.new({"flower"=>{"name"=>"Tulip", "edible"=>nil, "color"=>"blue"}})
    #------------------------------------------------------

    it { should validate_presence_of :color  }

    expect(page).to have_text("Flower was successfully created.")
  end
end
