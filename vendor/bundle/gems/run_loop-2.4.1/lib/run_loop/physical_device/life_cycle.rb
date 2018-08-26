module RunLoop
  # @!visibility private
  module PhysicalDevice

    # Raised when installation fails.
    class InstallError < RuntimeError; end

    # Raised when uninstall fails.
    class UninstallError < RuntimeError; end

    # Raised when tool cannot perform task.
    class NotImplementedError < StandardError; end

    # Controls the behavior of various life cycle commands.
    #
    # You can override these values if they do not work in your environment.
    #
    # For cucumber users, the best place to override would be in your
    # features/support/env.rb.
    #
    # For example:
    #
    # RunLoop::PhysicalDevice::LifeCycle::DEFAULT_OPTIONS[:timeout] = 60
    DEFAULT_OPTIONS = {
      :install_timeout => RunLoop::Environment.ci? ? 120 : 30
    }

    # @!visibility private
    class LifeCycle

      require "run_loop/abstract"
      include RunLoop::Abstract

      require "run_loop/shell"
      include RunLoop::Shell

      attr_reader :device

      # Create a new instance.
      #
      # @param [RunLoop::Device] device A physical device.
      # @raise [ArgumentError] If device is a simulator.
      def initialize(device)
        if !device.physical_device?
          raise ArgumentError, %Q[Device:

#{device}

must be a physical device.]
        end
        @device = device
      end

      # Is the tool installed?
      def self.tool_is_installed?
        raise RunLoop::Abstract::AbstractMethodError,
          "Subclass must implement '.tool_is_installed?'"
      end

      # Path to tool.
      def self.executable_path
        raise RunLoop::Abstract::AbstractMethodError,
          "Subclass must implement '.executable_path'"
      end

      # Is the app installed?
      #
      # @param [String] bundle_id The CFBundleIdentifier of an app.
      # @return [Boolean] true or false
      def app_installed?(bundle_id)
        abstract_method!
      end

      # Install the app or ipa.
      #
      # If the app is already installed, it will be reinstalled from disk;
      # no version check is performed.
      #
      # App data is never preserved.  If you want to preserve the app data,
      # call `ensure_newest_installed`.
      #
      # Possible return values:
      #
      # * :reinstalled => app was installed, but app data was not preserved.
      # * :installed => app was not installed.
      #
      # @param [RunLoop::Ipa, RunLoop::App] app_or_ipa The ipa to install.
      #   The caller is responsible for validating the ipa for the device by
      #   checking that the codesign and instruction set is correct.
      #
      # @raise [InstallError] If app was not installed.
      #
      # @return [Symbol] A keyword describing the action that was performed.
      def install_app(app_or_ipa)
        abstract_method!
      end

      # Uninstall the app with bundle_id.
      #
      # App data is never preserved.  If you want to install a new version of
      # an app and preserve app data (upgrade testing), call
      # `ensure_newest_installed`.
      #
      # Possible return values:
      #
      # * :nothing => app was not installed
      # * :uninstall => app was uninstalled
      #
      # @param [String] bundle_id The CFBundleIdentifier of an app.
      #
      # @raise [UninstallError] If the app cannot be uninstalled, usually
      #   because it is a system app.
      #
      # @return [Symbol] A keyword that describes what action was performed.
      def uninstall_app(bundle_id)
        abstract_method!
      end

      # Ensures the app is installed and ensures that app is not stale by
      # asking if the version of installed app is different than the version
      # of the app or ipa on disk.
      #
      # The concrete implementation needs to check the CFBundleVersion and
      # the CFBundleShortVersionString.  If either are different, then the
      # app should be reinstalled.
      #
      # If possible, the app data should be preserved across reinstallation.
      #
      # Possible return values:
      #
      # * :nothing => app was already installed and versions matched.
      # * :upgraded => app was stale; newer version from disk was installed and
      #                app data was preserved.
      # * :reinstalled => app was stale; newer version from disk was installed,
      #                   but app data was not preserved.
      # * :installed => app was not installed.
      #
      # @param [RunLoop::Ipa, RunLoop::App] app_or_ipa The ipa to install.
      #   The caller is responsible for validating the ipa for the device by
      #   checking that the codesign and instruction set is correct.
      #
      # @raise [InstallError] If the app could not be installed.
      # @raise [UninstallError] If the app could not be uninstalled.
      #
      # @return [Symbol] A keyword that describes the action that was taken.
      def ensure_newest_installed(app_or_ipa)
        abstract_method!
      end

      # Is the app on disk the same as the installed app?
      #
      # The concrete implementation needs to check the CFBundleVersion and
      # the CFBundleShortVersionString. If either are different, then this
      # method returns false.
      #
      # @param [RunLoop::Ipa, RunLoop::App] app_or_ipa The ipa to install.
      #   The caller is responsible for validating the ipa for the device by
      #   checking that the codesign and instruction set is correct.
      #
      # @raise [RuntimeError] If app is not already installed.
      def installed_app_same_as?(app_or_ipa)
        abstract_method!
      end

      # Returns true if this tool can reset an app's sandbox without
      # uninstalling the app.
      def can_reset_app_sandbox?
        abstract_method!
      end

      # Clear the app sandbox.
      #
      # This method will never uninstall the app.  If the concrete
      # implementation cannot reset the app data, this method should raise
      # a RunLoop::PhysicalDevice::NotImplementedError
      #
      # Does not clear Keychain.  Use the Calabash iOS Keychain API.
      #
      # @param [String] bundle_id The CFBundleIdentifier of an app.
      #
      # @raise [RunLoop::PhysicalDevice::NotImplementedError] If this tool
      #   cannot reset the app sandbox without unintalling the app.
      def reset_app_sandbox(bundle_id)
        abstract_method!
      end

      # Return the architecture of the device.
      def architecture
        abstract_method!
      end

      # Is the app or ipa compatible with the architecture of the device?
      def app_has_compatible_architecture?(app_or_ipa)
        abstract_method!
      end

      # Return true if the device is an iPhone.
      def iphone?
        abstract_method!
      end

      # Return false if the device is an iPad.
      def ipad?
        abstract_method!
      end

      # Return the model of the device.
      def model
        abstract_method!
      end

      # Sideload data into the app's sandbox.
      #
      # These directories exist in the application sandbox.
      #
      # * sandbox/Documents
      # * sandbox/Library
      # * sandbox/Library/Preferences
      # * sandbox/tmp
      #
      # Behavior TBD.
      def sideload(data)
        raise NotImplementedError,
          "The behavior of the sideload method has not been determined"
      end

      # Removes a file or directory from the app sandbox.
      #
      # Behavior TBD.
      def remove_from_sandbox(path)
        raise NotImplementedError,
          "The behavior of the remove_from_sandbox method has not been determined"
      end

      # @!visibility private
      def expect_app_or_ipa(app_or_ipa)
        if ![is_app?(app_or_ipa), is_ipa?(app_or_ipa)].any?
          if app_or_ipa.nil?
            object = "nil"
          elsif app_or_ipa == ""
            object = "<empty string>"
          else
            object = app_or_ipa
          end

          raise ArgumentError, %Q[Expected:

#{object}

to be a RunLoop::App or a RunLoop::Ipa.]
        end

        true
      end

      # @!visibility private
      def is_app?(app_or_ipa)
        app_or_ipa.is_a?(RunLoop::App)
      end

      # @!visibility private
      def is_ipa?(app_or_ipa)
        app_or_ipa.is_a?(RunLoop::Ipa)
      end
    end
  end
end

