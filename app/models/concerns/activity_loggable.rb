module ActivityLoggable
  extend ActiveSupport::Concern

  included do
    has_many :activity_logs, as: :loggable
    after_save :log_activity
  end

  private

  def log_activity
    changed_params = saved_changes.except(*self.class::PARAMS_TO_EXCLUDE)
    changes_text = []
    changed_params.each do |key, value|
      value[0] = 'nil' unless value[0]
      changes_text << "#{key.titleize} from #{value[0] } to #{value[1]}"
    end
    if changes_text.present?
      changes_text = "Changes: #{changes_text.join(',')}"
      self.activity_logs.create changes_text: changes_text
    end
  end
    
end