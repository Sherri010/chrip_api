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

 #invalid create
  it "POST /tweets should say 404" do
    post "/tweets",params:{
      tweet: {
        body:""
      }
   }

   expect(response).to have_http_status(404)
  end

 #show
  it "GET /tweets/:id should say 200" do
    t= Tweet.create(body:"hello form test")
    get "/tweets/1"
    expect(response).to have_http_status(200)
  end


  #update
  it "PUT /tweets/:id should say 200" do
    t= Tweet.create(body:"hello form test")
     put "/tweets/1",params:{
       tweet:{
         body:"edited body content"
       }
     }
     expect(response).to have_http_status(200)
  end

  it "DELETE /tweets/:id should say 200" do
    t= Tweet.create(body:"hello form test")
     delete "/tweets/1"
     expect(response).to have_http_status(200)
  end
  end

end
