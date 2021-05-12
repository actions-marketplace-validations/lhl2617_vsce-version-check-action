# `vsce-version-check-action`

Check whether your current VSCode Extension version is a publishable version on the VSCode Marketplace.

## Inputs

### `extension-publisher`

**Required** Extension publisher.

### `extension-name`

**Required** Extension name.

### `extension-version`

**Required** Extension version (to be published).

### `fail-if-unpublished`

Fail if extension is unpublished on the Marketplace. Default `"false"`.
