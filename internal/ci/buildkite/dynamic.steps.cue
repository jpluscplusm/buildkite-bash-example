package pipeline

import "list"

ENV: {
	BUILDKITE_AGENT_ENDPOINT: *"test value" | _
	BUILDKITE_BRANCH:         *"test value" | _
}
dynamic_steps: list.FlattenN([
		{command: "echo dynamic step 1"},
		{command: "echo dynamic step 2"},
		{command: "echo The agent endpoint in use is \(ENV.BUILDKITE_AGENT_ENDPOINT)"},
		{command: "echo dynamic step 3"},
		if ENV.BUILDKITE_BRANCH == "main" {
		[ "wait",
			{
				command: "echo Deploy!"
				label:   ":rocket:"
			},
		]
	},
], 1)
