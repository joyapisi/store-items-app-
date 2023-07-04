class Source
    attr_reader :id, :name,
    attr_accessor :items

    def initialize(id,name,items)
        @id = Random.rand(1...1000)
        @name = name
        @items = []
    end

    def add_source

    end
end