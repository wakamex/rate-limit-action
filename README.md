# GitHub Rate Limit Information Action

This GitHub action displays detailed rate limit information of your GitHub API usage. This information includes the total limit, remaining limit, used limit, time of rate limit reset, and the time remaining until the reset.

## Inputs

### `token`

**Optional** The GitHub token to be used for authenticated requests. If not provided, the action will make unauthenticated requests.

## Usage

Add a step in your GitHub Actions workflow file that uses this action:

```yaml
steps:
  - name: Check rate limit without token
    uses: wakamex/rate-limit-action@v1
```

Or, with a GitHub token:

```yaml
steps:
  - name: Check rate limit with token
    uses: wakamex/rate-limit-action@v1
    with:
      token: ${{ secrets.GH_GITHUB_COM_TOKEN}}
```

Replace `GH_GITHUB_COM_TOKEN` with your secret token's name if it differs.

## Output

The action will display output similar to the following:

```
Rate limit information:
Resource: core
Total limit: 60
Remaining: 60
Used: 0
The rate limit will reset at 2023-07-06 18:22:15 UTC
Time remaining until reset: 3599 seconds (59 minutes)
```

## License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
