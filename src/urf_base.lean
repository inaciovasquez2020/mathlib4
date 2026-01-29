namespace URF

/-!
# URF Base Module
Core FOᵏ structures, nodes, edges, and configurations.
-/

structure FOkConfig where
  k : Nat           -- FOᵏ width
  nodes : Nat       -- number of nodes
  edges : Nat       -- number of edges

-- Typeclass for configuration operations
class ConfigOps (C : Type) where
  addEdge : C → C
  addNode : C → C

end URF
