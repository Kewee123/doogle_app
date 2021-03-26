module DefinitionsHelper
    def create_definition(word_id,definitions)
      puts "\n"
      puts "*" * 50
      puts "Definitions_helper"
      pp definitions
      puts "*" * 50
   
      @definition = Definition.new({content: definitions, word_id: word_id})
      @definition.save
      
      pp @definition
  
      if @definition.nil?
        return 0
      else
        return 1
      end
    end
end
