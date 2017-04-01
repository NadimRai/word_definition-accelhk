require('rspec')
require('word')


describe(Word) do 

	describe("meaning") do 
		it("returns the meaning of the word") do 
			test_word = Word.new("a particular method of reasoning or argumentation")
        	expect(test_word.meaning()).to(eq("a particular method of reasoning or argumentation"))
		end
	end

	describe(".all") do
      it("is empty at first") do
        expect(Word.all()).to(eq([]))
      end
    end	

    describe("save") do
      it("adds a meaning of word to the array meanings") do
        test_word = Word.new("a particular method of reasoning or argumentation")
        test_word.save()
        expect(Word.all()).to(eq([test_word]))
      end
    end	

    describe(".clear") do
      it("empties out all of the saved meanings") do
        Word.new("a particular method of reasoning or argumentation")
        Word.clear()
        expect(Word.all()).to(eq([]))
      end
    end


    describe("id") do
      it("returns the id of the meaning") do
        test_word = Word.new("a particular method of reasoning or argumentation")
        test_word.save()
        expect(test_word.id()).to(eq(1))
      end
    end

    describe(".find") do
    it("returns a meaning by its id number") do
      test_word = Word.new("a particular method of reasoning or argumentation")
      test_word.save()
      test_word2 = Word.new("a means of transmission or passage")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end
end
