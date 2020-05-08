# action-getnext-tag
`yyyymmdd_nn` 形式のtag名を取得する

# example

```yml
name: Post Tag

on:
  pull_request:
    branches:
      - master
    types: [closed]

jobs:
  post_tag:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - uses: ayumu838/action-get-next-tag@v1.0.0
        id: get-next-tag

      - uses: actions-ecosystem/action-push-tag@v1
        if: ${{ github.event.pull_request.merged == true }}
        with:
          tag: '${{ steps.get-next-tag.outputs.next-tag }}'
          message: 'PR #${{ github.event.pull_request.number }} ${{ github.event.pull_request.title }}'
```
