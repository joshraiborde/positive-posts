class PositivePost < ActiveRecord::Base
    belongs_to :user
    
    def formatted_created_at
        self.created_at.strftime('%a, %b %d %Y %l:%M.%S %p')
    end
end
