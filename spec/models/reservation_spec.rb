require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe "Associations" do
    let(:room) { create(:room) }
    let(:user) { create(:user) }
    today = Time.now

    it 'is valid with valid attributes' do
      start_time = Time.new(today.year, today.month, today.day + 1, 12, 0, 0)
      end_time = Time.new(today.year, today.month, today.day + 1, 13, 0, 0)
      reservation = Reservation.new(user: user, room: room, start_time: start_time, end_time: end_time)
      expect(reservation).to be_valid
    end

    it 'is not within business hours' do
      start_time = Time.new(today.year, today.month, today.day + 1, 18, 0, 0)
      end_time = Time.new(today.year, today.month, today.day + 1, 19, 0, 0)
      reservation = Reservation.new(user: user, room: room, start_time: start_time, end_time: end_time)
      expect(reservation).to_not be_valid
    end

    it 'has start time after end time' do
      start_time = Time.new(today.year, today.month, today.day + 1, 13, 0, 0)
      end_time = Time.new(today.year, today.month, today.day + 1, 12, 0, 0)
      reservation = Reservation.new(user: user, room: room, start_time: start_time, end_time: end_time)
      expect(reservation).to_not be_valid
    end

    it 'is not a future reservation' do
      start_time = Time.new(today.year, today.month, today.day - 1, 12, 0, 0)
      end_time = Time.new(today.year, today.month, today.day - 1, 13, 0, 0)
      reservation = Reservation.new(user: user, room: room, start_time: start_time, end_time: end_time)
      expect(reservation).to_not be_valid
    end
  end

end
