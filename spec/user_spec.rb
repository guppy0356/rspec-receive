require 'spec_helper'
require_relative '../user'

RSpec.describe User do
  before do
    allow(PostgreSql).to receive(:new).and_return(mock)
  end

  let(:mock) { PostgreSql.new }

  describe "#insert" do
    before do
      allow(mock).to receive(:insert).and_return(true)
    end

    subject(:insert) { user.insert }

    let(:user) { User.new("akira noguchi", 31) }

    it "runs PostgreSql#insert with its column values" do
      expect(user).to receive(:attributes)
      insert
      expect(mock).to have_received(:insert)
    end
  end
end
