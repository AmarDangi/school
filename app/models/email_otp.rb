class EmailOtp < ApplicationRecord
    validates :email, presence: true
    before_create :generate_pin_valid_date

    def generate_pin_valid_date
        self.pin = rand(1_0000..9_9999)
        self.valid_until = Time.current + 2.minutes
        self.activated = true
    end
end
