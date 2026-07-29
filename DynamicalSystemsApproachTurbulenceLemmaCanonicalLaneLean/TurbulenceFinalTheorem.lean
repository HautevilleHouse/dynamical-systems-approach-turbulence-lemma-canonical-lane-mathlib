import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

def ConstrainedTurbulenceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_turbulence_endgame (A : AdmissibleClass) : ConstrainedTurbulenceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse