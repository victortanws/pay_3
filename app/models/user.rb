class User < ApplicationRecord
  # Direct associations

  has_many   :debtorscreditors,
             :class_name => "Payment",
             :foreign_key => "other_id",
             :dependent => :destroy

  has_many   :payments,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  has_many   :debts,
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :debtorscreditors,
             :source => :user

  has_many   :debtorcreditors,
             :through => :payments,
             :source => :debtorcreditor

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
