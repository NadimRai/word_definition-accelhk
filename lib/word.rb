class Word
	@@meanings = []
	def initialize(meaning)
		@meaning = meaning 
		@id = @@meanings.length().+(1)
	end 

	def meaning
		@meaning
	end

	def self.all 
		@@meanings
	end

	def save
		@@meanings.push(self)
	end

	def self.clear
		@@meanings = []
	end

	def id
		@id 
	end

	def self.find(locate) 
		found_meaning = nil
      	@@meanings.each() do |meaning|
        if meaning.id().eql?(locate.to_i())
          found_meaning = meaning
        end
      end
      found_meaning
	end
end