class User < ApplicationRecord

    validates(:email, :session_token, presence: true, uniqueness: true)
    validates(:password_digest, presence: true)
    validates(:password, length: {minimum: 8, allow_nil: true})
    before_validation(:ensure_session_token)

    attr_reader(:password)

    # FIGVAPEBR
    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        if user && user.is_password?(password)
            return user
        else
            return nil
        end
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = generate_unique_session_token
        self.save!
        self.session_token
    end

    private
    def generate_unique_session_token
        loop do
            session_token = SecureRandom::urlsafe_base64
            return session_token if User.find_by(session_token: session_token).nil?
        end
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end
end
