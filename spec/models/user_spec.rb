require 'spec_helper'

describe User do
  it {should have_secure_password}
  it {should validate_presence_of(:email)}
  it do
    User.create!({
      :email => 'bob@jerry.com',
      :password => 1,
      :password_confirmation => 1
      })
    should validate_uniqueness_of(:email)
  end
  it {should have_many(:links)}
end