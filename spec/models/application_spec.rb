require 'rails_helper'

RSpec.describe Application do
  describe 'Validations' do
    it {should_validate_presence_of :name}
    it {should_validate_presence_of :address}
    it {should_validate_presence_of :city}
    it {should_validate_presence_of :state}
    it {should_validate_presence_of :zip}
    it {should_validate_presence_of :phone_number}
    it {should_validate_presence_of :description}
  end
end     
