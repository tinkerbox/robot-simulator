class Command

  attr_reader :name, :params

  def self.parse(input, &block)

    # Ignore zero length commands
    return nil if input.length < 1

    args = input.split(" ")
    
    command = Command.new(args[0].downcase.to_sym, args[1].split(","))

    block.call(command) if block_given?

    command
  end

  def initialize(name, params)
    @name = name
    @params = params || []
  end

end