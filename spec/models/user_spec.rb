require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'John Doe', email: 'johndoe@example.com', password: 'password')
    expect(user).to be_valid
  end
  
  it 'is not valid without a name' do
    user = User.new(email: 'johndoe@example.com', password: 'password')
    expect(user).to_not be_valid
  end
  
  it 'is not valid without an email' do
    user = User.new(name: 'John Doe', password: 'password')
    expect(user).to_not be_valid
  end
  
  it 'is not valid without a password' do
    user = User.new(name: 'John Doe', email: 'johndoe@example.com')
    expect(user).to_not be_valid
  end
  
  it 'is not valid with a duplicate email' do
    User.create(name: 'John Doe', email: 'johndoe@example.com', password: 'password')
    user = User.new(name: 'Jane Doe', email: 'johndoe@example.com', password: 'password')
    expect(user).to_not be_valid
  end

end
