module DefinitionsHelper
    def create_definition(word_id,definitions)
      puts "*" * 50
      pp definitions
      puts "*" * 50
   
      params = {
        definition: {
          content: definitions, 
          word_id: word_id
        }
      }
      
      @definition = Definition.new({content: definitions, word_id: word_id})
      @definition.save
      
      pp @definition
      return 1
    end
end
