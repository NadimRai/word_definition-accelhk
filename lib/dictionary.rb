class Dictionary
	@@dictionary = []

	def initialize(name)
		@name = name 
		@id = @@dictionary.length().+(1)
		@word_list = []
	end

	def name
		@name 
	end

	def id
		@id 
	end

	def word_list
		@word_list
	end

	def self.all 
		@@dictionary
	end

	def save
      @@dictionary.push(self)
    end

    def self.clear 
    	@@dictionary = []
    end

    def self.find(id)
      found_word = nil
      @@dictionary.each() do |word|
        if word.id().eql?(id)
          found_word = word
        end
      end
      found_word
    end

    def add_word(word)
    	@word_list.push(word)
  	end

end