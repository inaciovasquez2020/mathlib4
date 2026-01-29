-- src/urf_example.lean
import Mathlib.Algebra.Group.Basic
import Mathlib.Data.Nat.Basic

/-!
# URF Experiment Module

This is a test file for URF-related formalization.
-/

namespace URF

-- Example: define a simple type for FO^k configurations
structure FOkConfig where
  k : Nat
  nodes : Nat
  edges : Nat

-- Example: a function to create a trivial configuration
def trivialConfig (n : Nat) : FOkConfig :=
  { k := 3, nodes := n, edges := 0 }

-- Example lemma
lemma trivial_edges_zero (n : Nat) : (trivialConfig n).edges = 0 := by
  rfl

end URF
