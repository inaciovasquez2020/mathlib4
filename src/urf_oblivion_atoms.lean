-- src/urf_oblivion_atoms.lean
import URF.urf_base
import URF.urf_config
import URF.urf_lemmas
import URF.urf_cycle_expanders
import URF.urf_entropy_depth

/-!
# URF Oblivion Atom / Hypergraph Gadgets
Finite hypergraph gadgets for FOᵏ local rigidity experiments.
-/

namespace URF

/-!
## Hypergraph Gadget Structure
-/
structure HypergraphGadget where
  vertices : Nat           -- number of vertices
  edges : Nat              -- number of edges
  maxDegree : Nat          -- maximum degree of any vertex
  cycles : Nat             -- number of cycles in the gadget

/-!
## Constructors
-/

-- Create a trivial gadget with no cycles
def trivialGadget (n : Nat) : HypergraphGadget :=
  { vertices := n, edges := n, maxDegree := 2, cycles := 0 }

-- Add a cycle to the gadget
def addCycle (g : HypergraphGadget) : HypergraphGadget :=
  { g with cycles := g.cycles + 1 }

/-!
## Basic Lemmas
-/

lemma addCycle_increases_cycles (g : HypergraphGadget) :
  (addCycle g).cycles = g.cycles + 1 := by
  rfl

lemma trivial_vertices_positive (n : Nat) :
  (trivialGadget n).vertices = n := by
  rfl

/-!
## Conversion Functions
-/

-- Convert a FO^k configuration to a trivial gadget
def FOk_to_gadget (cfg : FOkConfig) : HypergraphGadget :=
  { vertices := cfg.nodes, edges := cfg.edges, maxDegree := 3, cycles := 0 }

-- Convert a CycleExpander to a gadget
def Expander_to_gadget (exp : CycleExpander) : HypergraphGadget :=
  { vertices := exp.nodes, edges := exp.edges, maxDegree := 4, cycles := exp.cycles }

end URF
