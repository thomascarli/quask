require 'rails_helper'

RSpec.describe User, type: :model do

	describe 'Validates' do
		let (:user_blank) { @user = User.new}
		let(:user){User.new name: 'joe'}

		it 'name to not be true' do
			expect(user_blank.valid?).to eq(false)
		end

		it 'name to be true' do 
			expect(user.valid?).to eq(true)
		end
	end
end