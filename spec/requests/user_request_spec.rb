require 'rails_helper'

describe "Users API" do
  it "sends a list of users" do
    create_list(:user, 3)

    get '/api/v1/users'

    expect(response).to be_successful

    users = JSON.parse(body)

    expect(users.count).to eq(3)
  end

  it "can create a new user" do
    user_params = { given_name: "seth", family_name: "schwartz", email: "seth@gmail.com", google_id: "12345", imageUrl: "wwww.image.com" }

    post "/api/v1/users", params: {user: user_params}
    user = User.last

    assert_response :success
    expect(response).to be_successful
    expect(user.gid).to eq(user_params[:google_id])
  end

  it "returns a 400 if the user is not successfully created" do
    user_params = { name: "carrot" }

    post "/api/v1/users", params: {user: user_params}

    expect(response.status).to eq(400)
  end
end
