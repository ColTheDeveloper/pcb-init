require_relative 'lib/pcb_init'

Gem::Specification.new do |spec|
  spec.name          = "pcb-init"
  spec.version       = PcbInit::VERSION
  spec.authors       = ["Colthedeveloper"]
  spec.email         = ["colakunleumaru@gmail.com"]

  spec.summary       = "Scaffold a best-practice KiCad PCB project structure"
  spec.description   = "A Ruby CLI tool that generates a well-organized folder structure for KiCad PCB projects"
  spec.homepage      = "https://github.com/colthedeveloper/pcb-init"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*", "bin/**/*", "README.md"]
  spec.bindir        = "bin"
  spec.executables   = ["pcb-init"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.0"
end
