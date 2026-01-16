# pcb-init

A Ruby CLI tool that scaffolds a **best-practice KiCad PCB project structure**.

## Installation

```bash
gem install pcb-init
```

## Usage

```bash
pcb-init PROJECT_NAME
```

## Example

```bash
pcb-init my-awesome-board
```

This will create a well-organized folder structure:

```
my-awesome-board/
├── README.md
├── docs/
│   └── changelog.md
├── schematic/
├── pcb/
│   └── design_rules.md
├── libraries/
│   ├── symbols/
│   ├── footprints/
│   └── 3d_models/
├── bom/
├── manufacturing/
│   ├── gerbers/
│   ├── drill/
│   ├── pick_and_place/
│   └── panel/
├── assembly/
├── images/
├── revisions/
│   └── rev_A/
├── firmware/
│   ├── source/
│   └── binaries/
└── .gitignore
```

## Features

- Clean, organized folder structure following PCB project best practices
- Pre-configured `.gitignore` for KiCad and manufacturing files
- Ready-to-use templates for documentation
- No external dependencies (pure Ruby)

## Requirements

- Ruby ≥ 3.0

## License

MIT
