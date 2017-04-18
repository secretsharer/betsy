require "test_helper"

describe Merchant do
  let(:merchant) { Merchant.new }

  describe 'validations' do
    it 'requires a username to be valid' do
      #merchant with no username is bad
      merchant = Merchant.new(email: 'hey@ada.org')
      merchant.valid?.must_equal false
      merchant.errors.messages.must_include :username
      #merchant with username is good
      merchant = merchants(:dan)
      merchant.valid?.must_equal true
      merchant.errors.message.wont_include :username
    end

    it 'requires a unique username to be valid' do
      dan = merchants(:dan)

      user = Merchant.new(username: 'dan', email: 'ho@ada.org')
      result = user.save
      result.must_equal false
      user.errors.messages.must_include :username
    end

    it 'requires an email address to be valid' do
      merchant = Merchant.new(username: 'sai')
      merchant.valid?.must_equal false
      merchant.errors.messages.must_include :email

      merchant = merchants(:dan)
      merchant.valid?.must_equal true
      merchant.errors.message.wont_include :email
    end

    it 'requires a unique email address to be valid' do
      dan = merchants(:dan)

      user = Merchant.new(username: 'sai', email: 'dan@ada.org')
      result = user.save
      result.must_equal false
      user.errors.messages.must_include :email
    end
  end
end
