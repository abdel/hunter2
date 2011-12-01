require File.expand_path('../../helper', __FILE__)

describe 'Hunter2::Command' do
  before do
    @key  = 'bacon-testing'
    @pass = '123456'

    password = Hunter2::Model::Password.create_or_update(
      :key      => @key,
      :password => @pass
    )
  end

  it 'Retrieve password' do
    password = Hunter2::Model::Password.select(:password) \
      .filter(:key => @key) \
      .limit(1) \
      .single_value

    password.should.equal @pass
  end

  it 'Edit password' do
    password = Hunter2::Model::Password.filter(:key => @key).limit(1)
    password.update(:password => 'newpass')
    "".should.equal ""
  end

  it 'Delete password' do
    password = Hunter2::Model::Password.(:key => @key).limit(1).delete
    "".should.equal ""
  end
end
