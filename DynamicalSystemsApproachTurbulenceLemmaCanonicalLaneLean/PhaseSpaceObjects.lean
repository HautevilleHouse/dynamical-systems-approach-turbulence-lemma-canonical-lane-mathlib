import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

abbrev PhaseVariable := ℝ
abbrev PhaseSpace := Fin 3 → PhaseVariable
abbrev Time := ℝ
abbrev VectorField := Time → PhaseSpace → PhaseSpace

def zeroVectorField : VectorField := fun _ _ => fun i => 0

structure DynamicalSystem where
  state : PhaseSpace
  vectorField : VectorField
  dimension : ℕ
  dimensionPositive : dimension > 0

structure TurbulenceData where
  velocityField : VectorField
  reynoldsNumber : ℝ
  energySpectrum : ℝ → ℝ
  dissipationRate : ℝ
  kolmogorovScale : ℝ

structure TurbulenceOperators where
  timeDerivative : VectorField → VectorField
  convection : VectorField → VectorField
  diffusion : VectorField → VectorField
  production : VectorField → VectorField
  dissipation : VectorField → VectorField
  projection : VectorField → VectorField
  projectionIdempotent : ∀ u, projection (projection u) = projection u

def primitiveTurbulenceOperators : TurbulenceOperators := {
  timeDerivative := fun u => zeroVectorField
  convection := fun u => zeroVectorField
  diffusion := fun u => u
  production := fun u => zeroVectorField
  dissipation := fun u => zeroVectorField
  projection := fun u => u
  projectionIdempotent := by intro u; rfl
}

structure TurbulentFlow where
  dynamics : DynamicalSystem
  turbulence : TurbulenceData
  operators : TurbulenceOperators
  viscosity : ℝ
  viscosityPositive : viscosity > 0

def primitiveTurbulentFlow : TurbulentFlow := {
  dynamics := {
    state := fun i => 0
    vectorField := zeroVectorField
    dimension := 3
    dimensionPositive := by decide
  }
  turbulence := {
    velocityField := zeroVectorField
    reynoldsNumber := 0
    energySpectrum := fun _ => 0
    dissipationRate := 0
    kolmogorovScale := 0
  }
  operators := primitiveTurbulenceOperators
  viscosity := 1
  viscosityPositive := by norm_num
}

def Incompressible (F : TurbulentFlow) : Prop :=
  F.dynamics.vectorField = zeroVectorField

def Dissipative (F : TurbulentFlow) : Prop :=
  F.turbulence.dissipationRate ≥ 0

def TurbulenceEquationClosed (F : TurbulentFlow) : Prop :=
  Incompressible F ∧ Dissipative F

theorem primitive_turbulence_projection_idempotent (u : VectorField) :
    primitiveTurbulenceOperators.projection (primitiveTurbulenceOperators.projection u) =
    primitiveTurbulenceOperators.projection u := by
  rfl

theorem primitive_flow_incompressible_checked : Incompressible primitiveTurbulentFlow := by
  rfl

theorem primitive_flow_dissipative_checked : Dissipative primitiveTurbulentFlow := by
  rfl

theorem primitive_flow_equation_closed_checked : TurbulenceEquationClosed primitiveTurbulentFlow := by
  exact And.intro primitive_flow_incompressible_checked primitive_flow_dissipative_checked

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse