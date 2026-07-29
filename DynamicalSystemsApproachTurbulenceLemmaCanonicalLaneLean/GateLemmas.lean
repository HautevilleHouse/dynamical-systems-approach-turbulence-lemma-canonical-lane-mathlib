import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse