class PositivePost < ActiveRecord::Base
    belongs_to :user
    
    def formatted_created_at
        self.created_at.strftime('%a, %b %d %Y %l:%M.%S %p')
           # created_at.strftime("%A, %b %d %Y %l:%M.%S %p")
           # created_at.strftime('%a, %d %b %Y %H:%M:%S')
    end

end
