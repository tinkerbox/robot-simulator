class Command

  attr_reader :name, :params

  # Create a new command from a string
  def self.parse(data)
    # Ignore zero length commands
    if data.length > 0 then
      # Split up arguments
      args = data.split(" ")
      name = args[0].downcase.to_sym
      params = args[1].split(",") if args[1]
      # Create and return a new Command
      command = allocate
      command.send(:initialize, name, params)
      command
    end
  end

  def initialize(name, params = nil)
    @name = name
    @params = params
  end

end