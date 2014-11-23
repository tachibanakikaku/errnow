class Page < ActiveRecord::Base

  belongs_to :application

  validates :status_code, uniqueness: { scope: [:application_id] }

  class Hash
    def value_of_key(value)
      self.each do |k, v|
        return k if  v == value
      end
    end  
  end

  STATUS_CODES = {
    '400 Bad Request'  => 400,
    '401 Unauthorized' => 401,
    '403 Forbidden'    => 403,
    '404 Not Found'    => 404,
    '500 Internal Server Error' => 500
  }

  def STATUS_CODES.code_to_desc(code)
    self.each do |k, v|
      return k if  v == code
    end
  end

end
