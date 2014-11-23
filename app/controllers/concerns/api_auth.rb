module ApiAuth

  extend ActiveSupport::Concern

  def api_authenticate
    token = request.headers['Authorization']
    unless token
			head :unauthorized
			return
		end

    access_key, signature = divide_atuh_header(token)
		unless access_key and signature
    	head :unauthorized
			return
		end

		unless correct_signature?(signature)
    	head :unauthorized
			return
		end
  end

  private

  def divide_atuh_header(token)
    idx = token.index(":")
    return nil, nil unless idx
    return token[0...idx], token[idx+1..-1]
  end

  def correct_signature?(signature)
		Tencryptor.configure do |config|
		  config.algorithm         = 'sha256'
		  config.service           = 'my-service'
		  config.headers           = ['host']
		  config.region            = 'asia/tokyo'
		  config.access_key        = 'my-access-key'
		  config.secret_access_key = 'my-secret_access-key'
		  config.debug             = false
		end
		encriptor = Tencryptor::Encrypter.new
		hash = encriptor.signature(URI(request.url))
		signature == hash
	end

end
