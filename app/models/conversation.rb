class Conversation < ApplicationRecord

  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :name_seed, presence: true

  def self.start
    last_convo = Conversation.order(created_at: :desc).first
    last_seed = last_convo.try(:name_seed) ||
      Deacon::RandomGenerator.random_initial_seed
    name_generator = Deacon::RandomGenerator.new
    new_seed, first_name, last_name = name_generator.generate(last_seed)

    new(name: "#{first_name}-#{last_name}".downcase, name_seed: new_seed)
  end

  def to_param
    name
  end

end
