require "rails_helper"

RSpec.describe "User model validations", type: :model do 
  it "is valid with all attributes" do
    user = FactoryGirl.create(:user)

    expect(user).to be_valid
  end

  it "is not valid without a nickname" do 
    user =  User.create(nickname: nil, age: 56, weight: 170, fitness_level: "Hot",
                        token: "12345", gender: "female", email: "fifi@exampe.com")

    expect(user).not_to be_valid
  end
 
  it "user2 is not valid with a duplicate nickname" do 
    user = FactoryGirl.create(:user)
    user2 =  User.create(nickname: "Fifi", age: 20, weight: 120, fitness_level: "Hot",
                        token: "34567", gender: "female", email: "fifi2@exampe.com")

    expect(user2).not_to be_valid
  end

  it "user is not valid without an age" do 
    user =  User.create(nickname: "Fifi", age: nil, weight: 120, fitness_level: "Hot",
                        token: "34567", gender: "female", email: "fifi2@exampe.com")

    expect(user).not_to be_valid
  end

  it "user is not valid without an weight" do 
    user =  User.create(nickname: "Fifi", age: 30, weight: nil, fitness_level: "Hot",
                        token: "34567", gender: "female", email: "fifi2@exampe.com")

    expect(user).not_to be_valid
  end

  it "user is not valid without a token" do 
    user =  User.create(nickname: "Fifi", age: 30, weight: nil, fitness_level: "Hot",
                        token: nil, gender: "female", email: "fifi2@exampe.com")

    expect(user).not_to be_valid
  end

  it "user2 is not valid with a duplicate token" do 
    user = FactoryGirl.create(:user)
    user2 =  User.create(nickname: "Bernie", age: 20, weight: 120, fitness_level: "Hot",
                        token: "12345", gender: "female", email: "fifi@example.com")

    expect(user2).not_to be_valid
  end

  it "user is not valid without an email" do 
    user =  User.create(nickname: "Fifi", age: 30, weight: nil, fitness_level: "Hot",
                        token: "1234", gender: "female", email: nil)

    expect(user).not_to be_valid
  end

  it "user2 is not valid with a duplicate email" do 
    user = FactoryGirl.create(:user)
    user2 =  User.create(nickname: "Bernie", age: 20, weight: 120, fitness_level: "Hot",
                        token: "34567", gender: "female", email: "fifi@example.com")

    expect(user2).not_to be_valid
  end

end