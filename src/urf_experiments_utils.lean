-- src/urf_experiments_utils.lean
import URF.urf_base
import URF.urf_config
import URF.urf_lemmas
import URF.urf_cycle_expanders
import URF.urf_entropy_depth
import URF.urf_oblivion_atoms

/-!
# URF Experimental Utilities
Helper functions for building configurations, counting collisions,
and running small combinatorial experiments.
-/

namespace URF

/-!
## Example Utility: repeat a configuration n times
-/
def repeatConfig (cfg : FOkConfig) (n : Nat) : List FOkConfig :=
  List.replicate n cfg

/-!
## Count total nodes in a list of configs
-/
def totalNodes (cfgs : List FOkConfig) : Nat :=
  cfgs.foldl (fun acc cfg => acc + cfg.nodes) 0

/-!
## Count total edges in a list of configs
-/
def totalEdges (cfgs : List FOkConfig) : Nat :=
  cfgs.foldl (fun acc cfg => acc + cfg.edges) 0

/-!
## Experimental: merge two ED(F) instances
-/
def mergeED (ed1 ed2 : EntropyDepth) : EntropyDepth :=
  { total := ed1.total + ed2.total,
    configs := ed1.configs ++ ed2.configs,
    expanders := ed1.expanders ++ ed2.expanders }

/-!
## Example lemma: merging increases total
-/
lemma merge_increases_total (ed1 ed2 : EntropyDepth) :
  (mergeED ed1 ed2).total ≥ ed1.total := by
  simp [mergeED]

end URF
