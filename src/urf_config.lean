import URF.urf_base

namespace URF

/-!
# URF Configuration Generators
Functions to create trivial and standard FOᵏ configurations.
-/

def trivialConfig (n : Nat) : FOkConfig :=
  { k := 3, nodes := n, edges := 0 }

instance : ConfigOps FOkConfig where
  addEdge cfg := { cfg with edges := cfg.edges + 1 }
  addNode cfg := { cfg with nodes := cfg.nodes + 1 }

end URF
