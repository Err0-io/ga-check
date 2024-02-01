# err0-check-action

## Description
This GitHub Action, named `err0-check-action`, is designed to perform err0 action checks. It verifies errors and checks associated with a specific repository.

## Branding
- Icon: mic
- Color: green

## Inputs
The following inputs are required for the action to run successfully:

- `ERR0_JSON`
  - Description: Variable de entorno ERR0_JSON
  - Required: true

- `REPO_URL`
  - Description: Url of repository
  - Required: true

- `GH_TOKEN`
  - Description: Github token with read and write permissions
  - Required: true

## Runs Using
- Docker

## Image
- Dockerfile

## Environment Variables
The action uses the following environment variables:

- `REPO_URL`: The repository https url
- `ERR0_JSON`: The err0 jason stored in secrets variable
- `GH_TOKEN`: The GitHub token with read and write permissions

## Example Usage
```yaml
on: [push]

jobs:
  err0-check:
    runs-on: ubuntu-latest
    name: Check err0
    - name: Run err0-check-action
      uses: Err0-io/ga-check@v1
      with:
        ERR0_JSON: ${{ secrets.ERR0_JSON }}
        REPO_URL: ${{ secrets.REPO_URL }}
        GH_TOKEN: ${{ secrets.GH_TOKEN }}
