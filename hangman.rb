class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza", "lollipop", "archeologist"]

  def self.random_word
    DICTIONARY.sample
  end


    def initialize
      @secret_word = Hangman.random_word
      @guess_word = Array.new(@secret_word.length, "_")
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
    end

    def guess_word
      @guess_word
    end

    def attempted_chars
      @attempted_chars
    end

    def remaining_incorrect_guesses
      @remaining_incorrect_guesses
    end

    def already_attempted?(char)
      @attempted_chars.include?(char)
    end

    def get_matching_indices(char)
        matching = []
        @secret_word.each_char.with_index do |lett, i|
          if lett == char
            matching << i
          end
        end
        return matching
    end

    def fill_indices(char, arr)
      arr.each do |num|
        @guess_word.delete_at(num)
        @guess_word.insert(num, char)
      end
    end

    def try_guess(char)
      if self.already_attempted?(char)
        p "that has already been attempted"
        return false
      end

        @attempted_chars << char
      if !@secret_word.include?(char)
        @remaining_incorrect_guesses -= 1
      else
        arr = self.get_matching_indices(char)
        self.fill_indices(char, arr)
      end

      # if @remaining_incorrect_guesses = 4
      #   p "<"
      # elsif  @remaining_incorrect_guesses = 3
      #   p "-<"
      # elsif  @remaining_incorrect_guesses = 2
      #   p "<-<"
      # elsif  @remaining_incorrect_guesses = 1
      #   p "@<-<"
      # end
      return true
    end

    def ask_user_for_guess
      p "Enter a char:"
      char = gets.chomp
      return self.try_guess(char)
    end

    def win?
      if @guess_word.join("") == @secret_word
        p "WIN"
        return true
      else
        return false
      end
    end

    def lose?
      if @remaining_incorrect_guesses == 0
        p "Ughh, You Dead" + " " + "~@-<-<"
        return true
      else
        return false
      end
    end

    def game_over?
      if win? || lose?
        p @secret_word
        return true
      else
        return false
      end
    end
end
