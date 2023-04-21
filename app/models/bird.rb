class Bird < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    

    def create 
        bird = Bird.create!(bird_params)
        render json: bird, status: :created
    rescue ApplicationRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
        
    end

    private

    def bird_params
        params.permit(:name, :species, :likes)
    end
end
