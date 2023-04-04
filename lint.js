/* eslint-disable */
const { exec } = require('@actions/exec');


async function run() {

  const pythonCommand = 'python';
  const pythonArgs = ['-m', 'flake8', '--config', './.github/linters/.flake8'];
  await exec(pythonCommand, pythonArgs);

  const nodeCommand = 'npx';
  const nodeArgs = ['eslint', '.'];
  await exec(nodeCommand, nodeArgs);

  const goCommand = 'golangci-lint';
  const goArgs = ['run'];
  await exec(goCommand, goArgs);

  const rubyCommand = 'rubocop';
  const rubyArgs = [];
  await exec(rubyCommand, rubyArgs);
}

(async () => {
  await run();
})();
