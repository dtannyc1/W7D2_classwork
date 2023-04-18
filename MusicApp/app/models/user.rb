class User < ApplicationRecord



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
