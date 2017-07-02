module UsersHelper

  def generate_quote
    inspirational_quotes = [
      ["There is no substitute for hard work.", " -Thomas Edison"],
      ["If you spend too much time thinking about a thing, you'll never get it done.", " -Bruce Lee"],
      ["Nothing is less productive than to make more efficient what should not be done at all."," -Peter Drucker"],
      ["Amateurs sit and wait for inspiration, the rest of us just get up and go to work.", " -Stephen King"],
      ["My goal is no longer to get more done, but rather to have less to do.", " -Francine Jay"],
      ["It is not enough to be industrious; so are the ants. What are you industrious about?", " -Henry David Thoreau"],
      ["The simple act of paying positive attention to people has a great deal to do with productivity.", " -Tom Peters"],
      ["The society based on production is only productive, not creative.", " -Albert Camus"],
      ["Concentrate all your thoughts upon the work in hand. The sun's rays do not burn until brought to a focus.", " -Alexander Graham Bell"],
      ["Don't allow idleness to deceive you, for while you give him today, he steals tomorrow from you.", " -H. Croccoquill"]
    ]
    inspirational_quotes.sample
  end

  def expiring_tasks
    expiring_count = 0
    present = Time.now
    tasks = current_user.tasks
    tasks.each do |task|
      expiring_count += 1 if present - task.created_at > 518399
    end
    expiring_count
  end
end
