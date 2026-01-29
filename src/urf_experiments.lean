import URF.urf_base
import URF.urf_config
import URF.urf_lemmas

namespace URF

/-!
# URF Experiments
Experimental functions for configurations.
-/

def doubleEdges (cfg : FOkConfig) : FOkConfig :=
  { cfg with edges := cfg.edges * 2 }

def growConfig (cfg : FOkConfig) : FOkConfig :=
  cfg.addNode.addEdge.addEdge  -- add 1 node, 2 edges

lemma grow_edges_positive (cfg : FOkConfig) :
  (growConfig cfg).edges ≥ cfg.edges := by
  simp [growConfig, addEdge]

end URF
