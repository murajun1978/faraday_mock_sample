require 'rails_helper'

describe User, type: :model do
  describe 'all' do
    let(:users) { User.all }

    example do
      expect(users.count).to eq 2
    end
  end
end
