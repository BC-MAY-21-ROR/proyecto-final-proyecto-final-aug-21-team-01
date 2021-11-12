require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  
  it "Should have a h1 tag with Welcome to Kangaroo app text" do 
    render
    expect(rendered).to match("<h1>Welcome to Kangaroo app</h1>")
  end
 
end
