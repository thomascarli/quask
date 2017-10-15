require 'rails_helper'

RSpec.describe User, type: :model do

	# should have a name
	 before do 
	 	@user = User.new
	 end

	describe 'Validates' do 
		it 'name' do
			expect(@user.valid?).to eq(false)
		end
	end
end