# Submitting to Typst Universe

Instructions for submitting Metropolyst to the [typst/packages](https://github.com/typst/packages) repository.

## Reference Documentation

- [Typst Packages Submission Guide](https://github.com/typst/packages/blob/main/docs/README.md)
- [Typst Packages Tips](https://github.com/typst/packages/blob/main/docs/tips.md)

---

## New Package Submission

### 1. Fork and clone with sparse checkout

Fork [typst/packages](https://github.com/typst/packages) on GitHub, then clone your fork:

```bash
git clone --depth 1 --no-checkout --filter="tree:0" git@github.com:YOUR_USERNAME/packages
cd packages
git sparse-checkout init
git sparse-checkout set packages/preview/metropolyst
git remote add upstream git@github.com:typst/packages
git config remote.upstream.partialclonefilter tree:0
git checkout main
```

### 2. Create package directory and copy files

```bash
mkdir -p packages/preview/metropolyst/0.1.0
cd packages/preview/metropolyst/0.1.0
~/projects/metropolyst/scripts/copy-to-packages.sh ~/projects/metropolyst
```

### 3. Submit pull request

```bash
cd ~/path/to/packages
git add packages/preview/metropolyst
git commit -m "Add metropolyst 0.1.0 - configurable Metropolis theme for Touying"
git push origin main
```

Create a pull request on GitHub from your fork to typst/packages.

---

## Package Version Update

### If you already have a sparse checkout clone

Update your local clone and add the new version:

```bash
cd packages
git fetch upstream
git rebase upstream/main
mkdir -p packages/preview/metropolyst/0.2.0
cd packages/preview/metropolyst/0.2.0
~/projects/metropolyst/scripts/copy-to-packages.sh ~/projects/metropolyst
```

### If starting fresh

```bash
git clone --depth 1 --no-checkout --filter="tree:0" git@github.com:YOUR_USERNAME/packages
cd packages
git sparse-checkout init
git sparse-checkout set packages/preview/metropolyst
git remote add upstream git@github.com:typst/packages
git config remote.upstream.partialclonefilter tree:0
git checkout main

mkdir -p packages/preview/metropolyst/0.2.0
cd packages/preview/metropolyst/0.2.0
~/projects/metropolyst/scripts/copy-to-packages.sh ~/projects/metropolyst
```

### Submit the update

```bash
cd ~/path/to/packages
git add packages/preview/metropolyst
git commit -m "Update metropolyst to 0.2.0"
git push origin main
```

Create a pull request on GitHub.

---

## Pre-submission Checklist

Before submitting, ensure:

- [ ] Version in `typst.toml` matches directory name
- [ ] Version in `template/main.typ` import matches `typst.toml`
- [ ] Version in `README.md` examples matches `typst.toml`
- [ ] All examples compile: `for f in examples/example-*.typ; do typst compile --root . "$f"; done`
- [ ] Template compiles with `@preview` import (see WORKPLAN.md Phase 6)
