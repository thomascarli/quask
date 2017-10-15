require 'rails_helper'

# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Features spec

# by writing tests, were testing for the associations as well: 
# question has_many answers where answers has_many users through responses

# expect these response types to be a hash/json
# creates a question maintaining DRY
RSpec.describe Question do 
	let(:user){ User.create!(name: 'Joe') }

	# can distiquish a LIVE, ON-DECK , PENDING questions
	describe 'State' do

		it 'is PENDING on #create' do 
			q = Question.create!(user_id: user.id, name: 'Am I pending?')
			expect(q.state).to eq('pending')
		end

		it 'is ON-DECK on #prepare' do
			q = Question.create!(user_id: user.id, name: 'Am I on-deck?')
			q.prepare
			expect(q.state).to eq('on_deck')
		end

		it 'is LIVE on #broadcast' do
			q = Question.create!(user_id: user.id, name: 'Am I live??')
			q.prepare
			q.broadcast
			expect(q.state).to eq('live')
		end

		it 'is DONE on #fininsh' do
			q = Question.create!(user_id: user.id, name: 'Am I done?')
			q.prepare
			q.broadcast
			q.finish
			expect(q.state).to eq('done')
		end
	end

# GET get all submissions for a question 

# PUTS state update

# GET a winning response , should include user obj
end

