module completions {

  def "nu-complete pixi color" [] {
    [ "always" "never" "auto" ]
  }

  #  Pixi [version 0.30.0] - Developer Workflow and Environment Management for Multi-Platform, Language-Agnostic Projects.  Pixi is a versatile developer workflow tool designed to streamline the management of your project's dependencies, tasks, and environments. Built on top of the Conda ecosystem, Pixi offers seamless integration with the PyPI ecosystem.  Basic Usage:     Initialize pixi for a project:     $ pixi init     $ pixi add python numpy pytest      Run a task:     $ pixi add task test 'pytest -s'     $ pixi run test  Found a Bug or Have a Feature Request? Open an issue at: https://github.com/prefix-dev/pixi/issues  Need Help? Ask a question on the Prefix Discord server: https://discord.gg/kKV8ZxyzY4  For more information, see the documentation at: https://pixi.sh 
  export extern pixi [
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  def "nu-complete pixi init format" [] {
    [ "pixi" "pyproject" ]
  }

  def "nu-complete pixi init color" [] {
    [ "always" "never" "auto" ]
  }

  # Creates a new project
  export extern "pixi init" [
    path?: string             # Where to place the project (defaults to current path)
    --channel(-c): string     # Channels to use in the project
    --platform(-p): string    # Platforms that the project supports
    --import(-i): string      # Environment.yml file to bootstrap the project
    --format: string@"nu-complete pixi init format" # The manifest format to create
    --pyproject-toml          # Create a pyproject.toml manifest instead of a pixi.toml manifest
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi init color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi add pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi add color" [] {
    [ "always" "never" "auto" ]
  }

  # Adds dependencies to the project
  export extern "pixi add" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    ...specs: string          # The dependencies as names, conda MatchSpecs or PyPi requirements
    --host                    # The specified dependencies are host dependencies. Conflicts with `build` and `pypi`
    --build                   # The specified dependencies are build dependencies. Conflicts with `host` and `pypi`
    --pypi                    # The specified dependencies are pypi dependencies. Conflicts with `host` and `build`
    --platform(-p): string    # The platform(s) for which the dependency should be modified
    --feature(-f): string     # The feature for which the dependency should be modified
    --no-lockfile-update      # Don't update lockfile, implies the no-install as well
    --frozen                  # Install the environment as defined in the lockfile, doesn't update lockfile if it isn't up-to-date with the manifest file
    --locked                  # Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn't up-to-date with the manifest file
    --no-install              # Don't modify the environment, only modify the lock-file
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi add pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --editable                # Whether the pypi requirement should be editable
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi add color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi remove pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi remove color" [] {
    [ "always" "never" "auto" ]
  }

