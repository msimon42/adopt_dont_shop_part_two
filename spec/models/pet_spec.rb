require 'rails_helper'

describe Pet, type: :model do
  describe "validations" do
    it {should validate_presence_of :image}
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :approx_age}
    it {should validate_presence_of :sex}
    it {should validate_numericality_of :approx_age}
  end
end
