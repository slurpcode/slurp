const { exec } = require('@actions/exec');
const core = require('@actions/core');


async function run() {
    try {
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

        console.log('Linting successful');
    } catch (error) {
        console.log(error);
        core.setFailed(error.message);
    }
}

(async () => {
    await run();
})();
