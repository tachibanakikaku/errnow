class Page < ActiveRecord::Base

  belongs_to :application

  STATUS_CODES = %w{401 404 500}

end
