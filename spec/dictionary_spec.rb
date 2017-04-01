require('rspec')
require('dictionary')
require('word')

describe(Dictionary) do 

	describe('#name') do
      it("returns the name of the word") do
        test_dictionary = Dictionary.new("logic")
        expect(test_dictionary.name()).to(eq("logic"))
      end
    end

    describe('#id') do
      it("returns the id of the word") do
        test_dictionary = Dictionary.new("logic")
        expect(test_dictionary.id()).to(eq(1))
      end
    end

    describe('#word_list') do
      it("initially returns an empty array of words in the dictionary") do
        test_dictionary = Dictionary.new("logic")
        expect(test_dictionary.word_list()).to(eq([]))
      end
    end

    describe(".all") do
      it("is empty at first") do
        expect(Dictionary.all()).to(eq([]))
      end
    end

    describe("#save") do
      it("adds a word to the dictionary array") do
        test_dictionary = Dictionary.new("logic")
        test_dictionary.save()
        expect(Dictionary.all()).to(eq([test_dictionary]))
      end
    end

    describe(".clear") do
      it("empties out all of the words from the array") do
        Dictionary.new("logic").save()
        Dictionary.clear()
        expect(Dictionary.all()).to(eq([]))
      end
    end

    describe(".find") do
      it("returns a word by its id number") do
        test_dictionary = Dictionary.new("logic")
        test_dictionary.save()
        test_dictionary2 = Dictionary.new("stoic")
        test_dictionary2.save()
        expect(Dictionary.find(test_dictionary.id())).to(eq(test_dictionary))
      end
    end

    describe('#add_word') do
      it("adds a new meaning to a dictionary") do
        test_dictionary = Dictionary.new("logic")
        test_word = Word.new("a particular method of reasoning or argumentation")
        test_dictionary.add_word(test_word)
        expect(test_dictionary.word_list()).to(eq([test_word]))
      end
    end
end