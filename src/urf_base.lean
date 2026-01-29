namespace URF

/-!
# URF Base Module
Core FOᵏ structures, nodes, edges, and configurations.
-/

structure FOkConfig where
  k : Nat
  nodes : Nat
  edges : Nat

class ConfigOps (C : Type) where
  addEdge : C → C
  addNode : C → C

end URF