  # Removes dependencies from the project
  export extern "pixi remove" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    ...specs: string          # The dependencies as names, conda MatchSpecs or PyPi requirements
    --host                    # The specified dependencies are host dependencies. Conflicts with `build` and `pypi`
    --build                   # The specified dependencies are build dependencies. Conflicts with `host` and `pypi`
    --pypi                    # The specified dependencies are pypi dependencies. Conflicts with `host` and `build`
    --platform(-p): string    # The platform(s) for which the dependency should be modified
    --feature(-f): string     # The feature for which the dependency should be modified
    --no-lockfile-update      # Don't update lockfile, implies the no-install as well
    --frozen                  # Install the environment as defined in the lockfile, doesn't update lockfile if it isn't up-to-date with the manifest file
    --locked                  # Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn't up-to-date with the manifest file
    --no-install              # Don't modify the environment, only modify the lock-file
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi remove pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi remove color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi install pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi install color" [] {
    [ "always" "never" "auto" ]
  }

  # Install all dependencies
  export extern "pixi install" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --frozen                  # Install the environment as defined in the lockfile, doesn't update lockfile if it isn't up-to-date with the manifest file
    --locked                  # Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn't up-to-date with the manifest file
    --environment(-e): string # The environment to install
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi install pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --all(-a)
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi install color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi update pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi update color" [] {
    [ "always" "never" "auto" ]
  }

  # Update dependencies as recorded in the local lock file
  export extern "pixi update" [
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi update pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --no-install              # Don't install the (solve) environments needed for pypi-dependencies solving
    --dry-run(-n)             # Don't actually write the lockfile or update any environment
    ...packages: string       # The packages to update
    --environment(-e): string # The environments to update. If none is specified, all environments are updated
    --platform(-p): string    # The platforms to update. If none is specified, all platforms are updated
    --json
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi update color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi run pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi run color" [] {
    [ "always" "never" "auto" ]
  }

  
  def "nu-complete pixi run" [] {
    ^pixi info --json | from json | get environments_info | get tasks | flatten | uniq
  }

  def "nu-complete pixi run environment" [] {
    ^pixi info --json | from json | get environments_info | get name
  }

  # Runs task in project
  export extern "pixi run" [
    ...task: string@"nu-complete pixi run"           # The pixi task or a task shell command you want to run in the project's environment, which can be an executable in the environment's PATH
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --no-lockfile-update      # Don't update lockfile, implies the no-install as well
    --frozen                  # Install the environment as defined in the lockfile, doesn't update lockfile if it isn't up-to-date with the manifest file
    --locked                  # Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn't up-to-date with the manifest file
    --no-install              # Don't modify the environment, only modify the lock-file
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi run pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --environment(-e): string@"nu-complete pixi run environment" # The environment to run the task in
    --clean-env               # Use a clean environment to run the task
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi run color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi exec pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi exec color" [] {
    [ "always" "never" "auto" ]
  }

  # Run a command in a temporary environment
  export extern "pixi exec" [
    ...command: string        # The executable to run
    --spec(-s): string        # Matchspecs of packages to install. If this is not provided, the package is guessed from the command
    --channel(-c): string     # The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times
    --force-reinstall         # If specified a new environment is always created even if one already exists
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi exec pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi exec color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi shell pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi shell change_ps1" [] {
    [ "true" "false" ]
  }

  def "nu-complete pixi shell color" [] {
    [ "always" "never" "auto" ]
  }

  # Start a shell in the pixi environment of the project
  export extern "pixi shell" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --no-lockfile-update      # Don't update lockfile, implies the no-install as well
    --frozen                  # Install the environment as defined in the lockfile, doesn't update lockfile if it isn't up-to-date with the manifest file
    --locked                  # Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn't up-to-date with the manifest file
    --no-install              # Don't modify the environment, only modify the lock-file
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi shell pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --environment(-e): string # The environment to activate in the shell
    --change-ps1: string@"nu-complete pixi shell change_ps1" # Do not change the PS1 variable when starting a prompt
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi shell color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi shell-hook pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi shell-hook change_ps1" [] {
    [ "true" "false" ]
  }

  def "nu-complete pixi shell-hook color" [] {
    [ "always" "never" "auto" ]
  }

  # Print the pixi environment activation script
  export extern "pixi shell-hook" [
    --shell(-s): string       # Sets the shell, options: [`bash`,  `zsh`,  `xonsh`,  `cmd`, `powershell`,  `fish`,  `nushell`]
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --no-lockfile-update      # Don't update lockfile, implies the no-install as well
    --frozen                  # Install the environment as defined in the lockfile, doesn't update lockfile if it isn't up-to-date with the manifest file
    --locked                  # Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn't up-to-date with the manifest file
    --no-install              # Don't modify the environment, only modify the lock-file
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi shell-hook pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --environment(-e): string # The environment to activate in the script
    --json                    # Emit the environment variables set by running the activation as JSON
    --change-ps1: string@"nu-complete pixi shell-hook change_ps1" # Do not change the PS1 variable when starting a prompt
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi shell-hook color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi project color" [] {
    [ "always" "never" "auto" ]
  }

  # Modify the project configuration file through the command line
  export extern "pixi project" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project channel color" [] {
    [ "always" "never" "auto" ]
  }

  # Commands to manage project channels
  export extern "pixi project channel" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project channel color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project channel add color" [] {
    [ "always" "never" "auto" ]
  }

  # Adds a channel to the project file and updates the lockfile
  export extern "pixi project channel add" [
    ...channel: string        # The channel name or URL
    --no-install              # Don't update the environment, only modify the manifest and the lock-file
    --feature(-f): string     # The name of the feature to modify
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project channel add color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project channel list color" [] {
    [ "always" "never" "auto" ]
  }

  # List the channels in the project file
  export extern "pixi project channel list" [
    --urls                    # Whether to display the channel's names or urls
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project channel list color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project channel remove color" [] {
    [ "always" "never" "auto" ]
  }

  # Remove channel(s) from the project file and updates the lockfile
  export extern "pixi project channel remove" [
    ...channel: string        # The channel name or URL
    --no-install              # Don't update the environment, only modify the manifest and the lock-file
    --feature(-f): string     # The name of the feature to modify
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project channel remove color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project channel help" [
  ]

  # Adds a channel to the project file and updates the lockfile
  export extern "pixi project channel help add" [
  ]

  # List the channels in the project file
  export extern "pixi project channel help list" [
  ]

  # Remove channel(s) from the project file and updates the lockfile
  export extern "pixi project channel help remove" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project channel help help" [
  ]

  def "nu-complete pixi project description color" [] {
    [ "always" "never" "auto" ]
  }

  # Commands to manage project description
  export extern "pixi project description" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project description color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project description get color" [] {
    [ "always" "never" "auto" ]
  }

  # Get the project description
  export extern "pixi project description get" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project description get color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project description set color" [] {
    [ "always" "never" "auto" ]
  }

  # Set the project description
  export extern "pixi project description set" [
    description: string       # The project description
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project description set color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project description help" [
  ]

  # Get the project description
  export extern "pixi project description help get" [
  ]

  # Set the project description
  export extern "pixi project description help set" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project description help help" [
  ]

  def "nu-complete pixi project platform color" [] {
    [ "always" "never" "auto" ]
  }

  # Commands to manage project platforms
  export extern "pixi project platform" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project platform color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project platform add color" [] {
    [ "always" "never" "auto" ]
  }

  # Adds a platform(s) to the project file and updates the lockfile
  export extern "pixi project platform add" [
    ...platform: string       # The platform name(s) to add
    --no-install              # Don't update the environment, only add changed packages to the lock-file
    --feature(-f): string     # The name of the feature to add the platform to
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project platform add color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project platform list color" [] {
    [ "always" "never" "auto" ]
  }

  # List the platforms in the project file
  export extern "pixi project platform list" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project platform list color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project platform remove color" [] {
    [ "always" "never" "auto" ]
  }

  # Remove platform(s) from the project file and updates the lockfile
  export extern "pixi project platform remove" [
    ...platform: string       # The platform name(s) to remove
    --no-install              # Don't update the environment, only remove the platform(s) from the lock-file
    --feature(-f): string     # The name of the feature to remove the platform from
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project platform remove color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project platform help" [
  ]

  # Adds a platform(s) to the project file and updates the lockfile
  export extern "pixi project platform help add" [
  ]

  # List the platforms in the project file
  export extern "pixi project platform help list" [
  ]

  # Remove platform(s) from the project file and updates the lockfile
  export extern "pixi project platform help remove" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project platform help help" [
  ]

  def "nu-complete pixi project version color" [] {
    [ "always" "never" "auto" ]
  }

  # Commands to manage project version
  export extern "pixi project version" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project version color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project version get color" [] {
    [ "always" "never" "auto" ]
  }

  # Get the project version
  export extern "pixi project version get" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project version get color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project version set color" [] {
    [ "always" "never" "auto" ]
  }

  # Set the project version
  export extern "pixi project version set" [
    version: string           # The new project version
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project version set color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project version major color" [] {
    [ "always" "never" "auto" ]
  }

  # Bump the project version to MAJOR
  export extern "pixi project version major" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project version major color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project version minor color" [] {
    [ "always" "never" "auto" ]
  }

  # Bump the project version to MINOR
  export extern "pixi project version minor" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project version minor color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project version patch color" [] {
    [ "always" "never" "auto" ]
  }

  # Bump the project version to PATCH
  export extern "pixi project version patch" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project version patch color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project version help" [
  ]

  # Get the project version
  export extern "pixi project version help get" [
  ]

  # Set the project version
  export extern "pixi project version help set" [
  ]

  # Bump the project version to MAJOR
  export extern "pixi project version help major" [
  ]

  # Bump the project version to MINOR
  export extern "pixi project version help minor" [
  ]

  # Bump the project version to PATCH
  export extern "pixi project version help patch" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project version help help" [
  ]

  def "nu-complete pixi project environment color" [] {
    [ "always" "never" "auto" ]
  }

  # Commands to manage project environments
  export extern "pixi project environment" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project environment color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project environment add color" [] {
    [ "always" "never" "auto" ]
  }

  # Adds an environment to the manifest file
  export extern "pixi project environment add" [
    name: string              # The name of the environment to add
    --feature(-f): string     # Features to add to the environment
    --solve-group: string     # The solve-group to add the environment to
    --no-default-feature      # Don't include the default feature in the environment
    --force                   # Update the manifest even if the environment already exists
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project environment add color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project environment list color" [] {
    [ "always" "never" "auto" ]
  }

  # List the environments in the manifest file
  export extern "pixi project environment list" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project environment list color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project environment remove color" [] {
    [ "always" "never" "auto" ]
  }

  # Remove an environment from the manifest file
  export extern "pixi project environment remove" [
    name: string              # The name of the environment to remove
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project environment remove color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project environment help" [
  ]

  # Adds an environment to the manifest file
  export extern "pixi project environment help add" [
  ]

  # List the environments in the manifest file
  export extern "pixi project environment help list" [
  ]

  # Remove an environment from the manifest file
  export extern "pixi project environment help remove" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project environment help help" [
  ]

  def "nu-complete pixi project export color" [] {
    [ "always" "never" "auto" ]
  }

  # Commands to export projects to other formats
  export extern "pixi project export" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project export color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project export conda-explicit-spec pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi project export conda-explicit-spec color" [] {
    [ "always" "never" "auto" ]
  }

  # Export project environment to a conda explicit specification file
  export extern "pixi project export conda-explicit-spec" [
    output_dir: string        # Output directory for rendered explicit environment spec files
    --environment(-e): string # Environment to render. Can be repeated for multiple envs. Defaults to all environments
    --platform(-p): string    # The platform to render. Can be repeated for multiple platforms. Defaults to all platforms available for selected environments
    --ignore-pypi-errors      # PyPI dependencies are not supported in the conda explicit spec file. This flag allows creating the spec file even if PyPI dependencies are present
    --no-lockfile-update      # Don't update lockfile, implies the no-install as well
    --frozen                  # Install the environment as defined in the lockfile, doesn't update lockfile if it isn't up-to-date with the manifest file
    --locked                  # Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn't up-to-date with the manifest file
    --no-install              # Don't modify the environment, only modify the lock-file
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi project export conda-explicit-spec pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project export conda-explicit-spec color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi project export conda-environment color" [] {
    [ "always" "never" "auto" ]
  }

  # Export project environment to a conda environment.yaml file
  export extern "pixi project export conda-environment" [
    output_path?: string      # Explicit path to export the environment to
    --platform(-p): string    # The platform to render the environment file for. Defaults to the current platform
    --environment(-e): string # The environment to render the environment file for. Defaults to the default environment
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi project export conda-environment color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project export help" [
  ]

  # Export project environment to a conda explicit specification file
  export extern "pixi project export help conda-explicit-spec" [
  ]

  # Export project environment to a conda environment.yaml file
  export extern "pixi project export help conda-environment" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project export help help" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project help" [
  ]

  # Commands to manage project channels
  export extern "pixi project help channel" [
  ]

  # Adds a channel to the project file and updates the lockfile
  export extern "pixi project help channel add" [
  ]

  # List the channels in the project file
  export extern "pixi project help channel list" [
  ]

  # Remove channel(s) from the project file and updates the lockfile
  export extern "pixi project help channel remove" [
  ]

  # Commands to manage project description
  export extern "pixi project help description" [
  ]

  # Get the project description
  export extern "pixi project help description get" [
  ]

  # Set the project description
  export extern "pixi project help description set" [
  ]

  # Commands to manage project platforms
  export extern "pixi project help platform" [
  ]

  # Adds a platform(s) to the project file and updates the lockfile
  export extern "pixi project help platform add" [
  ]

  # List the platforms in the project file
  export extern "pixi project help platform list" [
  ]

  # Remove platform(s) from the project file and updates the lockfile
  export extern "pixi project help platform remove" [
  ]

  # Commands to manage project version
  export extern "pixi project help version" [
  ]

  # Get the project version
  export extern "pixi project help version get" [
  ]

  # Set the project version
  export extern "pixi project help version set" [
  ]

  # Bump the project version to MAJOR
  export extern "pixi project help version major" [
  ]

  # Bump the project version to MINOR
  export extern "pixi project help version minor" [
  ]

  # Bump the project version to PATCH
  export extern "pixi project help version patch" [
  ]

  # Commands to manage project environments
  export extern "pixi project help environment" [
  ]

  # Adds an environment to the manifest file
  export extern "pixi project help environment add" [
  ]

  # List the environments in the manifest file
  export extern "pixi project help environment list" [
  ]

  # Remove an environment from the manifest file
  export extern "pixi project help environment remove" [
  ]

  # Commands to export projects to other formats
  export extern "pixi project help export" [
  ]

  # Export project environment to a conda explicit specification file
  export extern "pixi project help export conda-explicit-spec" [
  ]

  # Export project environment to a conda environment.yaml file
  export extern "pixi project help export conda-environment" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project help help" [
  ]

  def "nu-complete pixi task color" [] {
    [ "always" "never" "auto" ]
  }

  # Interact with tasks in the project
  export extern "pixi task" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi task color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi task add color" [] {
    [ "always" "never" "auto" ]
  }

  # Add a command to the project
  export extern "pixi task add" [
    name: string              # Task name
    ...commands: string       # One or more commands to actually execute
    --depends-on: string      # Depends on these other commands
    --platform(-p): string    # The platform for which the task should be added
    --feature(-f): string     # The feature for which the task should be added
    --cwd: string             # The working directory relative to the root of the project
    --env: string             # The environment variable to set, use --env key=value multiple times for more than one variable
    --description: string     # A description of the task to be added
    --clean-env               # Isolate the task from the shell environment, and only use the pixi environment to run the task
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi task add color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi task remove color" [] {
    [ "always" "never" "auto" ]
  }

  # Remove a command from the project
  export extern "pixi task remove" [
    ...names: string          # Task names to remove
    --platform(-p): string    # The platform for which the task should be removed
    --feature(-f): string     # The feature for which the task should be removed
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi task remove color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi task alias color" [] {
    [ "always" "never" "auto" ]
  }

  # Alias another specific command
  export extern "pixi task alias" [
    alias: string             # Alias name
    ...depends_on: string     # Depends on these tasks to execute
    --platform(-p): string    # The platform for which the alias should be added
    --description: string     # The description of the alias task
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi task alias color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi task list color" [] {
    [ "always" "never" "auto" ]
  }

  # List all tasks in the project
  export extern "pixi task list" [
    --summary(-s)             # Tasks available for this machine per environment
    --machine-readable        # Output the list of tasks from all environments in machine readable format (space delimited) this output is used for autocomplete by `pixi run`
    --environment(-e): string # The environment the list should be generated for. If not specified, the default environment is used
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi task list color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi task help" [
  ]

  # Add a command to the project
  export extern "pixi task help add" [
  ]

  # Remove a command from the project
  export extern "pixi task help remove" [
  ]

  # Alias another specific command
  export extern "pixi task help alias" [
  ]

  # List all tasks in the project
  export extern "pixi task help list" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi task help help" [
  ]

  def "nu-complete pixi list sort_by" [] {
    [ "size" "name" "kind" ]
  }

  def "nu-complete pixi list pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi list color" [] {
    [ "always" "never" "auto" ]
  }

  # List project's packages
  export extern "pixi list" [
    regex?: string            # List only packages matching a regular expression
    --platform: string        # The platform to list packages for. Defaults to the current platform
    --json                    # Whether to output in json format
    --json-pretty             # Whether to output in pretty json format
    --sort-by: string@"nu-complete pixi list sort_by" # Sorting strategy
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --environment(-e): string # The environment to list packages for. Defaults to the default environment
    --no-lockfile-update      # Don't update lockfile, implies the no-install as well
    --frozen                  # Install the environment as defined in the lockfile, doesn't update lockfile if it isn't up-to-date with the manifest file
    --locked                  # Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn't up-to-date with the manifest file
    --no-install              # Don't modify the environment, only modify the lock-file
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi list pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --explicit(-x)            # Only list packages that are explicitly defined in the project
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi list color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi tree pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi tree color" [] {
    [ "always" "never" "auto" ]
  }

  # Show a tree of project dependencies
  export extern "pixi tree" [
    regex?: string            # List only packages matching a regular expression
    --platform(-p): string    # The platform to list packages for. Defaults to the current platform
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --environment(-e): string # The environment to list packages for. Defaults to the default environment
    --no-lockfile-update      # Don't update lockfile, implies the no-install as well
    --frozen                  # Install the environment as defined in the lockfile, doesn't update lockfile if it isn't up-to-date with the manifest file
    --locked                  # Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn't up-to-date with the manifest file
    --no-install              # Don't modify the environment, only modify the lock-file
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi tree pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --invert(-i)              # Invert tree and show what depends on given package in the regex argument
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi tree color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi global color" [] {
    [ "always" "never" "auto" ]
  }

  # Subcommand for global package management actions
  export extern "pixi global" [
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi global color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi global install pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi global install color" [] {
    [ "always" "never" "auto" ]
  }

  # Installs the defined package in a global accessible location
  export extern "pixi global install" [
    ...packages: string       # Specifies the packages that are to be installed
    --channel(-c): string     # The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times
    --platform(-p): string
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi global install pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi global install color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi global remove color" [] {
    [ "always" "never" "auto" ]
  }

  # Removes a package previously installed into a globally accessible location via `pixi global install`
  export extern "pixi global remove" [
    ...packages: string       # Specifies the packages that are to be removed
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi global remove color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi global list color" [] {
    [ "always" "never" "auto" ]
  }

  # Lists all packages previously installed into a globally accessible location via `pixi global install`
  export extern "pixi global list" [
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi global list color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi global upgrade color" [] {
    [ "always" "never" "auto" ]
  }

  # Upgrade specific package which is installed globally
  export extern "pixi global upgrade" [
    ...specs: string          # Specifies the packages to upgrade
    --channel(-c): string     # The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times
    --platform: string        # The platform to install the package for
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi global upgrade color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi global upgrade-all pypi_keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete pixi global upgrade-all color" [] {
    [ "always" "never" "auto" ]
  }

  # Upgrade all globally installed packages
  export extern "pixi global upgrade-all" [
    --channel(-c): string     # The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times
    --tls-no-verify           # Do not verify the TLS certificate of the server
    --auth-file: string       # Path to the file containing the authentication token
    --pypi-keyring-provider: string@"nu-complete pixi global upgrade-all pypi_keyring_provider" # Specifies if we want to use uv keyring provider
    --platform: string        # The platform to install the package for
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi global upgrade-all color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi global help" [
  ]

  # Installs the defined package in a global accessible location
  export extern "pixi global help install" [
  ]

  # Removes a package previously installed into a globally accessible location via `pixi global install`
  export extern "pixi global help remove" [
  ]

  # Lists all packages previously installed into a globally accessible location via `pixi global install`
  export extern "pixi global help list" [
  ]

  # Upgrade specific package which is installed globally
  export extern "pixi global help upgrade" [
  ]

  # Upgrade all globally installed packages
  export extern "pixi global help upgrade-all" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi global help help" [
  ]

  def "nu-complete pixi auth color" [] {
    [ "always" "never" "auto" ]
  }

  # Login to prefix.dev or anaconda.org servers to access private channels
  export extern "pixi auth" [
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi auth color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi auth login color" [] {
    [ "always" "never" "auto" ]
  }

  # Store authentication information for a given host
  export extern "pixi auth login" [
    host: string              # The host to authenticate with (e.g. repo.prefix.dev)
    --token: string           # The token to use (for authentication with prefix.dev)
    --username: string        # The username to use (for basic HTTP authentication)
    --password: string        # The password to use (for basic HTTP authentication)
    --conda-token: string     # The token to use on anaconda.org / quetz authentication
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi auth login color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi auth logout color" [] {
    [ "always" "never" "auto" ]
  }

  # Remove authentication information for a given host
  export extern "pixi auth logout" [
    host: string              # The host to remove authentication for
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi auth logout color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi auth help" [
  ]

  # Store authentication information for a given host
  export extern "pixi auth help login" [
  ]

  # Remove authentication information for a given host
  export extern "pixi auth help logout" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi auth help help" [
  ]

  def "nu-complete pixi config color" [] {
    [ "always" "never" "auto" ]
  }

  # Configuration management
  export extern "pixi config" [
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi config color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi config edit color" [] {
    [ "always" "never" "auto" ]
  }

  # Edit the configuration file
  export extern "pixi config edit" [
    --local(-l)               # Operation on project-local configuration
    --global(-g)              # Operation on global configuration
    --system(-s)              # Operation on system configuration
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi config edit color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi config list color" [] {
    [ "always" "never" "auto" ]
  }

  # List configuration values
  export extern "pixi config list" [
    key?: string              # Configuration key to show (all if not provided)
    --json                    # Output in JSON format
    --local(-l)               # Operation on project-local configuration
    --global(-g)              # Operation on global configuration
    --system(-s)              # Operation on system configuration
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi config list color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi config prepend color" [] {
    [ "always" "never" "auto" ]
  }

  # Prepend a value to a list configuration key
  export extern "pixi config prepend" [
    key: string               # Configuration key to set
    value: string             # Configuration value to (pre|ap)pend
    --local(-l)               # Operation on project-local configuration
    --global(-g)              # Operation on global configuration
    --system(-s)              # Operation on system configuration
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi config prepend color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi config append color" [] {
    [ "always" "never" "auto" ]
  }

  # Append a value to a list configuration key
  export extern "pixi config append" [
    key: string               # Configuration key to set
    value: string             # Configuration value to (pre|ap)pend
    --local(-l)               # Operation on project-local configuration
    --global(-g)              # Operation on global configuration
    --system(-s)              # Operation on system configuration
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi config append color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi config set color" [] {
    [ "always" "never" "auto" ]
  }

  # Set a configuration value
  export extern "pixi config set" [
    key: string               # Configuration key to set
    value?: string            # Configuration value to set (key will be unset if value not provided)
    --local(-l)               # Operation on project-local configuration
    --global(-g)              # Operation on global configuration
    --system(-s)              # Operation on system configuration
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi config set color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi config unset color" [] {
    [ "always" "never" "auto" ]
  }

  # Unset a configuration value
  export extern "pixi config unset" [
    key: string               # Configuration key to unset
    --local(-l)               # Operation on project-local configuration
    --global(-g)              # Operation on global configuration
    --system(-s)              # Operation on system configuration
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi config unset color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi config help" [
  ]

  # Edit the configuration file
  export extern "pixi config help edit" [
  ]

  # List configuration values
  export extern "pixi config help list" [
  ]

  # Prepend a value to a list configuration key
  export extern "pixi config help prepend" [
  ]

  # Append a value to a list configuration key
  export extern "pixi config help append" [
  ]

  # Set a configuration value
  export extern "pixi config help set" [
  ]

  # Unset a configuration value
  export extern "pixi config help unset" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi config help help" [
  ]

  def "nu-complete pixi info color" [] {
    [ "always" "never" "auto" ]
  }

  # Information about the system, project and environments for the current machine
  export extern "pixi info" [
    --extended                # Show cache and environment size
    --json                    # Whether to show the output as JSON or not
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi info color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi upload color" [] {
    [ "always" "never" "auto" ]
  }

  # Upload a conda package
  export extern "pixi upload" [
    host: string              # The host + channel to upload to
    package_file: string      # The file to upload
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi upload color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi search color" [] {
    [ "always" "never" "auto" ]
  }

  # Search a conda package
  export extern "pixi search" [
    package: string           # Name of package to search
    --channel(-c): string     # The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --platform(-p): string    # The platform to search for, defaults to current platform
    --limit(-l): string       # Limit the number of search results
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi search color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi self-update color" [] {
    [ "always" "never" "auto" ]
  }

  # Update pixi to the latest version or a specific version
  export extern "pixi self-update" [
    --version: string         # The desired version (to downgrade or upgrade to). Update to the latest version if not specified
    --force                   # Force the update even if the pixi binary is not found in the default location
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi self-update color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete pixi clean color" [] {
    [ "always" "never" "auto" ]
  }

  # Clean the parts of your system which are touched by pixi. Defaults to cleaning the environments and task cache. Use the `cache` subcommand to clean the cache
  export extern "pixi clean" [
    --manifest-path: string   # The path to 'pixi.toml' or 'pyproject.toml'
    --environment(-e): string # The environment directory to remove
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi clean color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  def "nu-complete pixi clean cache color" [] {
    [ "always" "never" "auto" ]
  }

  # Clean the cache of your system which are touched by pixi
  export extern "pixi clean cache" [
    --pypi                    # Clean only the pypi related cache
    --conda                   # Clean only the conda related cache
    --mapping                 # Clean only the mapping cache
    --exec                    # Clean only `exec` cache
    --repodata                # Clean only the repodata cache
    --assume-yes(-y)          # Answer yes to all questions
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi clean cache color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi clean help" [
  ]

  # Clean the cache of your system which are touched by pixi
  export extern "pixi clean help cache" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi clean help help" [
  ]

  def "nu-complete pixi completion shell" [] {
    [ "bash" "elvish" "fish" "nushell" "powershell" "zsh" ]
  }

  def "nu-complete pixi completion color" [] {
    [ "always" "never" "auto" ]
  }

  # Generates a completion script for a shell
  export extern "pixi completion" [
    --shell(-s): string@"nu-complete pixi completion shell" # The shell to generate a completion script for
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --color: string@"nu-complete pixi completion color" # Whether the log needs to be colored
    --no-progress             # Hide all progress bars
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi help" [
  ]

  # Creates a new project
  export extern "pixi help init" [
  ]

  # Adds dependencies to the project
  export extern "pixi help add" [
  ]

  # Removes dependencies from the project
  export extern "pixi help remove" [
  ]

  # Install all dependencies
  export extern "pixi help install" [
  ]

  # Update dependencies as recorded in the local lock file
  export extern "pixi help update" [
  ]

  # Runs task in project
  export extern "pixi help run" [
  ]

  # Run a command in a temporary environment
  export extern "pixi help exec" [
  ]

  # Start a shell in the pixi environment of the project
  export extern "pixi help shell" [
  ]

  # Print the pixi environment activation script
  export extern "pixi help shell-hook" [
  ]

  # Modify the project configuration file through the command line
  export extern "pixi help project" [
  ]

  # Commands to manage project channels
  export extern "pixi help project channel" [
  ]

  # Adds a channel to the project file and updates the lockfile
  export extern "pixi help project channel add" [
  ]

  # List the channels in the project file
  export extern "pixi help project channel list" [
  ]

  # Remove channel(s) from the project file and updates the lockfile
  export extern "pixi help project channel remove" [
  ]

  # Commands to manage project description
  export extern "pixi help project description" [
  ]

  # Get the project description
  export extern "pixi help project description get" [
  ]

  # Set the project description
  export extern "pixi help project description set" [
  ]

  # Commands to manage project platforms
  export extern "pixi help project platform" [
  ]

  # Adds a platform(s) to the project file and updates the lockfile
  export extern "pixi help project platform add" [
  ]

  # List the platforms in the project file
  export extern "pixi help project platform list" [
  ]

  # Remove platform(s) from the project file and updates the lockfile
  export extern "pixi help project platform remove" [
  ]

  # Commands to manage project version
  export extern "pixi help project version" [
  ]

  # Get the project version
  export extern "pixi help project version get" [
  ]

  # Set the project version
  export extern "pixi help project version set" [
  ]

  # Bump the project version to MAJOR
  export extern "pixi help project version major" [
  ]

  # Bump the project version to MINOR
  export extern "pixi help project version minor" [
  ]

  # Bump the project version to PATCH
  export extern "pixi help project version patch" [
  ]

  # Commands to manage project environments
  export extern "pixi help project environment" [
  ]

  # Adds an environment to the manifest file
  export extern "pixi help project environment add" [
  ]

  # List the environments in the manifest file
  export extern "pixi help project environment list" [
  ]

  # Remove an environment from the manifest file
  export extern "pixi help project environment remove" [
  ]

  # Commands to export projects to other formats
  export extern "pixi help project export" [
  ]

  # Export project environment to a conda explicit specification file
  export extern "pixi help project export conda-explicit-spec" [
  ]

  # Export project environment to a conda environment.yaml file
  export extern "pixi help project export conda-environment" [
  ]

  # Interact with tasks in the project
  export extern "pixi help task" [
  ]

  # Add a command to the project
  export extern "pixi help task add" [
  ]

  # Remove a command from the project
  export extern "pixi help task remove" [
  ]

  # Alias another specific command
  export extern "pixi help task alias" [
  ]

  # List all tasks in the project
  export extern "pixi help task list" [
  ]

  # List project's packages
  export extern "pixi help list" [
  ]

  # Show a tree of project dependencies
  export extern "pixi help tree" [
  ]

  # Subcommand for global package management actions
  export extern "pixi help global" [
  ]

  # Installs the defined package in a global accessible location
  export extern "pixi help global install" [
  ]

  # Removes a package previously installed into a globally accessible location via `pixi global install`
  export extern "pixi help global remove" [
  ]

  # Lists all packages previously installed into a globally accessible location via `pixi global install`
  export extern "pixi help global list" [
  ]

  # Upgrade specific package which is installed globally
  export extern "pixi help global upgrade" [
  ]

  # Upgrade all globally installed packages
  export extern "pixi help global upgrade-all" [
  ]

  # Login to prefix.dev or anaconda.org servers to access private channels
  export extern "pixi help auth" [
  ]

  # Store authentication information for a given host
  export extern "pixi help auth login" [
  ]

  # Remove authentication information for a given host
  export extern "pixi help auth logout" [
  ]

  # Configuration management
  export extern "pixi help config" [
  ]

  # Edit the configuration file
  export extern "pixi help config edit" [
  ]

  # List configuration values
  export extern "pixi help config list" [
  ]

  # Prepend a value to a list configuration key
  export extern "pixi help config prepend" [
  ]

  # Append a value to a list configuration key
  export extern "pixi help config append" [
  ]

  # Set a configuration value
  export extern "pixi help config set" [
  ]

  # Unset a configuration value
  export extern "pixi help config unset" [
  ]

  # Information about the system, project and environments for the current machine
  export extern "pixi help info" [
  ]

  # Upload a conda package
  export extern "pixi help upload" [
  ]

  # Search a conda package
  export extern "pixi help search" [
  ]

  # Update pixi to the latest version or a specific version
  export extern "pixi help self-update" [
  ]

  # Clean the parts of your system which are touched by pixi. Defaults to cleaning the environments and task cache. Use the `cache` subcommand to clean the cache
  export extern "pixi help clean" [
  ]

  # Clean the cache of your system which are touched by pixi
  export extern "pixi help clean cache" [
  ]

  # Generates a completion script for a shell
  export extern "pixi help completion" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi help help" [
  ]

}

export use completions *
