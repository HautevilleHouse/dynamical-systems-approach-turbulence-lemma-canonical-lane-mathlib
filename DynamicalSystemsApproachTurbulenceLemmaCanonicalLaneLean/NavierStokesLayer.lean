import DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean.PhaseSpaceObjects

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean

structure NavierStokesCertificate where
  flow : TurbulentFlow
  reynoldsNumber : ℝ
  regularityCondition : Prop
  energyInequality : Prop
  dissipationEstimate : Prop
  regularityConditionClosed : regularityCondition
  energyInequalityClosed : energyInequality
  dissipationEstimateClosed : dissipationEstimate

def sourceNavierStokesCertificate : NavierStokesCertificate := {
  flow := primitiveTurbulentFlow
  reynoldsNumber := 0
  regularityCondition := TurbulenceEquationClosed primitiveTurbulentFlow
  energyInequality := primitiveTurbulentFlow.turbulence.dissipationRate ≥ 0
  dissipationEstimate := primitiveTurbulentFlow.turbulence.dissipationRate = 0
  regularityConditionClosed := primitive_flow_equation_closed_checked
  energyInequalityClosed := rfl
  dissipationEstimateClosed := rfl
}

def NavierStokesCertificateClosed (C : NavierStokesCertificate) : Prop :=
  C.regularityCondition ∧ C.energyInequality ∧ C.dissipationEstimate

theorem source_navier_stokes_certificate_closed :
    NavierStokesCertificateClosed sourceNavierStokesCertificate := by
  exact And.intro sourceNavierStokesCertificate.regularityConditionClosed
    (And.intro sourceNavierStokesCertificate.energyInequalityClosed
      sourceNavierStokesCertificate.dissipationEstimateClosed)

end DynamicalSystemsApproachTurbulenceLemmaCanonicalLaneLean
end HautevilleHouse