package pipeline

import (
	"encoding/yaml"
	"tool/os"
	"tool/cli"
)

ENV: command.emit_dynamic_steps.env
dynamic_steps: [...]

command: emit_dynamic_steps: {
	env:  os.Environ
	emit: cli.Print & {
		text: yaml.Marshal({steps: dynamic_steps})
	}
}
