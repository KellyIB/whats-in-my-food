require 'spec_helper'
require './app/models/food'

describe Food do
  let(:attrs) {
    {
      ndbno: "12345",
      name: "Josh's Sweet Potato Fries",
      group: "Branded Food Products",
      ds: "LI",
      manu: "Josh's Chip Company"
    }
  }

  subject { Food.new(attrs) }

  it "exists" do
    expect(subject).to be_a Food
    expect(subject.ndb).to eq "12345"
    expect(subject.name).to eq "Josh's Sweet Potato Fries"
    expect(subject.group).to eq "Branded Food Products"
    expect(subject.data_source).to eq "LI"
    expect(subject.manufacturer).to eq "Josh's Chip Company"
  end
end
