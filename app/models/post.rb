class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction","Non-Fiction"]}
    validate :clickbait_check


    private 

    def clickbait_check
        if title != nil
            unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess")
                errors.add(:title, "not clickbaity enough")
            end
        end
    end
end
