class Command

  COMMANDS = [:place, :move, :left, :right, :report]

  attr_reader :name, :params

  def self.parse(input, &block)

    raise "Invalid command" if input.nil? || input.empty?

    args = input.split(" ")

    instruction = args[0].downcase.to_sym
    params = args[1].split(",") if args.count > 1

    raise "Invalid command" unless COMMANDS.include? instruction

    command = Command.new(instruction, params)

    block.call(command) if block_given?

    command
  end

  def initialize(name, params)
    @name = name
    @params = params || []
  end

end