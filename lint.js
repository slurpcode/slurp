const { exec } = require('@actions/exec');
const core = require('@actions/core');

async function run() {
  try {
    const pythonCommand = 'python';
    const pythonArgs = ['-m', 'flake8', '--config', './.github/linters/.flake8'];
    await exec(pythonCommand, pythonArgs);



    const goCommand = 'golangci-lint';
    const goArgs = ['run'];
    await exec(goCommand, goArgs);


    console.log('Linting successful');
  } catch (error) {
    console.log(error);
    core.setFailed(error.message);
  }
}

(async () => {
  await run();
})();
