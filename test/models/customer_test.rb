require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  describe Customer do
    let(:customer_params) { { first_name: 'John Doe', email: 'john@abc.com' } }
    let(:customer) { Customer.new customer_params }

    it 'is valid with valid params' do
      customer.must_be :valid? # Must create with valid params
    end

    it 'is invalid without an email' do
      # Delete email before user let is called
      customer_params.delete :email

      customer.wont_be :valid? # Must not be valid without email
      customer.errors[:email].must_be :present? # Must have error for missing email
    end
  end
 end
