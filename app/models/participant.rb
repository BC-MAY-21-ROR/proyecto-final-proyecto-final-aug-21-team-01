class Participant < ApplicationRecord
    belongs_to :user
    belongs_to :group
    enum role: {responsible: 0, follower: 1}
end
