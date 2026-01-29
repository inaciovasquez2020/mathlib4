import URF.urf_config

namespace URF

/-!
# URF Lemmas
Basic lemmas for configurations.
-/

lemma trivial_edges_zero (n : Nat) : (trivialConfig n).edges = 0 := by rfl
lemma trivial_nodes_n (n : Nat) : (trivialConfig n).nodes = n := by rfl

end URF
