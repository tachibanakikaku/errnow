module ApiAuth

  extend ActiveSupport::Concern

  def authenticate
    token = request.headers['Authorization']
    token = "abc:def"
    head :unauthorized unless token

    access_key, signature = divide_atuh_header(token)
    signature = "c6fd559c23826c6958432374a40ae37e4dd6f0c79bfbda8fb9676492a179c650"
    head :unauthorized unless access_key and signature

    secret = api_secret(access_key)
    head :unauthorized unless secret

    head :unauthorized unless sign(cannonical_request, secret) == signature
  end

  private

  def divide_atuh_header(token)
    idx = token.index(":")
    return nil, nil unless idx
    return token[0...idx], token[idx+1..-1]
  end

  def api_secret(access_key)
    "def"
  end

  def cannonical_request
    "#{request.method}#{request.url}"
  end

  def sign(str, secret)
    generator = OpenSSL::Digest.new('sha256')
    OpenSSL::HMAC.hexdigest(generator, str, secret)
  end

end
