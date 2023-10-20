class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates :start_time, :end_time, presence: true
  validate :within_business_hours, :start_time_before_end_time, :no_conflicting_reservations, :only_future_reservations, :only_within_day


  def within_business_hours
    unless (start_time.hour >= 8 && end_time.hour <= 18)
      errors.add(:start_time, "As reservas tem que ser feita em horario comnercial (8:00 AM - 6:00 PM).")
    end
  end

  def start_time_before_end_time
    unless start_time < end_time
      errors.add(:start_time, "A hora de inicio tem que ser antes da hora de fim.")
    end
  end

  def no_conflicting_reservations
    if room.reservations.where("start_time < ? AND end_time > ?", end_time, start_time).any?
      errors.add(:room, "Já existe uma reserva para este horario.")
    end
  end

  def only_future_reservations
    unless start_time > Time.now
      errors.add(:start_time, "A reserva tem que ser feita para o futuro.")
    end
  end

  def only_within_day
    unless start_time.day == end_time.day
      errors.add(:start_time, "A reserva tem que ser feita para o mesmo dia.")
    end
  end

end
