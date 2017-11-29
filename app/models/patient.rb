class Patient < ApplicationRecord
  include ActivityLoggable

  PARAMS_TO_EXCLUDE = [:id, :created_at, :updated_at]
end
