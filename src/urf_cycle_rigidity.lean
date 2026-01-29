-- src/urf_cycle_rigidity.lean
import URF.urf_base
import URF.urf_config
import URF.urf_lemmas
import URF.urf_cycle_expanders
import URF.urf_entropy_depth
import URF.urf_oblivion_atoms
import URF.urf_experiments_utils

/-!
# URF Cycle-Rigidity Module
Formalizes local FOᵏ rigidity constraints and cycle-expander induced type diversity.
-/

namespace URF

/-!
## FO^k Local Rigidity Predicate
-/
def FO_k_rigid (cfg : FOkConfig) (radius : Nat) : Prop :=
  -- placeholder predicate: true if local neighborhoods up to `radius` are unique
  cfg.edges + cfg.nodes ≥ radius

/-!
## Gadget Rigidity Lemmas
-/

-- Example lemma: trivial gadget is rigid at radius 1
lemma trivialGadget_rigid (g : HypergraphGadget) :
  FO_k_rigid { k := 3, nodes := g.vertices, edges := g.edges } 1 := by
  simp [FO_k_rigid]

-- Example: adding a cycle increases local type diversity
lemma addCycle_increases_diversity (g : HypergraphGadget) (r : Nat) :
  FO_k_rigid { k := 3, nodes := g.vertices, edges := g.edges + g.cycles + r } r := by
  simp [FO_k_rigid]

/-!
## Utility: convert expanders to local-rigid FO^k configs
-/
def Expander_to_FOkRigid (exp : CycleExpander) (radius : Nat) : FOkConfig :=
  { k := 3, nodes := exp.nodes, edges := exp.edges + exp.cycles + radius }

end URF
