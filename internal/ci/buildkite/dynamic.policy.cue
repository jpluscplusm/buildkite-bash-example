package pipeline

import "encoding/json"

ENV: _

#branchesPermittedToDeploy: "main" | "staging" | "qa"

if json.Marshal(ENV.BUILDKITE_BRANCH & #branchesPermittedToDeploy) == _|_ {
	#Step: command?: !~"Deploy"
}
