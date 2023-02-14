class User < ActiveRecord::Base
    has_many :accounts
    before_create :capitalize_name
    validates_presence_of :name, :email, :age, :phone_number
    validates :email, uniqueness: true
    validates :phone_number, numericality: true,
                             length: { in: 10..15 }
    def eligible?
        age >= 21
    end
    
    def capitalize_name
        name.capitalize
    end

end
