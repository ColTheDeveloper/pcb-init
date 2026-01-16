require 'fileutils'

class PcbInit
  VERSION = '0.1.2'

  def self.run(argv)
    new.run(argv)
  end

  def run(argv)
    if argv.include?('--version') || argv.include?('-v')
      show_version
      return
    end

    if argv.empty? || argv.include?('--help') || argv.include?('-h')
      show_help
      return
    end

    project_name = argv[0]

    if Dir.exist?(project_name)
      puts "Error: Directory '#{project_name}' already exists."
      exit 1
    end

    create_project_structure(project_name)
    create_files(project_name)
    
    puts "✓ Successfully created PCB project: #{project_name}/"
  end

  private

  def show_version
    puts "pcb-init #{VERSION}"
  end

  def show_help
    puts <<~HELP
      pcb-init - Scaffold a best-practice KiCad PCB project structure

      Usage:
        pcb-init PROJECT_NAME

      Options:
        -h, --help       Show this help message
        -v, --version    Show version number

      Example:
        pcb-init my-awesome-board
    HELP
  end

  def create_project_structure(project_name)
    directories = [
      "#{project_name}/docs",
      "#{project_name}/schematic",
      "#{project_name}/pcb",
      "#{project_name}/libraries/symbols",
      "#{project_name}/libraries/footprints",
      "#{project_name}/libraries/3d_models",
      "#{project_name}/bom",
      "#{project_name}/manufacturing/gerbers",
      "#{project_name}/manufacturing/drill",
      "#{project_name}/manufacturing/pick_and_place",
      "#{project_name}/manufacturing/panel",
      "#{project_name}/assembly",
      "#{project_name}/images",
      "#{project_name}/revisions/rev_A",
      "#{project_name}/firmware/source",
      "#{project_name}/firmware/binaries"
    ]

    directories.each do |dir|
      FileUtils.mkdir_p(dir)
    end
  end

  def create_files(project_name)
    create_readme(project_name)
    create_changelog(project_name)
    create_design_rules(project_name)
    create_gitignore(project_name)
  end

  def create_readme(project_name)
    content = <<~README
      # #{project_name}

      PCB project description goes here.
    README

    File.write("#{project_name}/README.md", content)
  end

  def create_changelog(project_name)
    content = <<~CHANGELOG
      # Changelog

      ## Rev A

      - Initial project setup
    CHANGELOG

    File.write("#{project_name}/docs/changelog.md", content)
  end

  def create_design_rules(project_name)
    content = <<~DESIGN_RULES
      # Design Rules

      ## PCB Specifications

      - Minimum trace width: TBD
      - Minimum via size: TBD
      - Board thickness: TBD
      - Layer count: TBD

      ## Manufacturing Notes

      Add your design rules and constraints here.
    DESIGN_RULES

    File.write("#{project_name}/pcb/design_rules.md", content)
  end

  def create_gitignore(project_name)
    content = <<~GITIGNORE
      # KiCad project files
      *.kicad_pcb-bak
      *.kicad_sch-bak
      *.kicad_prl
      *.kicad_pro
      *.kicad_dru
      *.kicad_wks
      *.kicad_pcb
      *.kicad_sch
      *.net
      *.dsn
      *.ses
      *.xml
      *.lst
      *.rpt
      *.erc
      *.drc
      *.kicad_mod
      *.kicad_sym
      cache.lib
      fp-lib-table
      sym-lib-table

      # Manufacturing outputs
      *.gbr
      *.drl
      *.gbrjob
      *.zip
      *.tar.gz

      # Assembly files
      *.pos
      *.csv
      *.bom

      # Temporary files
      *~
      .DS_Store
      Thumbs.db
    GITIGNORE

    File.write("#{project_name}/.gitignore", content)
  end
end
