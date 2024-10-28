class Schedule < ApplicationRecord
    validate :start_time_should_be_before_end_time

    private
  
    def start_time_should_be_before_end_time
      if start_time.present? && end_time.present? && start_time > end_time
        Rails.logger.info "Validation error: start_time #{start_time} is after end_time #{end_time}"
        errors.add(:start_time, 'は終了日よりも前でなければなりません')
      end
    end
end