module QuestionStateMachine

  extend ActiveSupport::Concern

  included do

    self.state_machine :initial => :pending do

      before_transition any => :on_deck do |question, transition|
        # Allow any new users to receive next question
        puts "on deck"
      end

      before_transition any => :live do |question, transition|
        # Broadcast new question to all web sockets
        puts "going live"
      end

      before_transition any => :done do |question, transition|
        puts "finished!"
      end

      event :prepare do
        transition :pending => :on_deck
      end

      event :broadcast do
        transition :on_deck => :live
      end

      event :finish do
        transition :live => :done
      end
    end
  end

end
