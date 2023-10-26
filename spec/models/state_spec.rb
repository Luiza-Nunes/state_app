require 'rails_helper'
# require 'shoulda/matchers'

RSpec.describe State, type: :model do
  let(:pr) {State.find_by(name: 'Paraná')}
  let(:sc) {State.find_by(name: 'Santa Catarina')}
  let(:rs) {State.find_by(name: 'Rio Grande do Sul')}

  describe "Associations" do
    it {is_expected.to have_many(:cities)}
  end

  describe "Validations" do
    context "Paraná" do
      it "Should have at least 3 cities" do
        expect(pr.cities.count).to be >= 3
      end
    end
    context "Santa Catarina" do
      it "Should have at least 3 cities" do
        expect(sc.cities.count).to be >= 3
      end
    end
    context "Rio Grande do Sul" do
      it "Should have at least 3 cities" do
        expect(rs.cities.count).to be >= 3
      end
    end
  end
end
