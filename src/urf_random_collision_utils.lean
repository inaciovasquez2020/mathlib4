-- src/urf_random_collision_utils.lean
import URF.urf_base
import URF.urf_config
import URF.urf_lemmas
import URF.urf_cycle_expanders
import URF.urf_entropy_depth
import URF.urf_oblivion_atoms
import URF.urf_experiments_utils
import URF.urf_cycle_rigidity

/-!
# URF Random Collision & Type-Counting Utilities
Functions to simulate FO^k configuration collisions, compute local type counts,
and perform combinatorial experiments for rigidity analysis.
-/

namespace URF

/-!
## Randomized FO^k Config Generator
-/
def randomFOkConfig (nodes edges : Nat) : FOkConfig :=
  { k := 3, nodes := nodes, edges := edges }

/-!
## Count collisions in a list of configurations
-/
def countCollisions (cfgs : List FOkConfig) : Nat :=
  cfgs.foldl
    (fun acc cfg =>
      acc + (cfg.nodes * cfg.edges) % 3) 0  -- simple collision proxy

/-!
## Compute local type diversity for a set of expanders
-/
def localTypeDiversity (expanders : List CycleExpander) : Nat :=
  expanders.foldl (fun acc exp => acc + exp.cycles + exp.nodes) 0

/-!
## Experimental: merge and update ED(F) with collisions
-/
def mergeEDWithCollisions (ed : EntropyDepth) (cfgs : List FOkConfig) (expanders : List CycleExpander) : EntropyDepth :=
  { total := ed.total + countCollisions cfgs + localTypeDiversity expanders,
    configs := ed.configs ++ cfgs,
    expanders := ed.expanders ++ expanders }

/-!
## Example lemma: merging increases total
-/
lemma mergeEDWithCollisions_increases (ed : EntropyDepth) (cfgs : List FOkConfig) (expanders : List CycleExpander) :
  (mergeEDWithCollisions ed cfgs expanders).total ≥ ed.total := by
  simp [mergeEDWithCollisions, countCollisions, localTypeDiversity]

end URF
