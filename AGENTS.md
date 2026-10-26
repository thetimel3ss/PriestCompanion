# Repository workflow

- Develop each new feature on its own branch created from main. Implement and test there before merging.
- After every completed change, create a descriptive commit and push it to GitHub on the working branch. Do not leave completed work only on this machine. This is standing maintainer authorization for routine commits and pushes of requested work.
- Merge into main only with explicit maintainer authorization. A push to a feature branch does not authorize a merge or release.
- Keep CHANGELOG.md updated for actual changes and validation results; keep ROADMAP.md focused on current scope and pending work. Do not report unexecuted tests as passed.
- Use MAJOR.MINOR.PATCH versions. Keep feature work under Unreleased until release approval, then update both TOCs and the Lua fallback together.
