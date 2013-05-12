require 'spec_helper'

describe Key do
  let(:account) {Account.create name: 'test account'}

  it 'should create keys for an account' do
    SecureRandom.should_receive(:uuid).and_return("unique-id")
    SecureRandom.should_receive(:hex).with(256).and_return('abc')

    key = Key.create account: account, name: 'key1'
    key.uid.should == "uniqueid"
    key.secret.should == Digest::SHA256.new.update('abc').hexdigest()
  end

  it 'should maintain uniqueness of uids' do
    Key.create! account: account, uid: 'abc', secret: 'secret', name: 'key1'
    key = Key.create account: account, uid: 'abc', secret: 'secret', name: 'key2'
    key.errors.messages.should include uid: ['has already been taken' ]
  end

  it 'should provide a combined token' do
    key = Key.create! account: account, uid: 'abc', secret: 'secret', name: 'key1'
    key.token.should == 'abcsecret'
  end


end
