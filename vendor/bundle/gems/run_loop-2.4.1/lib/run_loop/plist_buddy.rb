module RunLoop
  # A class for reading and writing property list values.
  #
  # Why not use CFPropertyList?  Because it is super wonky.  Among its other
  # faults, it matches Boolean to a string type with 'true/false' values which
  # is problematic for our purposes.
  class PlistBuddy

    # Reads key from file and returns the result.
    # @param [String] key the key to inspect (may not be nil or empty)
    # @param [String] file the plist to read
    # @param [Hash] opts options for controlling execution
    # @option opts [Boolean] :verbose (false) controls log level
    # @return [String] the value of the key
    # @raise [ArgumentError] if nil or empty key
    def plist_read(key, file, opts={})
      if key.nil? or key.length == 0
        raise(ArgumentError, "key '#{key}' must not be nil or empty")
      end
      cmd = build_plist_cmd(:print, {:key => key}, file)
      res = execute_plist_cmd(cmd, opts)
      if res == "Print: Entry, \":#{key}\", Does Not Exist"
        nil
      else
        res
      end
    end

    # Checks if the key exists in plist.
    # @param [String] key the key to inspect (may not be nil or empty)
    # @param [String] file the plist to read
    # @param [Hash] opts options for controlling execution
    # @option opts [Boolean] :verbose (false) controls log level
    # @return [Boolean] true if the key exists in plist file
    def plist_key_exists?(key, file, opts={})
      plist_read(key, file, opts) != nil
    end

    # Replaces or creates the value of key in the file.
    #
    # @param [String] key the key to set (may not be nil or empty)
    # @param [String] type the plist type (used only when adding a value)
    # @param [String] value the new value
    # @param [String] file the plist to read
    # @param [Hash] opts options for controlling execution
    # @option opts [Boolean] :verbose (false) controls log level
    # @return [Boolean] true if the operation was successful
    # @raise [ArgumentError] if nil or empty key
    def plist_set(key, type, value, file, opts={})
      default_opts = {:verbose => false}
      merged = default_opts.merge(opts)

      if key.nil? or key.length == 0
        raise(ArgumentError, "key '#{key}' must not be nil or empty")
      end

      cmd_args = {:key => key,
                  :type => type,
                  :value => value}

      if plist_key_exists?(key, file, merged)
        cmd = build_plist_cmd(:set, cmd_args, file)
      else
        cmd = build_plist_cmd(:add, cmd_args, file)
      end

      res = execute_plist_cmd(cmd, merged)
      res == ''
    end

    # Creates an new empty plist at `path`.
    #
    # Is not responsible for creating directories or ensuring write permissions.
    #
    # @param [String] path Where to create the new plist.
    def create_plist(path)
      File.open(path, 'w') do |file|
        file.puts "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
        file.puts "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">"
        file.puts "<plist version=\"1.0\">"
        file.puts '<dict>'
        file.puts '</dict>'
        file.puts '</plist>'
      end
      path
    end

    private

    # returns the path to the PlistBuddy executable
    # @return [String] path to PlistBuddy
    def plist_buddy
      '/usr/libexec/PlistBuddy'
    end

    # Executes cmd as a shell command and returns the result.
    #
    # @param [String] cmd shell command to execute
    # @param [Hash] opts options for controlling execution
    # @option opts [Boolean] :verbose (false) controls log level
    # @return [Boolean,String] `true` if command was successful.  If :print'ing
    #  the result, the value of the key.  If there is an error, the output of
    #  stderr.
    def execute_plist_cmd(cmd, opts={})
      default_opts = {:verbose => false}
      merged = default_opts.merge(opts)

      puts cmd if merged[:verbose]

      res = nil
      # noinspection RubyUnusedLocalVariable
      Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
        err = stderr.read
        std = stdout.read
        if not err.nil? and err != ''
          res = err.chomp
        else
          res = std.chomp
        end
      end
      res
    end

    # Composes a PlistBuddy command that can be executed as a shell command.
    #
    # @param [Symbol] type should be one of [:print, :set, :add]
    #
    # @param [Hash] args_hash arguments used to construct plist command
    # @option args_hash [String] :key (required) the plist key
    # @option args_hash [String] :value (required for :set and :add) the new value
    # @option args_hash [String] :type (required for :add) the new type of the value
    #
    # @param [String] file the plist file to interact with (must exist)
    #
    # @raise [RuntimeError] if file does not exist
    # @raise [ArgumentError] when invalid type is passed
    # @raise [ArgumentError] when args_hash does not include required key/value pairs
    #
    # @return [String] a shell-ready PlistBuddy command
    def build_plist_cmd(type, args_hash, file)

      unless File.exist?(File.expand_path(file))
        raise(RuntimeError, "plist '#{file}' does not exist - could not read")
      end

      case type
        when :add
          value_type = args_hash[:type]
          unless value_type
            raise(ArgumentError, ':value_type is a required key for :add command')
          end
          allowed_value_types = ['string', 'bool', 'real', 'integer']
          unless allowed_value_types.include?(value_type)
            raise(ArgumentError, "expected '#{value_type}' to be one of '#{allowed_value_types}'")
          end
          value = args_hash[:value]
          unless value
            raise(ArgumentError, ':value is a required key for :add command')
          end
          key = args_hash[:key]
          unless key
            raise(ArgumentError, ':key is a required key for :add command')
          end
          cmd_part = "\"Add :#{key} #{value_type} #{value}\""
        when :print
          key = args_hash[:key]
          unless key
            raise(ArgumentError, ':key is a required key for :print command')
          end
          cmd_part = "\"Print :#{key}\""
        when :set
          value = args_hash[:value]
          unless value
            raise(ArgumentError, ':value is a required key for :set command')
          end
          key = args_hash[:key]
          unless key
            raise(ArgumentError, ':key is a required key for :set command')
          end
          cmd_part = "\"Set :#{key} #{value}\""
        else
          cmds = [:add, :print, :set]
          raise(ArgumentError, "expected '#{type}' to be one of '#{cmds}'")
      end

      "#{plist_buddy} -c #{cmd_part} \"#{file}\""
    end
  end
end
