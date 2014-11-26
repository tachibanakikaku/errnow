class Key < ActiveRecord::Base

  belongs_to :user

  def generate
    self.access_key = random_str
    self.secret_access_key = random_str
    self
  end

  private
    def random_str
      Base64.encode64(OpenSSL::Random.random_bytes(18)).sub(/\\n/, "")
    end

end
