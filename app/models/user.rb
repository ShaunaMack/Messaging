class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  
  has_many :personal_messages, dependent: :destroy

  has_one :profile, dependent: :destroy

  has_one :mentor, dependent: :destroy

  def username
    email.split('@')[0]
  end

end
