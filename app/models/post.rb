class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait

    def is_clickbait
        if self.title == "True Facts"
            errors.add(:title, 'title is clickbait')
        end
    end
end


