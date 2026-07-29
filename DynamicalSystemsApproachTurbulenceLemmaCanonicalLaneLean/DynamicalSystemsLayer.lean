import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure DynamicalSystem where
  stateSpace : Type
  time : Type
  flow : time → stateSpace → stateSpace
  invariantMeasure : Set (stateSpace → Prop)

def trivialDynamicalSystem : DynamicalSystem := {
  stateSpace := Unit,
  time := ℝ,
  flow := fun _ _ => (),
  invariantMeasure := {}
}

structure TurbulenceOperator where
  velocityField : ℝ → ℝ³ → ℝ³
  vorticityField : ℝ → ℝ³ → ℝ³
  reynoldsNumber : ℝ
  energySpectrum : ℝ → ℝ

def primitiveTurbulenceOperator : TurbulenceOperator := {
  velocityField := fun _ _ => (0,0,0),
  vorticityField := fun _ _ => (0,0,0),
  reynoldsNumber := 0,
  energySpectrum := fun _ => 0
}

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse
