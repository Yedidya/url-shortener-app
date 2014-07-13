require 'rails_helper'

RSpec.describe Link, :type => :model do
  it "should make standardize target_url by removing http://" do

    link = Link.new(:slug => 'test', :target_url => 'http://gmail.com')
    link.standardize_target_url!

    expect(link.target_url).to eq('gmail.com')
  end

  it "should make standardize target_url by removing https://" do

    link = Link.new(:slug => 'test', :target_url => 'https://gmail.com')
    link.standardize_target_url!

    expect(link.target_url).to eq('gmail.com')
  end

  it "should display the visit count to the respective slug" do

    link = Link.create(:slug => 'test', :target_url => 'https://gmail.com')

    5.times do 
      link.visits.create
    end
    
    expect(link.visit_count).to eq(5)
  end
end
