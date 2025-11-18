# Terraform Modules

This directory contains reusable Terraform modules for common infrastructure components.

## Module Structure

Each module should follow this structure:

```
modules/
  module-name/
    main.tf          # Resource definitions
    variables.tf     # Input variables
    outputs.tf       # Output values
    versions.tf      # Provider version constraints
    README.md        # Module documentation
```

## Usage

Modules can be called from environment configurations:

```hcl
module "example" {
  source = "../../modules/example"
  
  variable1 = "value1"
  variable2 = "value2"
}
```

## Available Modules

Modules will be added here as infrastructure components are developed.

