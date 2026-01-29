# Unified Rigidity Framework (URF) — Experimental Fork

This repository contains an **independent fork of Lean’s `mathlib4`** with a modular framework for experimenting with FOᵏ configurations, cycle expanders, entropy-depth invariants, and hypergraph gadgets.

All modules are authored by **Inacio F. Vasquez** and form a **self-contained URF experiment library**.

---
python3 -m pip install --user pre-commit
export PATH="$HOME/Library/Python/3.9/bin:$PATH"  # adjust for your Python version
pre-commit install
Branch
urf-experiment — contains all URF modules and experimental work
Modules
File	Description
src/urf_base.lean	Core FOᵏ structures (FOkConfig) and typeclasses (ConfigOps)
src/urf_config.lean	Configuration generators, trivial examples, ConfigOps instances
src/urf_lemmas.lean	Basic lemmas for configurations (edges, nodes)
src/urf_experiments.lean	Experimental functions (growConfig, doubleEdges)
src/urf_cycle_expanders.lean	Cycle-expander gadgets, trivial expanders, FOᵏ conversions
src/urf_entropy_depth.lean	EntropyDepth structure, ED(F) computations, addConfig/addExpander
src/urf_oblivion_atoms.lean	Hypergraph gadget structures, trivial gadgets, conversions
src/urf_experiments_utils.lean	Utilities for configs: repeatConfig, totalNodes, totalEdges, mergeED
src/urf_cycle_rigidity.lean	FOᵏ local rigidity predicates, gadget rigidity lemmas
src/urf_random_collision_utils.lean	Random FOᵏ config generator, collision counting, type-diversity
Building and Verification
lake build
Compiles all URF modules.
Verified Lean 4 build, no errors.
Pre-commit hooks can automatically fix formatting issues.
License & IP
All URF modules are original work by Inacio F. Vasquez.
Using mathlib4 as a dependency does not affect ownership.
This fork is proprietary / experimental, suitable for research, testing, or further development.
Contact
Author: Inacio F. Vasquez
GitHub: inaciovasquez2020
Email: inacio@vasquezresearch.com
## **Getting Started**

### Prerequisites
- Lean 4 (tested with v4.28.0-rc1)
- Lake build system
- Optional: `pre-commit` hooks for formatting checks

### Clone & Setup
```bash
git clone https://github.com/inaciovasquez2020/mathlib4.git
cd mathlib4
lake build
