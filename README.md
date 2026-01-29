## Release / Versioned Snapshot

This fork contains a self-contained URF experimental library.
For reference or reproducibility, the **release branch** corresponding to commit `0b347bd13b2c437b377ed3f3e8b7800a1f385ab6` is:

**Branch:** [`urf-release-0b347b`](https://github.com/inaciovasquez2020/mathlib4/tree/urf-release-0b347b)

- This branch represents a stable snapshot of all URF modules:
  - `src/urf_base.lean`
  - `src/urf_config.lean`
  - `src/urf_lemmas.lean`
  - `src/urf_experiments.lean`
  - `src/urf_cycle_expanders.lean`
  - `src/urf_entropy_depth.lean`
  - `src/urf_oblivion_atoms.lean`
  - `src/urf_experiments_utils.lean`
  - `src/urf_cycle_rigidity.lean`
  - `src/urf_random_collision_utils.lean`

- Verified Lean 4 build (`lake build`)
- Pre-commit formatting and end-of-file fixes applied

> Use this branch if you want a **stable, reproducible URF fork** for experimentation, research, or reference.
