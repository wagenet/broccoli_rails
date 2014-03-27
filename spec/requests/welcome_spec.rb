require 'spec_helper'

describe "welcome" do
  it "works" do
    get "/"
    expect(response).to be_success
  end
end
