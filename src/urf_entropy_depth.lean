-- src/urf_entropy_depth.lean
import URF.urf_base
import URF.urf_config
import URF.urf_lemmas
import URF.urf_cycle_expanders

/-!
# URF Entropy-Depth Module
This module formalizes a simple version of the EntropyDepth invariant (ED(F)),
integrated with existing URF structures: FOkConfig and CycleExpander.
-/

namespace URF

/-!
## EntropyDepth Structure

Tracks total "entropy" and keeps references to configurations.
-/
structure EntropyDepth where
  total : Nat                  -- Total ED(F) measure
  configs : List FOkConfig     -- List of configurations
  expanders : List CycleExpander -- Cycle-expander gadgets

/-!
## Basic Constructors
-/

-- Create an empty ED instance
def emptyED : EntropyDepth :=
  { total := 0, configs := [], expanders := [] }

-- Add a FO^k configuration, increment total entropy linearly
def addConfig (ed : EntropyDepth) (cfg : FOkConfig) : EntropyDepth :=
  { ed with total := ed.total + cfg.nodes + cfg.edges, configs := cfg :: ed.configs }

-- Add a cycle-expander gadget, increment total entropy
def addExpander (ed : EntropyDepth) (exp : CycleExpander) : EntropyDepth :=
  { ed with total := ed.total + exp.nodes + exp.edges + exp.cycles, expanders := exp :: ed.expanders }

/-!
## Example Lemmas
-/

lemma addConfig_increases (ed : EntropyDepth) (cfg : FOkConfig) :
  (addConfig ed cfg).total ≥ ed.total := by
  simp [addConfig]

lemma addExpander_increases (ed : EntropyDepth) (exp : CycleExpander) :
  (addExpander ed exp).total ≥ ed.total := by
  simp [addExpander]

/-!
## Utility Function: compute ED(F) from a list of configs
-/
def computeED (cfgs : List FOkConfig) : Nat :=
  cfgs.foldl (fun acc cfg => acc + cfg.nodes + cfg.edges) 0

end URF

