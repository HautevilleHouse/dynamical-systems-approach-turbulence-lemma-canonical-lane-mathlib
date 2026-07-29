import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.MathlibObjects
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

abbrev PhasePoint := ℝ × ℝ × ℝ
abbrev Time := ℝ
abbrev VectorField := Time → PhasePoint → PhasePoint

structure TurbulenceOperators where
  divergence : VectorField → VectorField
  gradient : VectorField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  nonlinearTerm : VectorField → VectorField

def primitiveTurbulenceOperators : TurbulenceOperators := {
  divergence := fun _ => λ _ _ => (0,0,0)
  gradient := fun _ => λ _ _ => (0,0,0)
  laplacian := fun u => u
  timeDerivative := fun _ => λ _ _ => (0,0,0)
  nonlinearTerm := fun _ => λ _ _ => (0,0,0)
}

structure NavierStokesFlow where
  velocity : VectorField
  pressure : PhasePoint → ℝ
  viscosity : ℝ
  operators : TurbulenceOperators

def primitiveFlow : NavierStokesFlow := {
  velocity := λ _ _ => (0,0,0)
  pressure := λ _ => 0
  viscosity := 1
  operators := primitiveTurbulenceOperators
}

def Incompressible (F : NavierStokesFlow) : Prop :=
  F.operators.divergence F.velocity = λ _ _ => (0,0,0)

def NavierStokesEquation (F : NavierStokesFlow) : Prop :=
  F.operators.timeDerivative F.velocity = F.operators.laplacian F.velocity + F.operators.nonlinearTerm F.velocity

theorem primitive_flow_incompressible : Incompressible primitiveFlow := by
  unfold Incompressible primitiveFlow primitiveTurbulenceOperators
  rfl

theorem primitive_flow_navier_stokes_equation : NavierStokesEquation primitiveFlow := by
  unfold NavierStokesEquation primitiveFlow primitiveTurbulenceOperators
  simp

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse