require 'spec_helper'

describe "client" do
  it "works" do
    get "/client/index.html"
    expect(response).to be_success
  end
end
