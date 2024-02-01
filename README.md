# err0-check-action

## Description
This GitHub Action, named `err0-check-action`, is designed to perform err0 action checks. It verifies errors and checks associated with a specific repository.

## Disclaimer ⚠️
err0-action-check does not have automatic support for pull requests. But you can define the branch you want to target. In case you don't define any branch and execute a pull request it will always point to the main branch.

## Inputs
The following inputs are required for the action to run successfully:

- `ERR0_JSON`
  - Description: The err0 json stored in action secrets
  - Required: true

- `REPO_URL`
  - Description: Url of repository
  - Required: true

- `GH_TOKEN`
  - Description: Github token with read and write permissions
  - Required: true

- `BRANCH_NAME`
  - Description: Focus our action only on a specific branch. If nothing is declared, the push branch will be referenced. [Does not work in PR's]
  - Required: false

## Runs Using
- Docker

## Image
- Dockerfile

## Environment Variables
The action uses the following environment variables:

- `REPO_URL`: The repository https url
- `ERR0_JSON`: The err0 json stored in action secrets
- `GH_TOKEN`: The GitHub token with read and write permissions
- `BRANCH_NAME`: Focusing our Action only in a targeted branch.

## Example Usage
```yaml
on: [push]

jobs:
  err0-check:
    runs-on: ubuntu-latest
    name: Check err0
    - name: Run err0-check-action
      uses: Err0-io/ga-check@v2
      with:
        ERR0_JSON: ${{ secrets.ERR0_JSON }}
        REPO_URL: ${{ secrets.REPO_URL }}
        GH_TOKEN: ${{ secrets.GH_TOKEN }}
        BRANCH_NAME: main


```
## License
```
The err0-check-action is licensed under the MIT License. See the LICENSE file for details.
```

