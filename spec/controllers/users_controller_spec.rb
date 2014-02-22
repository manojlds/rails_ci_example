require 'spec_helper'

describe UsersController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the users into @users" do
      user1 = User.create!
      user2 = User.create!
      get :index

      expect(assigns(:users)).to match_array([user1, user2])
    end
  end

end
