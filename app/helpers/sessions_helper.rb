module SessionsHelper
def encrypt(text)
    if text.nil? == false
      crypt = ActiveSupport::MessageEncryptor.new('b23a276ce11227f08e802005da3161a57c8107fad9e310cc1b2c83c2cd477be114fe74ebef87686de03068b23a276ce11227f08e802005da3161a57')
      return  crypt.encrypt_and_sign(text)
    end
  end
end
