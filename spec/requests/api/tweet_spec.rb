require "rails_helper"
describe "TWEET API TESTS" do

  #index
  it "GET /tweets should say 200" do
    get "/tweets"
    expect(response).to have_http_status(200)
  end

  #create
   it "POST /tweets should say 200" do
     post "/tweets",params:{
      tweet:{
      body:" im created through test"
      }
    }

    expect(response).to have_http_status(200)
  end


 #show
  it "GET /tweets/:id should say 200" do
    get "/tweets/1"
    expect(response).to have_http_status(200)
  end


end
